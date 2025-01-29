import 'package:easy_popover/easy_popover.dart';
import 'package:flutter/material.dart';
import 'package:matrial_controll/custom_buttons.dart';
import 'package:matrial_controll/custom_text.dart';
import 'package:matrial_controll/custom_text_field.dart';
import 'package:matrial_controll/menu_items.dart';
import 'package:matrial_controll/theme/themeprovider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? dropdownValue = "Computer";
  int currentTab = 0;
  final tabs = [
    "የአስተዳደር ሰራተኞች",
    "እቃዎች",
  ];

  double changeIndicatorPosition() {
    switch (currentTab) {
      case 0:
        return 35;
      case 1:
        return 216;
      default:
        return 35;
    }
  }

  double changeIndicatorWidth() {
    switch (currentTab) {
      case 0:
        return 120;
      case 1:
        return 30;
      default:
        return 120;
    }
  }

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
                                return Popover(context,
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
                                    ));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33636363),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const PrimaryText("የአስተዳደር ሰራተኞች ዝርዝር", font_size: 25),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 300,
                              child: PrimaryTextField(
                                hintText: "የአስተዳደር ሰራተኞችን ፈልግ",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xFF006C00),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  width: 280,
                                  height: 40,
                                  child: Center(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: tabs.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentTab = index;
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15.0,
                                                vertical: 6,
                                              ),
                                              child: Text(
                                                tabs[index],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 200),
                                  bottom: 0,
                                  left: changeIndicatorPosition(),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: changeIndicatorWidth(),
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.filter_alt_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: DropdownButtonFormField(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    value: dropdownValue,
                                    hint: const Center(
                                      child: Text(
                                        "Hello",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "Computer",
                                        child: Text(
                                          "Computer",
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: "Mouse",
                                        child: Text(
                                          "Mouse",
                                        ),
                                      ),
                                    ],
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          width: 2,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    menuMaxHeight: 200,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
