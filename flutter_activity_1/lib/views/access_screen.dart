
import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/login_form.dart';
import 'package:flutter_activity_1/widgets/register_form.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_no_bg.png',
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            // Dynamic title
            Text(
              isLogin ? "Login" : "Register",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Dynamic form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: isLogin
                  ? const LoginForm()
                  : const RegisterForm(), 
            ),

            const SizedBox(height: 20),

            // Toggle text
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(
                
                isLogin
                    ? "Don't have an account? Sign up"
                    : "Already have an account? Login",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}