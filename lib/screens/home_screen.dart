import 'package:companion/screens/home/badge_home_screen.dart';
import 'package:companion/screens/home/planning_home_screen.dart';
import 'package:companion/screens/home/profile_home_screen.dart';
import 'package:companion/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../widgets/cards/discipline_card.dart';
import '../widgets/cards/notification_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final pages = <Widget>[
      _HomeTab(screenSize: screenSize),
      const BadgeHomeScreen(),
      PlanningHomeScreen(screenSize: screenSize),
      const ProfileHomeScreen(),
    ];

    return Scaffold(
      body: Container(
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.gradientLight, AppColors.gradientDark],
          ),
        ),
        child: SafeArea(
          child: IndexedStack(index: _currentIndex, children: pages),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.gradientDark,
        unselectedItemColor: Colors.white.withValues(alpha: 0.7),
        backgroundColor: AppColors.gradientLight,
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
  const _HomeTab({required this.screenSize});
  final Size screenSize;

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> {
  @override
  Widget build(BuildContext context) {
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
                color: AppColors.white,
                fontSize: AppSizes.titleFontSize,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              "Ethan36",
              style: GoogleFonts.inter(
                color: AppColors.white,
                fontSize: AppSizes.bigTitleFontSize,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            SectionTitle(title: "Discipline en cours"),
            CurrentDisciplineCard(
              screenSize: widget.screenSize,
              startTime: "9H00",
              teacherName: "Malek Chaouche",
              subject: "Anglais",
              room: "Salle 10",
            ),
            const SizedBox(height: 20),
            SectionTitle(title: "Classement BTS SIO 2"),
            Container(
              width: widget.screenSize.width,
              height: widget.screenSize.height * 0.25,
              margin: EdgeInsets.only(top: widget.screenSize.height * 0.01),
              decoration: BoxDecoration(
                color: AppColors.gradientDark,
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
                      color: AppColors.splashGradient1,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.person, color: AppColors.white, size: 50),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "1. Ethan36",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: AppSizes.subtitleFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "29e",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                            fontSize: AppSizes.subtitleFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: AppSizes.buttonHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () => debugPrint("Afficher la carte"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.gradientDark,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                        ),
                      ),
                      child: Text(
                        "Afficher la carte",
                        style: GoogleFonts.inter(
                          fontSize: AppSizes.buttonFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SectionTitle(title: "Notifications"),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: AppColors.gradientDark,
                borderRadius: BorderRadius.circular(20),
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