import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flowers/view/widgets/size_config.dart';
import '../widgets/app_style.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xfffFAFAFA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blackSizeVertical! * 36,
                width: double.infinity,
                child: Stack(children: [
                  Image.asset(
                    'assets/images/logo_g.gif',
                    height: SizeConfig.blackSizeVertical! * 40,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(58),
                            topRight: Radius.circular(58)),
                        color: Color.fromARGB(52, 245, 157, 155),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42)),
                        color: Color(0xfffFAFAFA),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create an account.",
                          style: mOswaldBold.copyWith(
                              fontSize: 25,
                              color: mBlack,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a member? ",
                          style: mOswaldSemiBold.copyWith(
                            fontSize: 16,
                            color: mBlack,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Text(
                            'Sign in',
                            style: mOswaldBold.copyWith(
                                color: const Color.fromRGBO(143, 148, 251, 1),
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Your Name",
                              style: mOswaldBold.copyWith(
                                  fontSize: 14,
                                  color: mBlack,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40, bottom: 10),
                            child: TextFormField(
                              key: const ValueKey("txtFullName"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Name',
                                hintStyle: mOswaldBold.copyWith(
                                    color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Your E-mail",
                              style: mOswaldBold.copyWith(
                                  fontSize: 14,
                                  color: mBlack,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40, bottom: 10),
                            child: TextFormField(
                              key: const ValueKey("txtEmail"),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'email',
                                hintStyle: mOswaldBold.copyWith(
                                    color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
                              style: mOswaldBold.copyWith(
                                  fontSize: 14,
                                  color: mBlack,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40, bottom: 10),
                            child: TextFormField(
                              key: const ValueKey("txtPassword"),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password',
                                hintStyle: mOswaldBold.copyWith(
                                    color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
                              style: mOswaldBold.copyWith(
                                  fontSize: 14,
                                  color: mBlack,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40, bottom: 10),
                            child: TextFormField(
                              key: const ValueKey("txtPassword"),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password',
                                hintStyle: mOswaldBold.copyWith(
                                    color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 380,
                      height: 50,
                      child: TextButton(
                        key: const ValueKey("btnLogin"),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Color(0xfff59d9b),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          "Sign Up",
                          style: mOswaldBold.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: new Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Divider(
                              color: Colors.grey[600],
                              height: 50,
                            )),
                      ),
                      Text("OR"),
                      Expanded(
                        child: new Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Divider(
                              color: Colors.grey[600],
                            )),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/SVG/gmail.svg",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Gmail",
                                style: mOswaldBold.copyWith(
                                    fontSize: 16,
                                    color: mBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/SVG/facebook.svg",
                                height: 38,
                                width: 38,
                              ),
                              Text(
                                "Facebook",
                                style: mOswaldBold.copyWith(
                                    fontSize: 16,
                                    color: mBlack,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
