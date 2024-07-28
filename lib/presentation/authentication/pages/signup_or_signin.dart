import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotidupe/common/helpers/is_dark_mode.dart';
import 'package:spotidupe/common/widgets/appbar/app_bar.dart';
import 'package:spotidupe/common/widgets/button/basic_app_button.dart';
import 'package:spotidupe/core/configs/assets/app_vectors.dart';
import 'package:spotidupe/core/configs/theme/app_colors.dart';
import 'package:spotidupe/presentation/authentication/pages/signin.dart';
import 'package:spotidupe/presentation/authentication/pages/signup.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BasicAppbar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topPattern),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(-1.0, 1.0), // Mirror horizontally
              child: SvgPicture.asset(
                AppVectors.bottomPattern,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 220, horizontal: 40),
          child: Column(
            children: [
              Align(
                //SPOTI LOGO
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVectors.logo),
              ),
              const Spacer(),
              const Text(
                //TEXT ONE
                'Enjoy listening to music',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(
                height: 21,
              ),
              const Text(
                //TEXT TWO
                'Spotify is a proprietary Swedish audio streaming and media services provider',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignupPage())
                                );
                        },
                        title: 'Register',
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (BuildContext context) => const SigninPage())
                                );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          )))
                ],
              )
              // BasicAppButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (BuildContext context) =>
              //                   const SignupOrSignin()));
              //     },
              //     title: 'Continue'
              // )
            ],
          ),
        )
      ],
    ));
  }
}
