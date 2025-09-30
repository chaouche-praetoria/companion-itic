import 'package:flutter/material.dart';
import '../../utils/theme/brand_gradients.dart';
import '../../utils/theme/theme_controller.dart';
import '../../widgets/profile_avatar.dart';


class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  BrandGradients _brand(BuildContext context) {
    final ext = Theme.of(context).extension<BrandGradients>();
    if (ext != null) return ext;
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
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final brand = _brand(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [brand.g1, brand.g2, brand.g3],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: cs.surface.withOpacity(isDark ? 0.35 : 0.85),
                padding: const EdgeInsets.all(20),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      const ProfileAvatar(radius: 72),
                      const SizedBox(height: 16),
                      Text(
                        'Ethan Mathieu',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: brand.text,
                          fontWeight: FontWeight.w700,
                          shadows: [Shadow(blurRadius: 8, color: brand.textShadow)],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Étudiant en 2ème année',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: brand.text.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: cs.primary,
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
                        trailing: ValueListenableBuilder(
                          valueListenable: ThemeController.instance.mode,
                          builder: (context, mode, _) {
                            final isDarkSwitch =
                                ThemeController.instance.materialMode == ThemeMode.dark;
                            return Switch(
                              value: isDarkSwitch,
                              onChanged: (v) async {
                                await ThemeController.instance.toggleLightDark();
                              },
                            );
                          },
                        ),
                      ),
                      _tile(
                        icon: Icons.language_outlined,
                        label: 'Langues',
                        trailing: Icon(Icons.chevron_right, color: cs.onSurface),
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
                        trailing: Icon(Icons.chevron_right, color: cs.onSurface),
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
                        color: cs.onSurfaceVariant,
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
    final cs = theme.colorScheme;
    final brand = theme.extension<BrandGradients>();

    return Semantics(
      container: true,
      label: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: brand?.text ?? cs.onBackground,
              fontWeight: FontWeight.w700,
              shadows: [if (brand != null) Shadow(blurRadius: 6, color: brand.textShadow)],
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: cs.surfaceVariant.withOpacity(
              theme.brightness == Brightness.dark ? 0.5 : 0.85,
            ),
            borderRadius: BorderRadius.circular(16),
            child: ListTileTheme(
              iconColor: cs.onSurface,
              textColor: cs.onSurface,
              child: Column(children: _withDividers(children, cs)),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _withDividers(List<Widget> tiles, ColorScheme cs) {
    final List<Widget> result = [];
    for (var i = 0; i < tiles.length; i++) {
      result.add(tiles[i]);
      if (i != tiles.length - 1) {
        result.add(Divider(
          height: 1,
          thickness: 0.6,
          color: cs.outlineVariant.withOpacity(0.4),
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
  return Builder(
    builder: (context) {
      final theme = Theme.of(context);
      final cs = theme.colorScheme;
      final brand = theme.extension<BrandGradients>();

      return ListTile(
        leading: Icon(icon, color: cs.onSurface),
        title: Text(
          label,
          style: TextStyle(color: brand?.text ?? cs.onSurface),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: trailing,
        onTap: onTap,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.transparent,
        hoverColor: cs.primary.withOpacity(0.04),
      );
    },
  );
}
