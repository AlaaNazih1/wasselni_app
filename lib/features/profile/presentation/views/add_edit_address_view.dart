import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../controllers/address_controller.dart';

class AddEditAddressView extends ConsumerStatefulWidget {
  const AddEditAddressView({super.key, this.address});

  final Map<String, dynamic>? address;

  bool get isEditing => address != null;

  @override
  ConsumerState<AddEditAddressView> createState() => _AddEditAddressViewState();
}

class _AddEditAddressViewState extends ConsumerState<AddEditAddressView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _addressController;

  String _type = 'home';
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.address?['title'] ?? '',
    );

    _addressController = TextEditingController(
      text: widget.address?['address'] ?? '',
    );

    _type = widget.address?['type'] ?? 'home';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final controller = ref.read(addressControllerProvider);

      if (widget.isEditing) {
        await controller.updateAddress(
          addressId: widget.address!['id'],
          title: _titleController.text.trim(),
          address: _addressController.text.trim(),
          type: _type,
        );
      } else {
        await controller.addAddress(
          title: _titleController.text.trim(),
          address: _addressController.text.trim(),
          type: _type,
        );
      }

      ref.invalidate(addressesProvider);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditing
                ? 'تم تعديل العنوان بنجاح'
                : 'تم إضافة العنوان بنجاح',
          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          widget.isEditing ? 'تعديل العنوان' : 'إضافة عنوان',
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'اسم العنوان',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _titleController,
                  hintText: 'مثال: المنزل',
                  prefixIcon: const Icon(Icons.label_outline),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل اسم العنوان';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                const Text(
                  'نوع العنوان',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                DropdownButtonFormField<String>(
                  value: _type,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'home', child: Text('المنزل')),
                    DropdownMenuItem(value: 'work', child: Text('العمل')),
                    DropdownMenuItem(value: 'other', child: Text('أخرى')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _type = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 18),

                const Text(
                  'العنوان بالتفصيل',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _addressController,
                  hintText: 'مثال: ديروط - أسيوط',
                  prefixIcon: const Icon(Icons.home_outlined),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل العنوان';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: _isSaving ? 'جاري الحفظ...' : 'حفظ العنوان',
                  onPressed: _isSaving ? () {} : _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
