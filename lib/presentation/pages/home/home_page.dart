import 'package:flutter/material.dart';
import 'package:easply/core/theme/app_colors.dart';
import 'package:easply/core/theme/app_text_styles.dart';
import 'package:easply/core/theme/app_shadows.dart';

import 'package:easply/data/repositories/document_repository_impl.dart';
import 'package:easply/domain/usecases/get_documents_usecase.dart';
import 'package:easply/presentation/controllers/document_controller.dart';

import 'package:easply/data/static/quick_tools_data.dart';
import 'package:easply/domain/entities/quick_tool.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DocumentController(
      GetDocumentsUseCase(DocumentRepositoryImpl()),
    );

    final documents = controller.getDocuments();

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),

          children: [
            // ================= HEADER =================
            Text(
              "Hello, User 👋",
              style: AppTextStyles.title.copyWith(fontSize: 22),
            ),

            const SizedBox(height: 16),

            // ================= QUICK TOOLS =================
            _SectionTitle(icon: Icons.flash_on, title: "Quick Tools"),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quickTools.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 0.95, // lebih kecil & compact
              ),
              itemBuilder: (context, index) {
                final QuickTool tool = quickTools[index];

                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [AppShadows.soft],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              tool.icon,
                              color: AppColors.primary,
                              size: 18,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            tool.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.body.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 18),

            // ================= YOUR DOCUMENTS =================
            _SectionTitle(icon: Icons.folder_copy, title: "Your Documents"),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [AppShadows.soft],
              ),
              child: Column(
                children: documents.map((doc) {
                  return Column(
                    children: [
                      _DocItem(
                        icon: doc.type == "CV"
                            ? Icons.picture_as_pdf
                            : Icons.description,
                        title: doc.title,
                        subtitle: doc.type == "CV"
                            ? "Manage CV files"
                            : "Manage letters",
                        buttonText: "Open",
                        onTap: () {},
                      ),
                      const Divider(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 18),

            // ================= RECENT ACTIVITY =================
            _SectionTitle(icon: Icons.history, title: "Recent Activity"),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [AppShadows.soft],
              ),
              child: Column(
                children: const [
                  _ActivityItem(
                    icon: Icons.description,
                    title: "Created Cover Letter",
                    time: "2 min ago",
                  ),
                  Divider(),
                  _ActivityItem(
                    icon: Icons.picture_as_pdf,
                    title: "Exported CV",
                    time: "1 hour ago",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.picture_as_pdf,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _DocItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _DocItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: AppTextStyles.body.copyWith(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        TextButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: AppTextStyles.body.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 6),
        Text(title, style: AppTextStyles.title.copyWith(fontSize: 15)),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.body.copyWith(fontSize: 12),
            ),
          ),

          Text(
            time,
            style: AppTextStyles.body.copyWith(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
