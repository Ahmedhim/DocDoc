import 'package:docdoc_project/core/theming/styles.dart';
import 'package:docdoc_project/features/onboarding/ui/view/widgets/get_started_button.dart';
import 'package:docdoc_project/features/onboarding/ui/view/widgets/image_center.dart';
import 'package:docdoc_project/features/onboarding/ui/view/widgets/logo_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 20.h),
          child:  Column(children: [
       const LogoAndText(),
        SizedBox(height: 30.h,),
       const ImageCenter(),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 10.w),
         child: Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",style: TextStyles.font12GrayRegular,textAlign:  TextAlign.center,),

       ),
       SizedBox(height: 40.h,),
      const GetStartedButton(),
      
          ]),
        ),
      )),
    );
  }
}
