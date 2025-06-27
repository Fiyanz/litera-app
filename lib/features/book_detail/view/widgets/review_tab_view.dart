import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/book_detail/model/review_model.dart';
import 'package:litera_app/features/book_detail/view/widgets/review_item.dart';

class ReviewTabView extends StatelessWidget {
  const ReviewTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk review
    final List<ReviewModel> reviews = [
      ReviewModel(id: '1', userName: 'jeszya', userImageUrl: 'https://ui-avatars.com/api/?name=Jeszya&background=random', title: 'Kondisi buku:', text: 'Buku bagus keren, pengiriman oke'),
      ReviewModel(id: '2', userName: 'jeszya', userImageUrl: 'https://ui-avatars.com/api/?name=Jeszya&background=random', title: 'Kondisi buku:', text: 'Bukunya bagus keren, pengiriman oke'),
      ReviewModel(id: '3', userName: 'jeszya', userImageUrl: 'https://ui-avatars.com/api/?name=Jeszya&background=random', title: 'Kondisi buku:', text: 'Bukunya bagus keren, pengiriman oke'),
    ];

    // Menggunakan Column untuk menempatkan input field di bawah list
    return Column(
      children: [
        // Daftar Review
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ReviewItem(review: reviews[index]);
            },
          ),
        ),
        // Input field untuk review baru
        _buildReviewInputField(context),
      ],
    );
  }

  Widget _buildReviewInputField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
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
          hintText: 'Tulis Review Anda',
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: Pallete.primaryColor),
            onPressed: () {
              // TODO: Implement send review logic
            },
          )
        ),
      ),
    );
  }
}
