import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signup/views/signup_screen.dart';

import '../controllers/login_controller.dart';
import '../models/login_model.dart';
import '../widgets/social_login_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = LoginController(ref);
    final isPasswordVisible = ref.watch(isPasswordVisibleProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 80,
                  width: 120,
                ),
              ),
              const SizedBox(height: 40),
              Text('Welcome back 👋', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Text('Sign in to get access to your account', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              const SizedBox(height: 32),
          
              TextField(
                decoration: _inputDecoration('Email'),
                onChanged: controller.updateEmail,
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: !isPasswordVisible,
                decoration: _inputDecoration('Password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
                onChanged: controller.updatePassword,
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {}, // Add logic
                  child: const Text('Forgot password?',
                      style: TextStyle(color: Colors.redAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.redAccent,
                      )),
                ),
              ),
          
          
              const SizedBox(height: 30),
              Row(children: [
                Expanded(child: Divider(color: Colors.grey[300])),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('or sign in with'),
                ),
                Expanded(child: Divider(color: Colors.grey[300])),
              ]),
              const SizedBox(height: 30),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialLoginButton(
                    assetPath: 'assets/images/facebook.svg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()),
                        );
                      },
                  ),
                  SocialLoginButton(
                    assetPath: 'assets/images/google.svg',
                    onPressed: () {},
                  ),
                  SocialLoginButton(
                    assetPath: 'assets/images/Apple.svg',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Terms of use',style: TextStyle(color: Color(0xFF8F8F8F)),)
                  ),
                  const Text('|', style: TextStyle(color: Colors.grey)),
                  TextButton(onPressed: () {}, child: const Text('Privacy Policy'
                  ,style: TextStyle(color: Color(0xFF8F8F8F)
                      )
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
