import 'package:flutter/material.dart';
import 'package:matrial_controll/custom_buttons.dart';
import 'package:matrial_controll/custom_text.dart';
import 'package:matrial_controll/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Container(
          width: 800,
          height: 500,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            boxShadow: const [
              BoxShadow(
                color: Color(0x33636363),
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 80,
                left: 350,
                child: PrimaryText("ይግቡ", font_size: 35),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/applogo.png",
                      width: 250,
                    ),
                    Container(
                      width: 2,
                      height: 250,
                      color: const Color(0xFF008E53),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SecondaryText(
                              "መለያ ስም",
                              font_size: 20,
                            ),
                            SizedBox(
                              width: 270,
                              child: PrimaryTextField(
                                hintText: "የመለያ ስም እዚህ ጋር ያስገቡ",
                              ),
                            ),
                            SecondaryText(
                              "የይለፍ ቃል",
                              font_size: 20,
                            ),
                            SizedBox(
                              width: 270,
                              child: PrimaryTextField(
                                hintText: "የይለፍ ቃል እዚህ ጋር ያስገቡ",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PrimaryButton(
                          text: "ግባ",
                          onClick: () {
                            Navigator.pushReplacementNamed(
                                context, "/dashboard");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
