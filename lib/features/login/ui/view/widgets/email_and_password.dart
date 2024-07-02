import 'package:docdoc_project/core/helper/app_regex.dart';
import 'package:docdoc_project/core/helper/spacing.dart';
import 'package:docdoc_project/core/widgets/app_text_field.dart';
import 'package:docdoc_project/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_project/features/login/ui/view/widgets/password_vaildation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

late TextEditingController passwordController;
bool isObscure = false;
bool hasLowerCase = false;
bool hasUpperCase = false;
bool hasNumber = false;
bool hasSpecialCharacters = false;
bool hasMinLength = false;

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  void initState() {
    passwordController =
       context.read<LoginCubit>().passwordController;
    super.initState();
    setupPasswordValidation();
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
    var cubit = BlocProvider.of<LoginCubit>(context);

    return Form(
      key: cubit.formKey,
      child: Column(children: [
        AppTextFormField(
          hintText: "Email",
          controller: cubit.emailController,
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
          isObscureText: isObscure,
          hintText: "Password",
          controller: cubit.passwordController,
          suffixIcon: GestureDetector(
            onTap: () {
              isObscure = !isObscure;
              setState(() {});
            },
            child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          ),
          validator: (value) {
            if (value == null || value.isEmpty|| !AppRegex.hasMinLength(value)|| !AppRegex.hasUpperCase(value)|| !AppRegex.hasLowerCase(value)|| !AppRegex.hasNumber(value)|| !AppRegex.hasSpecialCharacter(value)) {
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
  dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
