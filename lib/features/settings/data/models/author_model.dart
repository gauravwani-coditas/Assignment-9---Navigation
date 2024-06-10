import 'package:routing/features/settings/domain/entities/author_entity.dart';

class AuthorModel extends AuthorEntity {
  String authorName;
  String authorDescription;

  AuthorModel({required this.authorName, required this.authorDescription})
      : super(authorName: authorName, authorDescription: authorDescription);

  Map<String, dynamic> toMap() {
    return {
      'authorName': authorName,
      'authorDescription': authorDescription,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    
    return AuthorModel(
        authorName: map['authorName'].toString(),
        authorDescription: map['authorDescription'].toString());
  }
}
