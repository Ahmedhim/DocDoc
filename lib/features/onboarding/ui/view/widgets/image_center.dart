import 'package:docdoc_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageCenter extends StatelessWidget {
  const ImageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(    
      children: [
        SvgPicture.asset("lib/core/assets/svg/DocDoc_background.svg"),
        Container(
           foregroundDecoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.white,
        Colors.white.withOpacity(0.0),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops:const [0.14,0.4]
      )
    ),
          child: Image.asset("lib/core/assets/image/DocDoc_Image.png")),
        Positioned(
          bottom: 22,
          left: 10,
          right: 10,
          child: Text("Best Doctor Appointment App",style: TextStyles.font32BlueBold,textAlign: TextAlign.center,),
        ),
    
      ]
    );
  }
}