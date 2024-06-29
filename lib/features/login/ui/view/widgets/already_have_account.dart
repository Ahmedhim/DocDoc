import 'package:docdoc_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text:  TextSpan(
        text: "Already have an account yet? ",
        style:TextStyles.font13DarkBlueMedium ,
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}