import 'package:expenz/const/colors.dart';
import 'package:expenz/const/responsive.dart';
import 'package:expenz/data/sub_onboard_screen_data.dart';
import 'package:expenz/screens/onboard/front_page.dart';
import 'package:expenz/screens/onboard/share_onboard_screen.dart';
import 'package:expenz/screens/user_menu.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() =>
      _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _controller = PageController();

  bool isLastPage = false;
  int k = 0;

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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      isLastPage = value == 3;
                      k = value;
                    });
                  },
                  children: [
                    FrontPage(),
                    for (int i = 0; i < 3; i++)
                      ShareOnboardScreen(
                        imgPath:
                            SubOnboardScreenData
                                .subOnboardScreens[i]
                                .imgPath,
                        title:
                            SubOnboardScreenData
                                .subOnboardScreens[i]
                                .title,
                        description:
                            SubOnboardScreenData
                                .subOnboardScreens[i]
                                .description,
                      ),
                  ],
                ),

                //scroll dot effect
                Container(
                  alignment: Alignment(
                    0,
                    screenHeight * 0.8 / 1000,
                  ),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: themeColor,
                        rotationAngle: 225,
                        verticalOffset: -5,
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                        dotBorder: const DotBorder(
                          color: themeColor,
                          width: 2,
                        ),
                      ),
                      dotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                        rotationAngle: 45,
                      ),
                      spacing: 10.0,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment(0, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: GestureDetector(
                      onTap:
                          !isLastPage
                              ? () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              }
                              : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const UserMenu(),
                                  ),
                                );
                              },
                      child: CustomButton(
                        title:
                            isLastPage ? "Get Started" : "Next",
                        w: double.infinity,
                        h: screenHeight * 0.07,
                        fontSize: x * 0.03,
                        btnColor: themeColor,
                        txtColor: pureWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
