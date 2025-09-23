import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_texts.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.02),
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
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "Discipline en cours",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: AppSizes.subtitleFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.1,
                        margin: EdgeInsets.only(top: screenSize.height * 0.01),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 10,
                                    height: screenSize.height * 0.075,
                                    margin: EdgeInsets.only(
                                        left: screenSize.width * 0.03),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    )),
                                SizedBox(width: screenSize.width * 0.03),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "9H00",
                                      style: GoogleFonts.inter(
                                        color: AppColors.white,
                                        fontSize:
                                            AppSizes.forgotPasswordFontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.005),
                                    Text(
                                      "Malek Chaouche",
                                      style: GoogleFonts.inter(
                                        color: AppColors.white,
                                        fontSize:
                                            AppSizes.forgotPasswordFontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: screenSize.width * 0.03),
                            Text(
                              "Anglais",
                              style: GoogleFonts.inter(
                                color: AppColors.white,
                                fontSize: AppSizes.subtitleFontSize,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: screenSize.width * 0.03),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Salle 10",
                                    style: GoogleFonts.inter(
                                      color: AppColors.white,
                                      fontSize: AppSizes.subtitleFontSize,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "Classement BTS SIO 2",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: AppSizes.subtitleFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
                                        backgroundImage: AssetImage(
                                            'assets/images/avatar1.png'),
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
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "Notifications",
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: AppSizes.subtitleFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: screenSize.width,
                        margin: EdgeInsets.only(top: screenSize.height * 0.01),
                        decoration: BoxDecoration(
                          color: AppColors.gradientDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Notes du devoir du 10/02/26 disponibles !",
                                        style: GoogleFonts.inter(
                                          color: AppColors.black,
                                          fontSize:
                                              AppSizes.forgotPasswordFontSize,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Consultez les résultats du devoir de mathématiques du mardi 10 ",
                                        style: GoogleFonts.inter(
                                          color: AppColors.black,
                                          fontSize:
                                              AppSizes.splashTextShadowBlur,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        softWrap: true,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  height: screenSize.height * 0.05,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.gradientDark,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
