import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(
    text: 'علاء نزيه',
  );

  final TextEditingController _phoneController = TextEditingController(
    text: '01000000000',
  );

  final TextEditingController _emailController = TextEditingController(
    text: 'alaa@example.com',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم حفظ البيانات بنجاح'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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

          CustomButton(text: 'حفظ التعديلات', onPressed: _saveChanges),
        ],
      ),
    );
  }
}
