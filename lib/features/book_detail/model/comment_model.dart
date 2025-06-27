class CommentModel {
  final String id;
  final String userName;
  final String userImageUrl;
  final String text;
  final List<CommentModel> replies; // Untuk menampung balasan

  CommentModel({
    required this.id,
    required this.userName,
    required this.userImageUrl,
    required this.text,
    this.replies = const [],
  });
}
