import 'package:docdoc_project/core/helper/spacing.dart';
import 'package:docdoc_project/core/theming/styles.dart';
import 'package:docdoc_project/core/widgets/app_button.dart';
import 'package:docdoc_project/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/agree_our_terms.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/already_have_account.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/blocliscener_login.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(10),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(30),
             const EmailAndPassword(),
            const BlocliscenerLogin(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyles.font12BlueRegular,
                  ),
                ),
              ),
              verticalSpace(30),
              AppTextButton(
                  buttonText: "Login",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () async{
                    if (cubit.formKey.currentState!.validate()) {
                    await cubit.emitLoginState();
                    }
                  }),
              verticalSpace(30),
              const AgreeOurTerms(),
              verticalSpace(70),
              const Align(
                  alignment: AlignmentDirectional.center,
                  child: AlreadyHaveAccount()),
            ]),
          ),
        ),
      ),
    );
  }
}
