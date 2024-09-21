import 'package:equatable/equatable.dart';

class MyVideosModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final int like;
  final int comment;
  final int share;
  final int save;
  final String url;
  final int idUer;

  const MyVideosModel({
    required this.id,
    required this.title,
    required this.description,
    required this.like,
    required this.comment,
    required this.share,
    required this.save,
    required this.url,
    required this.idUer,
  });

  factory MyVideosModel.fromJson(Map<String, dynamic> json) => MyVideosModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        like: json['like'],
        comment: json['comment'],
        share: json['share'],
        save: json['save'],
        url: json['url'],
        idUer: json['id_user'],
      );

  @override
  List<Object?> get props => [id, title, description, like, comment, share, save, url, idUer];
}
