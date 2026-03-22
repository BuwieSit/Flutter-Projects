import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/custom_text_field.dart';
import 'package:flutter_activity_1/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _userController,
              label: "Username or Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your username or email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            CustomTextField(
              controller: _passwordController,
              label: "Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Login button
            CustomButton(
              text: "Login",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final usernameOrEmail = _userController.text;
                  final password = _passwordController.text;
                  print('Login: $usernameOrEmail / $password');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}