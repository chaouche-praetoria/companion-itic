import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/profile_avatar.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.gradientLight, AppColors.gradientDark],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: AppColors.hightDark,
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      const ProfileAvatar(radius: 72),
                      const SizedBox(height: 16),
                      Text(
                        'Ethan Mathieu',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Étudiant en 2ème année',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.white70,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.white,
                        ),
                        child: const Text('Modifier le profil'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.list(
                children: [
                  _SectionCard(
                    title: 'Informations personnelles',
                    children: [
                      _tile(
                        icon: Icons.email_outlined,
                        label: 'ethanhall@gmail.com',
                      ),
                      _tile(
                        icon: Icons.calendar_month_outlined,
                        label: 'Né le 15 mars 2006',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    title: 'Préférences',
                    children: [
                      _tile(
                        icon: Icons.dark_mode_outlined,
                        label: 'Mode sombre',
                        trailing: Switch(
                          value: true,
                          onChanged: (v) {

                          },
                        ),
                      ),
                      _tile(
                        icon: Icons.language_outlined,
                        label: 'Langues',
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColors.white),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    title: 'Comptes',
                    children: [
                      _tile(
                        icon: Icons.password_outlined,
                        label: 'Changer de mot de passe',
                        onTap: () {},
                      ),
                      _tile(
                        icon: Icons.logout,
                        label: 'Se déconnecter',
                        trailing: const Icon(Icons.chevron_right,
                            color: AppColors.white),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    title: 'Plus d’informations',
                    children: [
                      _tile(
                        icon: Icons.description_outlined,
                        label: 'Conditions d’utilisation',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'v1.0.0',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      container: true,
      label: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            child: ListTileTheme(
              iconColor: AppColors.white,
              textColor: AppColors.white,
              child: Column(children: _withDividers(children)),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _withDividers(List<Widget> tiles) {
    final List<Widget> result = [];
    for (var i = 0; i < tiles.length; i++) {
      result.add(tiles[i]);
      if (i != tiles.length - 1) {
        result.add(Divider(
          height: 1,
          thickness: 0.6,
          color: Colors.white.withOpacity(0.12),
        ));
      }
    }
    return result;
  }
}

Widget _tile({
  required IconData icon,
  required String label,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: AppColors.white),
    title: Text(
      label,
      style: const TextStyle(color: AppColors.white),
      overflow: TextOverflow.ellipsis,
    ),
    trailing: trailing,
    onTap: onTap,
    dense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
