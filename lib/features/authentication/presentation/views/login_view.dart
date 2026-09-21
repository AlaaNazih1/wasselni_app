import 'package:flutter/material.dart';
import 'package:wasselni/core/routes/app_routes.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/core/widgets/custom_text_button.dart';
import 'package:wasselni/core/widgets/custom_text_form_field.dart';
import 'package:wasselni/features/home/presentation/views/main_navigation_view.dart';

import '../../../../core/theme/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationView()),
      );
      
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login successful')));
    }
  }

  void _createAccount() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/wasselni_logo-removebg-preview.png',
                    width: 170,
                  ),
                ),

                const SizedBox(height: 35),

                // Welcome Text
                const Text(
                  'مرحباً بك في',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Wasselni',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 45),

                // Phone Label
                const Text(
                  'رقم الهاتف',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                // Phone Field
                CustomTextFormField(
                  controller: _phoneController,
                  hintText: '01XXXXXXXXX',
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل رقم الهاتف';
                    }

                    if (value.length != 11) {
                      return 'رقم الهاتف يجب أن يكون 11 رقم';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 22),

                // Password Label
                const Text(
                  'كلمة المرور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 8),

                // Password Field
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
                      return 'من فضلك أدخل كلمة المرور';
                    }

                    if (value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 35),

                // Login Button
                CustomButton(text: 'تسجيل الدخول', onPressed: _login),

                const SizedBox(height: 25),

                // Register
                CustomTextButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: _createAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
