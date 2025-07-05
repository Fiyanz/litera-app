import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class PhotoUploadCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final File? photoFile;
  final VoidCallback onTap;
  final String actionText;
  final bool isEnabled;

  const PhotoUploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.photoFile,
    required this.onTap,
    required this.actionText,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [const Icon(Icons.photo_camera_outlined), const SizedBox(width: 8), Text(title)]),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: isEnabled ? onTap : null,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: isEnabled ? Pallete.primaryColor : Colors.grey,
                strokeWidth: 2,
                dashPattern: const [6, 6],
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: (isEnabled ? Pallete.primaryColor : Colors.grey).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: photoFile != null
                      ? ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.file(photoFile!, fit: BoxFit.cover))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo_outlined, color: isEnabled ? Pallete.primaryColor : Colors.grey),
                            const SizedBox(height: 8),
                            Text(actionText, style: TextStyle(color: isEnabled ? Pallete.primaryColor : Colors.grey)),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}