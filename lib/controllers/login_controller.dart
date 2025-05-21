import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/login_model.dart';

class LoginController {
  final WidgetRef ref;

  LoginController(this.ref);

  void togglePasswordVisibility() {
    final current = ref.read(isPasswordVisibleProvider);
    ref.read(isPasswordVisibleProvider.notifier).state = !current;
  }

  void updateEmail(String value) {
    ref.read(emailProvider.notifier).state = value;
  }

  void updatePassword(String value) {
    ref.read(passwordProvider.notifier).state = value;
  }

  void login() {
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    // Simulate login or add your logic here
    print('Login with $email and $password');

    // Set loading state
    ref.read(isLoadingProvider.notifier).state = true;

    // Simulate login delay
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(isLoadingProvider.notifier).state = false;
    });
  }
}
