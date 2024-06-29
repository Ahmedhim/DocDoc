import 'package:docdoc_project/core/helper/extension.dart';
import 'package:docdoc_project/core/routing/routes.dart';
import 'package:docdoc_project/core/theming/colors.dart';
import 'package:docdoc_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () {
        context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) => false);
      }, 
      style:  ButtonStyle(
         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 105.w,vertical: 14.h)),
        backgroundColor:const WidgetStatePropertyAll(ColorsManager.mainBlue),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r))),
      ),
        child:  Text("Get Started",style: TextStyles.font16WhiteMedium,),   
    );
  }
}