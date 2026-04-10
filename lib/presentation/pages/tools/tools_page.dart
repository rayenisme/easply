import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:easply/core/theme/app_colors.dart';
import 'package:easply/core/theme/app_shadows.dart';
import 'package:easply/core/theme/app_text_styles.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();

    final Map<String, List<Map<String, dynamic>>> groupedTools = {
      "PDF Tools": [
        {"title": "Image to PDF", "icon": Icons.picture_as_pdf},
        {"title": "Bundle PDF", "icon": Icons.picture_as_pdf_outlined},
      ],
      "CV Tools": [
        {"title": "Creative CV", "icon": Icons.description},
        {"title": "ATS CV", "icon": Icons.article},
      ],
      "Photo Tools": [
        {"title": "Pas Photo Resizer", "icon": Icons.person},
        {"title": "Background Changer", "icon": Icons.filter},
      ],
    };

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Alat"),
        centerTitle: true,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(14),

        children: groupedTools.entries.map((category) {
          final tools = category.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.key,
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: tools.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                  // 🔥 MAKIN COMPACT
                  childAspectRatio: 1.4,
                ),

                itemBuilder: (context, index) {
                  final tool = tools[index];

                  return GestureDetector(
                    onTap: () {
                      logger.i(tool["title"]);
                    },

                    child: Container(
                      padding: const EdgeInsets.all(10), // 🔥 lebih kecil

                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [AppShadows.soft],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tool["icon"],
                            size: 28, // 🔥 diperkecil
                            color: AppColors.primary,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            tool["title"],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,

                            style: AppTextStyles.body.copyWith(
                              fontSize: 12, // 🔥 lebih kecil
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),
            ],
          );
        }).toList(),
      ),
    );
  }
}
