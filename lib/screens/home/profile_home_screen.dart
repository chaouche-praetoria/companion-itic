import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../widgets/profile_avatar.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.hightDark,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              ProfileAvatar(radius: 75),
              const SizedBox(height: 20),
              Text(
                'Ethan Mathieu',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'Étudiant en 2ème année',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: const Text('Modifier le profil'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informations personnelles',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  title: Text(
                    'ethanhall@gmail.com',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Né le 15 Mars 2006',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Informations personnelles',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(
                    Icons.swipe_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Mode sombre',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                    leading: const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Langues',
                      style: GoogleFonts.inter(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white)),
                const SizedBox(height: 15),
                Text(
                  'Comptes',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(
                    Icons.swipe_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Changer de mot de passe',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Se déconnecter',
                      style: GoogleFonts.inter(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    trailing: Icon(Icons.chevron_right, color: Colors.white)),
                const SizedBox(height: 15),
                Text(
                  'Plus d\'informations',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(
                    Icons.swipe_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Conditions d\'utilisation',
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
