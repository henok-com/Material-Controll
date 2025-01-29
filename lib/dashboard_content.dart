import 'package:flutter/material.dart';
import 'package:matrial_controll/custom_text.dart';
import 'package:matrial_controll/custom_text_field.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
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
    return Expanded(
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
                                  padding: const EdgeInsets.symmetric(
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
                          color: Theme.of(context).colorScheme.onSurface,
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
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: DropdownButtonFormField(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).colorScheme.onSurface,
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
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(0),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
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
    );
  }
}
