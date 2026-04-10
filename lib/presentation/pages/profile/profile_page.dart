import 'package:flutter/material.dart';
import 'package:easply/core/theme/app_colors.dart';
import 'package:easply/core/theme/app_text_styles.dart';
import 'package:easply/core/theme/app_shadows.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // ================= USER CARD =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [AppShadows.soft],
            ),

            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person, color: Colors.white),
                ),

                const SizedBox(width: 12),

                // INFO USER
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Lengkap User",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "user@email.com",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
                        "edit profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  iconSize: 20,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Logout"),
                          content: const Text(
                            "Are you sure you want to sign out of your account?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Batal"),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);

                                // contoh: FirebaseAuth.instance.signOut();
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= MY DOCUMENT =================
          _MenuSection(
            title: "My Documents",
            icon: Icons.folder,
            items: const [
              _MenuItem("CV Saya", Icons.description),
              _MenuItem("Surat Lamaran", Icons.mail),
              _MenuItem("Other Documents", Icons.insert_drive_file),
            ],
          ),

          const SizedBox(height: 20),

          // ================= SETTINGS =================
          _MenuSection(
            title: "Settings",
            icon: Icons.settings,
            items: const [
              _MenuItem("Edit Profile", Icons.person),
              _MenuItem("Notifikasi", Icons.notifications),
              _MenuItem("Theme", Icons.color_lens),
            ],
          ),

          const SizedBox(height: 20),

          // ================= SUPPORT =================
          _MenuSection(
            title: "Support",
            icon: Icons.help,
            items: const [
              _MenuItem("Help Center", Icons.info),
              _MenuItem("Feedback", Icons.feedback),
              _MenuItem("About App", Icons.info_outline),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= SECTION =================

class _MenuSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_MenuItem> items;

  const _MenuSection({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              title,
              style: AppTextStyles.title.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [AppShadows.soft],
          ),

          child: Column(children: items),
        ),
      ],
    );
  }
}

// ================= ITEM =================

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _MenuItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),

      leading: Icon(icon, color: AppColors.primary, size: 20),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: AppColors.textSecondary,
      ),

      onTap: () {},
    );
  }
}
