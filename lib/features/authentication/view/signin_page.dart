import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:itunes_video_app/features/authentication/model/user_model.dart';
import 'package:itunes_video_app/features/authentication/view/widget/signin_fail.dart';
import 'package:provider/provider.dart';

import '../view_model/signin_provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    height: 64,
                  ),
                  Consumer<SigninProvider>(
                      builder: (context, signinProvider, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: signinProvider.emailValid ? 70 : 50,
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
                                prefixIcon: const Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SigninProvider>()
                                      .emailValidFalse();
                                  return '* please input your email';
                                } else if (!EmailValidator.validate(value)) {
                                  context
                                      .read<SigninProvider>()
                                      .emailValidFalse();
                                  return '* please input your valid email';
                                }

                                context.read<SigninProvider>().emailValidTrue();

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: signinProvider.passwordValid ? 70 : 50,
                            child: TextFormField(
                              //style: TextStyle(fontSize: 12.0),
                              controller: passwordController,
                              obscureText: signinProvider.obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Password',
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
                                errorBorder: OutlineInputBorder(
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
                                        .read<SigninProvider>()
                                        .changeObsecurePassword();
                                  },
                                  child: signinProvider.obscurePassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
                                      : const Icon(Icons.remove_red_eye),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<SigninProvider>()
                                      .passwordValidFalse();
                                  return '* please input your Password';
                                } else if (value.length < 8) {
                                  context
                                      .read<SigninProvider>()
                                      .passwordValidFalse();
                                  return '* Password must be have a 8 character';
                                }

                                context
                                    .read<SigninProvider>()
                                    .passwordValidTrue();
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
                                'Sign in',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFEA4CC0),
                                ),
                              ),
                              onPressed: () async {
                                var validForm =
                                    formKey.currentState!.validate();

                                if (validForm) {
                                  //const CircularProgressIndicator();
                                  var userModel = UserModel(
                                      email: emailController.text,
                                      password: passwordController.text);

                                  await context
                                      .read<SigninProvider>()
                                      .signinManually(userModel);

                                  if (signinProvider.error == true) {
                                    // ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      )),
                                      context: context,
                                      builder: (context) => const SigninFail(),
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Signin success!!'),
                                        duration: Duration(milliseconds: 800),
                                      ),
                                    );

                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacementNamed(
                                        context, '/main');
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          signUpButton(),
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

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have account?"),
        TextButton(
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFCC45F2),
            ),
          ),
          onPressed: () {
            //context.read<SigninProvider>().resetAll();
            Navigator.of(context).pushNamed('/signup');
          },
        ),
      ],
    );
  }
}
