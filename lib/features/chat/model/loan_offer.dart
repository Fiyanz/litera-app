enum LoanStatus { waiting, accepted, rejected }

class LoanOffer {
  final String offerId, bookId, bookTitle, bookOwnerId, bookImageUrl, borrowerId;
  final int durationDays, totalPrice, pricePerDay;
  final LoanStatus status;
  final DateTime createdAt;
  LoanOffer({ required this.offerId, required this.durationDays, required this.totalPrice, required this.status, required this.createdAt, required this.bookId, required this.bookTitle, required this.bookOwnerId, required this.bookImageUrl, required this.pricePerDay, required this.borrowerId });
}