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
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientLight,
              AppColors.gradientDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  SectionTitle(title: "Discipline en cours"),
                  CurrentDisciplineCard(
                    screenSize: screenSize,
                    startTime: "9H00",
                    teacherName: "Malek Chaouche",
                    subject: "Anglais",
                    room: "Salle 10",
                  ),
                  SizedBox(height: 20),
                  SectionTitle(title: "Classement BTS SIO 2"),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.25,
                    margin: EdgeInsets.only(top: screenSize.height * 0.01),
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
                          height: screenSize.height * 0.1,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: AppColors.splashGradient1,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: const Icon(
                                      Icons.person,
                                      color: AppColors.white,
                                      size: 50,
                                    ),
                                  ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint("Next button pressed");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.gradientDark,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppSizes.buttonRadius),
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
                  SizedBox(height: 20),
                  SectionTitle(title: "Notifications"),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: AppColors.gradientDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 10,
                        children: [
                          NotificationCard(
                            title: "Notes du devoir du 10/02/26 disponibles !",
                            description: "Consultez les résultats du devoir de mathématiques du mardi 10 ",
                            onTap: () {},
                          ),
                          NotificationCard(
                            title: "Notes du devoir du 10/02/26 disponibles !",
                            description: "Consultez les résultats du devoir de mathématiques du mardi 10 ",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Badge'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Planning'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profil'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: AppColors.splashGradient1,
        onTap: (int index) {},
      ),
    );
  }
}
