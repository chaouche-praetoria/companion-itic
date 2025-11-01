import 'package:companion/screens/login_screen.dart';
import 'package:companion/screens/setup_profile_screen.dart';
import 'package:companion/utils/theme/app_theme.dart';
import 'package:companion/utils/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:companion/screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.instance.load();
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.instance;

    return ValueListenableBuilder(
        valueListenable: controller.mode,
        builder: (context, _, __) {

          return MaterialApp(
            title: 'ITIC Tech Companion',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: controller.materialMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (_) => const SplashScreen(),
              '/login': (_) => const LoginScreen(),
              '/setup-profile': (_) => const SetupProfile(),
              '/home': (_) => const HomeScreen(),
            },
          );

        });
  }
}
