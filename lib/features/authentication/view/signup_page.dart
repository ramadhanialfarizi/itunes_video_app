import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/authentication/view/widget/signup_fail.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../view_model/signup_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/splashscreen_icons.png',
                    scale: 20,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCC45F2),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Consumer<SignupProvider>(
                      builder: (context, signupProvider, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: signupProvider.usernameValid ? 70 : 50,
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                labelText: 'username',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                prefixIconColor: const Color(0xFFEA4CC0),
                                prefixIcon:
                                    const Icon(Icons.account_circle_rounded),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SignupProvider>()
                                      .usernameValidFalse();
                                  return '* please input your name';
                                }

                                context
                                    .read<SignupProvider>()
                                    .usernameValidTrue();
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: signupProvider.emailValid ? 70 : 50,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                labelText: 'Email',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                prefixIconColor: const Color(0xFFEA4CC0),
                                prefixIcon: const Icon(Icons.mail),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SignupProvider>()
                                      .emailValidFalse();
                                  return '* please input your email';
                                } else if (!EmailValidator.validate(value)) {
                                  context
                                      .read<SignupProvider>()
                                      .emailValidFalse();
                                  return '* please input your valid email';
                                }

                                context.read<SignupProvider>().emailValidTrue();

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: signupProvider.passwordValid ? 70 : 50,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: signupProvider.obscurePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                prefixIconColor: const Color(0xFFEA4CC0),
                                prefixIcon: const Icon(Icons.lock),
                                suffixIconColor: const Color(0xFFEA4CC0),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    context
                                        .read<SignupProvider>()
                                        .changeObsecurePassword();
                                  },
                                  child: signupProvider.obscurePassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
                                      : const Icon(Icons.remove_red_eye),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SignupProvider>()
                                      .passwordValidFalse();
                                  return '* please input your Password';
                                } else if (value.length < 8) {
                                  context
                                      .read<SignupProvider>()
                                      .passwordValidFalse();
                                  return '* Password must be have a 8 character';
                                }
                                context
                                    .read<SignupProvider>()
                                    .passwordValidTrue();
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height:
                                signupProvider.confirmPasswordValid ? 70 : 50,
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText:
                                  signupProvider.obscureConfirmPassword,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                labelText: 'Confirm Password',
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEA4CC0),
                                  ),
                                ),
                                prefixIconColor: const Color(0xFFEA4CC0),
                                prefixIcon: const Icon(Icons.lock_clock),
                                suffixIconColor: const Color(0xFFEA4CC0),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    context
                                        .read<SignupProvider>()
                                        .changeObscureConfirmPassword();
                                  },
                                  child: signupProvider.obscureConfirmPassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
                                      : const Icon(Icons.remove_red_eye),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SignupProvider>()
                                      .confirmPasswordValidFalse();
                                  return '* please confirm your Password';
                                }
                                if (value.length < 8) {
                                  context
                                      .read<SignupProvider>()
                                      .confirmPasswordValidFalse();
                                  return '* Password must be have a 8 character';
                                }
                                if (confirmPasswordController.text !=
                                    passwordController.text) {
                                  context
                                      .read<SignupProvider>()
                                      .confirmPasswordValidFalse();
                                  return '* Password not matched';
                                }

                                context
                                    .read<SignupProvider>()
                                    .confirmPasswordValidTrue();
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFEA4CC0),
                                ),
                              ),
                              onPressed: () async {
                                final validForm =
                                    formKey.currentState!.validate();

                                if (validForm) {
                                  var userModel = UserModel(
                                      email: emailController.text,
                                      password: passwordController.text);

                                  await context
                                      .read<SignupProvider>()
                                      .signupManually(userModel);

                                  if (signupProvider.messageError ==
                                      'Email already in use') {
                                    // ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      )),
                                      context: context,
                                      builder: (context) => const SignupFail(
                                          errorMessage: 'Email already in use'),
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Signup success!!'),
                                        duration: Duration(milliseconds: 800),
                                      ),
                                    );

                                    // ignore: use_build_context_synchronously
                                    context.read<SignupProvider>().signOut();
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          signInButton(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("have account?"),
        TextButton(
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Color(0xFFCC45F2),
            ),
          ),
          onPressed: () {
            context.read<SignupProvider>().resetAll();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
