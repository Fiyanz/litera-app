
import 'package:litera_app/features/chat/model/loan_offer.dart';

class ChatListItemModel {
  final String id, name, lastMessage, imageUrl;
  final DateTime timestamp;
  final LoanOffer offer; 
  ChatListItemModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    required this.timestamp,
    required this.offer,
  });
}