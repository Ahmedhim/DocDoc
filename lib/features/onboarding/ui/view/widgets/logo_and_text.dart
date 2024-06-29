import 'package:docdoc_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndText extends StatelessWidget {
  const LogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("lib/core/assets/svg/DocDoc_logo.svg"),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "DocDoc",
                  style: TextStyles.font24BlackBold,
                ),
              ],
            );
  }
}