import 'package:litera_app/features/book_detail/model/book_info.dart';

class HomeBookItemData {
  final String bookId, ownerId;
  final int pricePerDay;
  final List<String> imageUrls;
  final BookInfo bookInfo;
  String get title => bookInfo.title;
  String get author => bookInfo.author;
  String get displayImageUrl => imageUrls.isNotEmpty ? imageUrls[0] : '';
  HomeBookItemData({ required this.bookId, required this.ownerId, required this.pricePerDay, required this.imageUrls, required this.bookInfo });
}