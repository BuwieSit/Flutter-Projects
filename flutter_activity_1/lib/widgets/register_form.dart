import 'package:flutter/material.dart';
import 'package:flutter_activity_1/widgets/custom_text_field.dart';
import 'package:flutter_activity_1/widgets/button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username
            CustomTextField(
              controller: _usernameController,
              label: "Username",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your username";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Email
            CustomTextField(
              controller: _emailController,
              label: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Password
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
            const SizedBox(height: 16),

            // Confirm Password
            CustomTextField(
              controller: _confirmPasswordController,
              label: "Confirm Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please confirm your password";
                }
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            CustomButton(
              text: "Register",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Register:");
                  print(_usernameController.text);
                  print(_emailController.text);
                  print(_passwordController.text);
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
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}