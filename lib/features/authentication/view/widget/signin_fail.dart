import 'package:flutter/material.dart';

class SigninFail extends StatelessWidget {
  const SigninFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset(
            'assets/images/auth_error.png',
            scale: 3,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Sign in failed. make sure your email and password has correctly',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFFEA4CC0),
              ),
            ),
            child: const Text(
              'Try Again',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
