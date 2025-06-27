import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/comment_model.dart';

class ReplyBottomSheet extends StatelessWidget {
  final CommentModel parentComment;

  const ReplyBottomSheet({super.key, required this.parentComment});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk balasan
    final List<CommentModel> replies = [
      CommentModel(id: 'r1', userName: 'Kides', userImageUrl: 'https://placehold.co/40x40/EFEFEF/AAAAAA&text=K', text: 'Ini bagus bgt bukunya'),
      CommentModel(id: 'r2', userName: 'Kides', userImageUrl: 'https://placehold.co/40x40/EFEFEF/AAAAAA&text=K', text: 'Ini bagus bgt bukunya'),
      CommentModel(id: 'r3', userName: 'Kides', userImageUrl: 'https://placehold.co/40x40/EFEFEF/AAAAAA&text=K', text: 'Ini bagus bgt bukunya'),
      CommentModel(id: 'r4', userName: 'Kides', userImageUrl: 'https://placehold.co/40x40/EFEFEF/AAAAAA&text=K', text: 'Ini bagus bgt bukunya'),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle drag
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // Header
              Text(
                'Balas',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              // List balasan
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: replies.length,
                  itemBuilder: (context, index) {
                    return _buildReplyItem(replies[index]);
                  },
                ),
              ),
              // Input field untuk membalas
              _buildReplyInputField(context),
            ],
          ),
        );
      },
    );
  }

  // Widget untuk setiap item balasan (mirip CommentItem tapi tanpa tombol 'Balas')
  Widget _buildReplyItem(CommentModel comment) {
     return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(comment.userImageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Pallete.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.text,
                  style: const TextStyle(color: Pallete.textGrayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk input field di bagian bawah bottom sheet
  Widget _buildReplyInputField(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey.shade200))
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tulis balasan anda',
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
