import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/comment_model.dart';
import 'package:litera_app/features/book_detail/view/widgets/comment_item.dart';

class CommentTabView extends StatelessWidget {
  const CommentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk komentar dengan URL gambar yang lebih stabil
    final List<CommentModel> comments = [
      CommentModel(id: '1', userName: 'Kides', userImageUrl: 'https://ui-avatars.com/api/?name=Kides&background=random', text: 'Ini bagus bgt bukunya'),
      CommentModel(id: '2', userName: 'Ayu', userImageUrl: 'https://ui-avatars.com/api/?name=Ayu&background=random', text: 'Setuju! Alur ceritanya tidak terduga.'),
      CommentModel(id: '3', userName: 'Budi', userImageUrl: 'https://ui-avatars.com/api/?name=Budi&background=random', text: 'Salah satu buku terbaik tahun ini.'),
    ];

    // Menggunakan Column untuk menempatkan input field di bawah list
    return Column(
      children: [
        // Daftar Komentar
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return CommentItem(comment: comments[index]);
            },
          ),
        ),
        // Input field untuk komentar baru
        _buildCommentInputField(context),
      ],
    );
  }

  Widget _buildCommentInputField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tulis Komentar',
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: Pallete.primaryColor),
            onPressed: () {},
          )
        ),
      ),
    );
  }
}
