import 'package:expenz/const/colors.dart';
import 'package:expenz/const/responsive.dart';
import 'package:flutter/material.dart';

class ShareOnboardScreen extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;
  const ShareOnboardScreen({
    super.key,
    required this.imgPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height;
    final double screenWidth =
        MediaQuery.of(context).size.width;

    final double x = ((screenWidth + screenHeight) * 0.4);
    final bool mobile = Responsive.isMobile(context);
    final bool tablet = Responsive.isTablet(context);
    final bool desktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (mobile)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgPath,
                  width: x * 0.5,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: x * 0.06,
                    color: titleColor,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: x * 0.03,
                    color: disColor,
                  ),
                ),
              ],
            ),

          if (desktop || tablet)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgPath,
                  width: desktop ? x * 0.4 : x * 0.5,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: screenWidth * 0.02),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              (x <= 30) ? x * 0.1 : 30,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize:
                              (x <= 15) ? x * 0.05 : 15,
                          color: disColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
