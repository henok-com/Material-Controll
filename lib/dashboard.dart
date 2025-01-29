import 'package:easy_popover/easy_popover.dart';
import 'package:flutter/material.dart';
import 'package:matrial_controll/custom_buttons.dart';
import 'package:matrial_controll/custom_text.dart';
import 'package:matrial_controll/custom_text_field.dart';
import 'package:matrial_controll/dashboard_content.dart';
import 'package:matrial_controll/menu_items.dart';
import 'package:matrial_controll/theme/themeprovider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final ctx = context;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.2,
            decoration: const BoxDecoration(
              color: Color(0xFF008E53),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const DashboardTitle("የተጠቃሚዎች ዝርዝር", font_size: 25),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SecondaryButton(
                      text: "የአስተዳደር ሰራተኞች",
                      pressed: true,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SecondaryButton(text: "አሰልጣኞች", onPressed: () {}),
                    const SizedBox(
                      height: 10,
                    ),
                    SecondaryButton(text: "ሰልጣኞች", onPressed: () {}),
                    const SizedBox(
                      height: 10,
                    ),
                    SecondaryButton(text: "ባለጉዳዮች", onPressed: () {}),
                  ],
                ),
                const DashboardTitle("ምዝገባ", font_size: 25),
                Column(
                  children: [
                    SecondaryButton(text: "አዲስ ተጠቃሚ መዝግብ", onPressed: () {}),
                    const SizedBox(
                      height: 10,
                    ),
                    SecondaryButton(text: "አዲስ እቃ መዝግብመዝግብ", onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/applogo.png",
                            width: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const PrimaryText(
                            "የአቃቂ ፖሊቴክኒክ ኮሌጅ የላፕቶፕ እና የላፕቶፕ አክሰሰሪዎች መቆጣጠሪያ",
                            font_size: 20,
                            otherColor: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              themeNotifier.value =
                                  (themeNotifier.value == ThemeMode.light)
                                      ? ThemeMode.dark
                                      : ThemeMode.light;
                            },
                            icon: Icon(
                              themeNotifier.value == ThemeMode.light
                                  ? Icons.nights_stay
                                  : Icons.light_mode_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 20,
                            height: 40,
                            child: PopoverOverlay(
                              builder: (context) {
                                return Popover(
                                  context,
                                  backgroundColor: const Color(0xFFA4DA65),
                                  hideArrow: true,
                                  alignment: PopoverAlignment.bottomRight,
                                  spacing: 10,
                                  action: const Icon(
                                    Icons.more_vert_rounded,
                                    color: Color(0xFF006C00),
                                    size: 30,
                                  ),
                                  content: Column(
                                    children: [
                                      MenuItem(
                                        text: "መረጃ አድስ",
                                        onTap: () {},
                                        icon: Icons.edit,
                                        ctx: context,
                                      ),
                                      MenuItem(
                                        text: "ውጣ",
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            ctx,
                                            "/login",
                                          );
                                        },
                                        icon: Icons.logout,
                                        ctx: context,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                DashboardContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
