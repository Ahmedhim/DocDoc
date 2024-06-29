import 'package:docdoc_project/core/theming/colors.dart';
import 'package:docdoc_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AgreeOurTerms extends StatelessWidget {
  const AgreeOurTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text:   TextSpan(
        text: "By logging , you agree to our ",
        style:const TextStyle(color: ColorsManager.lightGray),
        children: [
          TextSpan(
            text: "Terms & Conditions",
            style: TextStyles.font13DarkBlueMedium,
          ),
        const  TextSpan(
            text: " and ",
            style: TextStyle(color: ColorsManager.lightGray),
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyles.font13DarkBlueMedium.copyWith(height: 1.4),
          ),
        ]
      ),
   
     
    );
  }
}