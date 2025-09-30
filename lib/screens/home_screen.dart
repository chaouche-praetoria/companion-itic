// lib/screens/home_screen.dart
import 'package:companion/screens/home/badge_home_screen.dart';
import 'package:companion/screens/home/planning_home_screen.dart';
import 'package:companion/screens/home/profile_home_screen.dart';
import 'package:companion/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_sizes.dart';
import '../utils/theme/brand_gradients.dart';
import '../widgets/cards/discipline_card.dart';
import '../widgets/cards/notification_card.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  BrandGradients _brand(BuildContext context) {
    final ext = Theme.of(context).extension<BrandGradients>();
    if (ext != null) return ext;

    // Fallback si l’extension n’est pas branchée
    final cs = Theme.of(context).colorScheme;
    return BrandGradients(
      g1: cs.primary,
      g2: cs.primaryContainer,
      g3: cs.secondary,
      g4: cs.tertiary,
      text: cs.onBackground,
      textShadow: Colors.white24,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final brand = _brand(context);
    final cs = Theme.of(context).colorScheme;

    final pages = <Widget>[
      _HomeTab(screenSize: screenSize, brand: brand, cs: cs),
      const BadgeHomeScreen(),
      PlanningHomeScreen(screenSize: screenSize),
      const ProfileHomeScreen(),
    ];

    return Scaffold(
      body: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [brand.g1, brand.g2, brand.g3],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: IndexedStack(index: _currentIndex, children: pages),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        backgroundColor: cs.surface,
        currentIndex: _currentIndex,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.onSurfaceVariant,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Badge'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Planning'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profil'),
        ],
      ),
    );
  }
}

class _HomeTab extends StatefulWidget {
  const _HomeTab({
    required this.screenSize,
    required this.brand,
    required this.cs,
  });

  final Size screenSize;
  final BrandGradients brand;
  final ColorScheme cs;

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  @override
  Widget build(BuildContext context) {
    final brand = widget.brand;
    final cs = widget.cs;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Bonjour",
              style: GoogleFonts.inter(
                color: brand.text,
                fontSize: AppSizes.titleFontSize,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(blurRadius: 6, color: brand.textShadow),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              "Ethan36",
              style: GoogleFonts.inter(
                color: brand.text,
                fontSize: AppSizes.bigTitleFontSize,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(blurRadius: 8, color: brand.textShadow),
                ],
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: "Discipline en cours"),

            CurrentDisciplineCard(
              screenSize: widget.screenSize,
              startTime: "9H00",
              teacherName: "Malek Chaouche",
              subject: "Anglais",
              room: "Salle 10",
            ),

            const SizedBox(height: 20),
            const SectionTitle(title: "Classement BTS SIO 2"),

            Container(
              width: widget.screenSize.width,
              height: widget.screenSize.height * 0.22,
              margin: EdgeInsets.only(top: widget.screenSize.height * 0.01),
              decoration: BoxDecoration(
                color: cs.surfaceVariant.withOpacity(
                  Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.9,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: widget.screenSize.height * 0.1,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/bg-classement.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: cs.primary.withOpacity(0.15),
                              child: Icon(Icons.person,
                                  color: brand.text, size: 50),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Ethan36",
                              style: GoogleFonts.inter(
                                color: brand.text,
                                fontSize: AppSizes.subtitleFontSize,
                                fontWeight: FontWeight.w600,
                                shadows: [Shadow(blurRadius: 4, color: brand.textShadow)],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "29e",
                          style: GoogleFonts.inter(
                            color: brand.text,
                            fontSize: AppSizes.subtitleFontSize,
                            fontWeight: FontWeight.w600,
                            shadows: [Shadow(blurRadius: 4, color: brand.textShadow)],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: AppSizes.buttonHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: CustomButton(
                      text: "Afficher la carte ",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const SectionTitle(title: "Notifications"),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: cs.surface.withOpacity(
                  Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.9,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: cs.outlineVariant.withOpacity(0.4),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    NotificationCard(
                      title: "Notes du devoir du 10/02/26 disponibles !",
                      description: "Consultez les résultats du devoir de mathématiques du mardi 10 ",
                    ),
                    SizedBox(height: 10),
                    NotificationCard(
                      title: "Notes du devoir du 10/02/26 disponibles !",
                      description: "Consultez les résultats du devoir de mathématiques du mardi 10 ",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
