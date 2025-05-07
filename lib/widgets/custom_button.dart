import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  final Color txtColor;
  final double w;
  final double h;
  final double fontSize;
  const CustomButton({
    super.key,
    required this.title,
    required this.w,
    required this.h,
    required this.fontSize,
    required this.btnColor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(h * 0.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xDD0E0E0E),
            offset: Offset(0, 3),
            blurRadius: 8.0,
            spreadRadius: 0.05,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: txtColor,
            fontSize: fontSize,
            fontFamily: "Inter",
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
