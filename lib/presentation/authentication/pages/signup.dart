import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotidupe/common/widgets/appbar/app_bar.dart';
import 'package:spotidupe/common/widgets/button/basic_app_button.dart';
import 'package:spotidupe/core/configs/assets/app_vectors.dart';
import 'package:spotidupe/core/configs/theme/app_colors.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';
import 'package:spotidupe/domain/usecases/auth/signup.dart';
import 'package:spotidupe/presentation/authentication/pages/signin.dart';
import 'package:spotidupe/presentation/root/pages/root.dart';
import 'package:spotidupe/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(
                height: 0,
              ),
              _supportText(),
              const SizedBox(
                height: 16,
              ),
              _fullNameField(context),
              const SizedBox(
                height: 16,
              ),
              _emailField(context),
              const SizedBox(
                height: 16,
              ),
              _passwordField(context),
              const SizedBox(
                height: 33,
              ),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                        fullName: _fullName.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );
                    result.fold(
                      (l) {
                        var snackbar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RootPage()),
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: 'Create Account'),
              // _iconField(context),
              // const SizedBox(
              //   height: 33,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'If you need any support',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary, // Change the color here
            textStyle: const TextStyle(
              fontSize: 12, // Change the font size here
            ),
          ),
          child: const Text('Click Here'),
        ),
      ],
    );
  }

  Widget _fullNameField(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        controller: _fullName,
        decoration: const InputDecoration(hintText: 'Full Name')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        controller: _email,
        decoration: const InputDecoration(hintText: 'Enter Email')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(hintText: 'Password')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  // Widget _iconField(BuildContext context) {
  //   return Container(
  //     child: Row(
  //         children: [
  //           Icon(Icons.abc),
  //           Icon(Icons.airplane_ticket),
  //           Icon(Icons.alarm),
  //         ],
  //       ),
  //   );
  // }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Flexible(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SigninPage()));
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Change the color here
                textStyle: const TextStyle(
                  fontSize: 14, // Change the font size here
                ),
              ),
              child: const Text('Register Now'),
            ),
          ),
        ],
      ),
    );
  }
}
