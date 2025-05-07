import 'package:expenz/const/colors.dart';
import 'package:expenz/const/text.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({super.key});

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  bool pass_1 = true;
  bool pass_2 = true;
  bool isRemember = true;

  //form validation
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController =
      TextEditingController();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height;
    final double screenWidth =
        MediaQuery.of(context).size.width;
    final double x = ((screenWidth + screenHeight) * 0.4);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userMenu_1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: x * 0.06,
                    color: subTitleColor,
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  /*child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12.withAlpha(15),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),*/
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter a User Name.";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(
                            20,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter a Email.";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(
                            20,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            pass_1 = !pass_1;
                          });
                        },
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter a Valid Password.";
                            }
                          },
                          obscureText: pass_1,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(
                              20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      GestureDetector(
                        onDoubleTap: () {
                          setState(() {
                            pass_2 = !pass_2;
                          });
                        },
                        child: TextFormField(
                          controller:
                              _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter the Same Password.";
                            }
                          },
                          obscureText: pass_2,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(
                              20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userMenu_2,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: x * 0.035,
                              color: disColor,
                            ),
                          ),
                          Switch(
                            value: isRemember,
                            onChanged: (value) {
                              setState(() {
                                isRemember = !isRemember;
                                print(isRemember);
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!
                              .validate()) {
                            String userName =
                                _userNameController.text;
                            String email =
                                _emailController.text;
                            String password =
                                _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController
                                    .text;

                            print(
                              "$userName $email $password $confirmPassword",
                            );
                          }
                        },
                        child: CustomButton(
                          title: "Next",
                          w: double.infinity,
                          h: screenHeight * 0.07,
                          fontSize: x * 0.03,
                          btnColor: themeColor,
                          txtColor: pureWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),

                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
