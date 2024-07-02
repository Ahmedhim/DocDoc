import 'package:docdoc_project/core/helper/app_regex.dart';
import 'package:docdoc_project/core/helper/spacing.dart';
import 'package:docdoc_project/core/widgets/app_text_field.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/password_vaildation.dart';
import 'package:docdoc_project/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

late TextEditingController passwordController;
bool hasLowerCase = false;
bool hasUpperCase = false;
bool hasNumber = false;
bool hasSpecialCharacters = false;
bool hasMinLength = false;
bool isObscure = false;
bool isObsecure2 = false;

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordValidation();
    super.initState();
  }

  void setupPasswordValidation() {
    passwordController.addListener(() {
      hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(children: [
            AppTextFormField(
          hintText: "Name",
          controller: context.read<SignUpCubit>().nameController,
          validator: (value) {
            if (value == null ||
                value.isEmpty 
               ) {
              return "please enter a vaild name";
            }
          },
        ),
        verticalSpace(20),     
        AppTextFormField(
          hintText: "Email",
          controller: context.read<SignUpCubit>().emailController,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return "please enter a vaild email";
            }
          },
        ),
        verticalSpace(20),
            AppTextFormField(
          hintText: "phone number",
          controller: context.read<SignUpCubit>().phoneNumberController,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPhoneNumberValid(value)) {
              return "please enter a vaild phone number";
            }
          },
        ),
        verticalSpace(20),
        AppTextFormField(
          isObscureText: isObscure,
          hintText: "Password",
          controller: context.read<SignUpCubit>().passwordController,
          suffixIcon: GestureDetector(
            onTap: () {
              isObscure = !isObscure;
              setState(() {});
            },
            child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          ),
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.hasMinLength(value) ||
                !AppRegex.hasUpperCase(value) ||
                !AppRegex.hasLowerCase(value) ||
                !AppRegex.hasNumber(value) ||
                !AppRegex.hasSpecialCharacter(value)) {
              return "please enter a valid password";
            }
          },
        ),
        verticalSpace(20),
          AppTextFormField(
          isObscureText: isObsecure2,
          hintText: "Password confirmation",
          controller: context.read<SignUpCubit>().passwordConfirmationController,
          suffixIcon: GestureDetector(
            onTap: () {
              isObsecure2 = !isObsecure2;
              setState(() {});
            },
            child: Icon(isObsecure2 ? Icons.visibility : Icons.visibility_off),
          ),
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.hasMinLength(value) ||
                !AppRegex.hasUpperCase(value) ||
                !AppRegex.hasLowerCase(value) ||
                !AppRegex.hasNumber(value) ||
                !AppRegex.hasSpecialCharacter(value)) {
              return "please enter a valid password";
            }
          },
        ),
        verticalSpace(20),
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          hasMinLength: hasMinLength,
          hasNumber: hasNumber,
          hasSpecialCharacters: hasSpecialCharacters,
          hasUpperCase: hasUpperCase,
        ),
        verticalSpace(20),
      ]),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
