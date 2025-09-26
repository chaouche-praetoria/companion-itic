import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../widgets/cards/discipline_card.dart';

class PlanningHomeScreen extends StatefulWidget {
  const PlanningHomeScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<PlanningHomeScreen> createState() => _PlanningHomeScreenState();
}

class _PlanningHomeScreenState extends State<PlanningHomeScreen> {

  final List<_DisciplineItem> _items = [
    _DisciplineItem(startTime: '09h00', teacher: 'Chaouche', subject: 'Anglais', room: 'Salle 10'),
    _DisciplineItem(startTime: '10h30', teacher: 'Dupont', subject: 'Maths', room: 'Salle 8'),
    _DisciplineItem(startTime: '13h45', teacher: 'Martin', subject: 'Physique', room: 'Salle 12', color: AppColors.splashGradient4),
    _DisciplineItem(startTime: '15h30', teacher: 'Durand', subject: 'Histoire', room: 'Salle 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.notifications_active, size: 50, color: AppColors.white,)
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.hightDark,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  'Mercredi 12 Juin (Aujourd\'hui)',
                  style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: AppSizes.subtitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15,),
                ListView.separated(
                  itemCount: _items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final it = _items[index];
                    return CurrentDisciplineCard(
                      screenSize: widget.screenSize,
                      startTime: it.startTime,
                      teacherName: it.teacher,
                      subject: it.subject,
                      room: it.room,
                      color: it.color ?? AppColors.gradientDark,
                    );
                  },
                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}

class _DisciplineItem {
  final String startTime;
  final String teacher;
  final String subject;
  final String room;
  final Color? color;

  _DisciplineItem({
    required this.startTime,
    required this.teacher,
    required this.subject,
    required this.room,
    this.color,
  });
}