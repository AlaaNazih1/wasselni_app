import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/core/routes/app_routes.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/core/widgets/custom_text_button.dart';
import 'package:wasselni/core/widgets/custom_text_form_field.dart';
import 'package:wasselni/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:wasselni/features/home/presentation/views/main_navigation_view.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
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

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ref
        .read(authControllerProvider.notifier)
        .login(
          phone: _phoneController.text.trim(),
          password: _passwordController.text.trim(),
        );

    if (!mounted) return;

    final state = ref.read(authControllerProvider);

    state.when(
      data: (_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainNavigationView()),
        );
      },
      loading: () {},
      error: (error, _) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      },
    );
  }

  void _createAccount() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
                Text(
                  l10n.welcomeTo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                Text(
                  l10n.phoneNumber,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
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
                      return l10n.enterPhoneNumber;
                    }

                    if (value.length != 11) {
                      return l10n.phoneNumberMustBe11Digits;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 22),

                // Password Label
                Text(
                  l10n.password,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
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
                      return l10n.enterPassword;
                    }

                    if (value.length < 6) {
                      return l10n.passwordMustBe6Characters;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 35),

                // Login Button
                CustomButton(text: l10n.login, onPressed: _login),

                const SizedBox(height: 25),

                // Register
                CustomTextButton(
                  text: l10n.createNewAccount,
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
