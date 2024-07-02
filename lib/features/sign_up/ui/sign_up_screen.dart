import 'package:docdoc_project/core/helper/spacing.dart';
import 'package:docdoc_project/core/theming/styles.dart';
import 'package:docdoc_project/core/widgets/app_button.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/agree_our_terms.dart';
import 'package:docdoc_project/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc_project/features/sign_up/ui/widgets/already_have_account.dart';
import 'package:docdoc_project/features/sign_up/ui/widgets/sign_up_bloc_liscener.dart';
import 'package:docdoc_project/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Create Account",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(10),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(20),
           const SignUpForm(),
       const SignupBlocListener(),
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
              verticalSpace(20),
              AppTextButton(
                  buttonText: "Sign Up",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () async{
                    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
                    await context.read<SignUpCubit>().signUp();
                    }
                  }),
              verticalSpace(20),
              const AgreeOurTerms(),
              verticalSpace(30),
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