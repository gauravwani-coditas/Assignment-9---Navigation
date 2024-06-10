import 'package:routing/features/settings/data/models/author_model.dart';
import 'package:routing/features/settings/data/models/book_model.dart';
import 'package:routing/features/settings/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String userName;
  String userGivenName;
  String userFamilyName;

  List<BookModel> books;
  List<AuthorModel> authors;

  UserModel(
      {required this.userName,
      required this.userGivenName,
      required this.userFamilyName,
      List<BookModel>? books,
      List<AuthorModel>? authors})
      : books = books ?? [],
        authors = authors ?? [],
        super(userGivenName: '', userFamilyName: '', userName: '');

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userGivenName': userGivenName,
      'userFamilyName': userFamilyName,
      'books': books,
      'authors': authors,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    List<dynamic> booksDynamics = map['books'] as List<dynamic>;

    List<BookModel> books = (booksDynamics)
        .map((e) => BookModel.fromMap(e as Map<String, dynamic>))
        .toList();

    List<dynamic> authorDynamics = map['authors'] as List<dynamic>;

    List<AuthorModel> authors = (authorDynamics)
        .map((e) => AuthorModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return UserModel(
      userName: map['userName'].toString(),
      userFamilyName: map['userFamilyName'].toString(),
      userGivenName: map['userGivenName'].toString() ,
      books: books,
      authors: authors,
    );
  }
}
