import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotidupe/common/widgets/appbar/app_bar.dart';
import 'package:spotidupe/common/widgets/button/basic_app_button.dart';
import 'package:spotidupe/core/configs/assets/app_vectors.dart';
import 'package:spotidupe/core/configs/theme/app_colors.dart';
import 'package:spotidupe/data/models/auth/signin_user_req.dart';
import 'package:spotidupe/domain/usecases/auth/signin.dart';
import 'package:spotidupe/presentation/authentication/pages/signup.dart';
import 'package:spotidupe/presentation/home/pages/home.dart';
import 'package:spotidupe/service_locator.dart';

class SigninPage extends StatelessWidget {
 SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 20,
            ),
             _supportText(),
            const SizedBox(
              height: 40,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 10,
            ),
            BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
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
                                  const HomePage()),
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: 'Sign In'),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
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

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Username or Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,

      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
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
                                builder: (BuildContext context) => SignupPage())
                                );
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
