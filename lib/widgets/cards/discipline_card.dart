import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

class CurrentDisciplineCard extends StatelessWidget {
  final Size screenSize;
  final String startTime;
  final String teacherName;
  final String subject;
  final String room;

  const CurrentDisciplineCard({
    Key? key,
    required this.screenSize,
    required this.startTime,
    required this.teacherName,
    required this.subject,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    startTime,
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize:
                      AppSizes.forgotPasswordFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.005),
                  Text(
                    teacherName,
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
            subject,
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
                  room,
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
    );
  }
}