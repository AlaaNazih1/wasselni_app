import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wasselni/features/profile/presentation/controllers/profile_controller.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({super.key});

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  File? _selectedImage;
  String? _currentImageBase64;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final profile = await ref.read(profileProvider.future);

      if (!mounted) return;

      if (profile != null) {
        _nameController.text = profile['name'] ?? '';
        _phoneController.text = profile['phone'] ?? '';
        _emailController.text = profile['email'] ?? '';

        _currentImageBase64 = profile['profileImageBase64'];
      }
    } catch (e) {
      debugPrint('PROFILE LOAD ERROR: $e');
    }

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();

      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 500,
        maxHeight: 500,
      );

      if (image == null) {
        return;
      }

      setState(() {
        _selectedImage = File(image.path);
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء اختيار الصورة: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final controller = ref.read(profileUpdateProvider);

      // حفظ البيانات الشخصية
      await controller.updateProfile(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
      );

      // حفظ الصورة لو المستخدم اختار صورة جديدة
      if (_selectedImage != null) {
        await controller.updateProfileImage(_selectedImage!);
      }

      // تحديث البيانات
      ref.invalidate(profileProvider);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ البيانات بنجاح'),
          backgroundColor: AppColors.success,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  ImageProvider? _getProfileImage() {
    // الصورة الجديدة التي اختارها المستخدم
    if (_selectedImage != null) {
      return FileImage(_selectedImage!);
    }

    // الصورة المحفوظة في Firestore
    if (_currentImageBase64 != null && _currentImageBase64!.isNotEmpty) {
      try {
        return MemoryImage(base64Decode(_currentImageBase64!));
      } catch (e) {
        debugPrint('IMAGE DECODE ERROR: $e');
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    final profileImage = _getProfileImage();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    backgroundImage: profileImage,
                    child: profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 55,
                            color: AppColors.primary,
                          )
                        : null,
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'البيانات الشخصية',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 12),

          CustomTextFormField(
            controller: _nameController,
            hintText: 'الاسم بالكامل',
            prefixIcon: const Icon(Icons.person_outline),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل الاسم';
              }

              if (value.trim().length < 3) {
                return 'الاسم يجب أن يكون 3 أحرف على الأقل';
              }

              return null;
            },
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: _phoneController,
            hintText: 'رقم الهاتف',
            prefixIcon: const Icon(Icons.phone_outlined),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل رقم الهاتف';
              }

              if (value.trim().length != 11) {
                return 'رقم الهاتف يجب أن يكون 11 رقم';
              }

              return null;
            },
          ),

          const SizedBox(height: 14),

          CustomTextFormField(
            controller: _emailController,
            hintText: 'البريد الإلكتروني',
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل البريد الإلكتروني';
              }

              if (!value.contains('@')) {
                return 'البريد الإلكتروني غير صحيح';
              }

              return null;
            },
          ),

          const SizedBox(height: 28),

          CustomButton(
            text: _isSaving ? 'جاري الحفظ...' : 'حفظ التعديلات',
            onPressed: _isSaving ? () {} : _saveChanges,
          ),
        ],
      ),
    );
  }
}
