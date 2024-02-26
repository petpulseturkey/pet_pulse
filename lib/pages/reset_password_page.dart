import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pulse/components/my_button.dart';
import 'package:pet_pulse/components/my_textfield.dart';

class ResetPasswordPage extends StatelessWidget {
  final useremailController = TextEditingController();

  ResetPasswordPage({super.key});

  void resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Reset password permission has been sent. Please check your email.",
            ),
          ),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "Reset password permission has been failed. Please try again.\n${e.code.toUpperCase()}"),
          ),
        );
      }
    }
    useremailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Enter your email to reset your password!',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: useremailController,
                hintText: 'Email',
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () => resetPassword(context, useremailController.text),
                text: "Send",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
