import 'package:docdoc_project/core/di/dependenacy_injection.dart';
import 'package:docdoc_project/docdoc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await setupGetit();
  await ScreenUtil.ensureScreenSize();
  runApp(const DocDocApp());
}
