import 'package:docdoc_project/features/sign_up/data/models/sign_up_request.dart';
import 'package:docdoc_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:docdoc_project/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmationController = TextEditingController();
final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(SignUpRequest(
      email: emailController.text,
      gender: "0",
      password: passwordController.text,
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
      passwordConfirmation: passwordConfirmationController.text,
    ));
    response.when(success: (signUpResponse) => emit(SignUpState.success(signUpResponse)),
     failure: (error) => emit(SignUpState.failure(error.apiErrorModel.message ?? "")));
  }
}
