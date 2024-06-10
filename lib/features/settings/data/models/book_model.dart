import 'package:routing/features/settings/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  String bookName;
  String bookDescription;

  BookModel({required this.bookName, required this.bookDescription})
      : super(bookName: bookName, bookDescription: bookDescription);

  Map<String, dynamic> toMap() {
    return {'bookName': bookName, 'bookDescription': bookDescription};
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
        bookName: map['bookName'].toString(), bookDescription: map['bookDescription'].toString());
  }
}
