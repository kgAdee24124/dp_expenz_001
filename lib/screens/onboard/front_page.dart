import 'package:expenz/const/colors.dart';
import 'package:expenz/const/img_paths.dart';
import 'package:expenz/const/responsive.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height;
    final double screenWidth =
        MediaQuery.of(context).size.width;


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isMobile(context))
              Image.asset(
                logo,
                width: ((screenWidth + screenHeight) * 0.4) * 0.4,
                fit: BoxFit.fill,
              ),
            if (Responsive.isMobile(context))
              SizedBox(height: screenHeight * 0.02),
            if (Responsive.isMobile(context))
              Text(
                "Expenz",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ((screenWidth + screenHeight) * 0.4) * 0.1,
                  color: themeColor,
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isDesktop(context) ||
                Responsive.isTablet(context))
              Image.asset(
                logo,
                width: screenWidth * 0.3,
                fit: BoxFit.fill,
              ),
            if (Responsive.isDesktop(context) ||
                Responsive.isTablet(context))
              SizedBox(width: screenWidth * 0.05),
            if (Responsive.isDesktop(context) ||
                Responsive.isTablet(context))
              Text(
                "Expenz",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ((screenWidth + screenHeight) * 0.4) * 0.1,
                  color: themeColor,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
