import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:wasselni/features/authentication/presentation/views/login_view.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterView extends ConsumerStatefulWidget  {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

   Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    await ref
        .read(authControllerProvider.notifier)
        .register(
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

    if (!mounted) return;

    final state = ref.read(authControllerProvider);

    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error.toString()),
          backgroundColor: AppColors.error,
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إنشاء الحساب بنجاح'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
    );
  }
  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,

      

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/wasselni_logo-removebg-preview.png',
                    width: 150,
                  ),
                ),

                const SizedBox(height: 25),

                // Title
                 Text(
                 l10n.createAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 6),

                 Text(
                  l10n.joinWasselni,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 35),

                // Name
                 Text(
                  l10n.fullName,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _nameController,
                  hintText: l10n.enterYourName,
                  textDirection: TextDirection.rtl,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.enterYourName;
                    }

                    if (value.trim().length < 3) {
                      return l10n.nameMinLength;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Phone
                 Text(
                  l10n.phoneNumber,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _phoneController,
                  hintText: l10n.hintPhoneNumber,
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.pleaseEnterPhone;
                    }

                    if (value.length != 11) {
                      return l10n.phoneMustBe11;
                    }

                    if (!value.startsWith('01')) {
                      return l10n.invalidPhone;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Email
                 Text(
                  l10n.email,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'example@email.com',
                  keyboardType: TextInputType.emailAddress,
                  textDirection: TextDirection.ltr,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.pleaseEnterEmail;
                    }

                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

                    if (!emailRegex.hasMatch(value.trim())) {
                      return l10n.invalidEmail;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Password
                 Text(
                  l10n.password,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _passwordController,
                  hintText: '••••••••',
                  obscureText: !_isPasswordVisible,
                  textDirection: TextDirection.ltr,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.pleaseEnterPassword;
                    }

                    if (value.length < 6) {
                      return l10n.passwordMinLength;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Confirm Password
                 Text(
                  l10n.confirmPassword,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFormField(
                  controller: _confirmPasswordController,
                  hintText: '••••••••',
                  obscureText: !_isConfirmPasswordVisible,
                  textDirection: TextDirection.ltr,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.pleaseConfirmPassword;
                    }

                    if (value != _passwordController.text) {
                      return l10n.passwordsDoNotMatch;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // Register Button
                CustomButton(text: l10n.register, onPressed: _register),

                const SizedBox(height: 15),

                // Login Button
                CustomTextButton(
                  text: l10n.alreadyHaveAccount,
                  onPressed: _goToLogin,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
