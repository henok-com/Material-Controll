import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:matrial_controll/colors.dart';
import 'package:matrial_controll/dashboard.dart';
import 'package:matrial_controll/login.dart';
import 'package:matrial_controll/theme/themedata.dart';
import 'package:matrial_controll/theme/themeprovider.dart';

void main() async {
  runApp(const MaterialManagement());
  doWhenWindowReady(() {
    appWindow.show();
  });
}

class MaterialManagement extends StatelessWidget {
  const MaterialManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          routes: {
            '/login': (context) => const Login(),
            '/dashboard': (context) => const Dashboard(),
          },
          title: "Material Management App",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const MainFrame(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MainFrame extends StatefulWidget {
  const MainFrame({super.key});

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  late RoutePageBuilder builder;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: MoveWindow(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          "assets/images/appicon.ico",
                        ),
                      ),
                    ),
                  ),
                  MinimizeWindowButton(
                    animate: true,
                    colors: WindowButtonColors(
                      iconNormal: Colors.white,
                      mouseOver: AppColors.terinary,
                    ),
                  ),
                  MaximizeWindowButton(
                    colors: WindowButtonColors(
                      iconNormal: Colors.white,
                      mouseOver: AppColors.terinary,
                    ),
                  ),
                  CloseWindowButton(
                    colors: WindowButtonColors(
                      iconNormal: Colors.white,
                      mouseOver: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scaffold(
              body: Navigator(
                initialRoute: "/login",
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/login':
                      builder = (context, animation, secondaryAnimation) =>
                          const Login();
                      break;
                    case '/dashboard':
                      builder = (context, animation, secondaryAnimation) =>
                          const Dashboard();
                      break;
                    default:
                      builder = (context, animation, secondaryAnimation) =>
                          const Login();
                      break;
                  }
                  return PageRouteBuilder(
                      pageBuilder: builder,
                      settings: settings,
                      transitionDuration: Duration(milliseconds: 300),
                      reverseTransitionDuration: Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
