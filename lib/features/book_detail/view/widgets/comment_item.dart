import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/comment_model.dart';
import 'package:litera_app/features/book_detail/view/widgets/reply_buttom_sheet.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(comment.userImageUrl),
            onBackgroundImageError: (e, s) => print('Gagal memuat gambar: ${comment.userImageUrl}'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Pallete.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.text,
                  style: const TextStyle(color: Pallete.textGrayColor),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Penting agar sheet bisa menyesuaikan tinggi keyboard
                backgroundColor: Colors.transparent, // Agar sudut melengkung dari sheet terlihat
                builder: (context) => ReplyBottomSheet(parentComment: comment),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Balas',
              style: TextStyle(color: Pallete.textGrayColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
