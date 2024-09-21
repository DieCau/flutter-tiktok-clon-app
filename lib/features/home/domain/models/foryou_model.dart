import 'package:equatable/equatable.dart';

class ForYouModel extends Equatable {
  final int idUser;
  final String urlVideo;
  final String like;
  final String comment;
  final String save;
  final String share;
  final String name;
  final String description;
  final String imageProfile;

  const ForYouModel({
    required this.idUser,
    required this.urlVideo,
    required this.like,
    required this.comment,
    required this.save,
    required this.share,
    required this.name,
    required this.description,
    required this.imageProfile,
  });

  factory ForYouModel.fromJson(Map<String, dynamic> json) {
    return ForYouModel(
      idUser: json['id_user'],
      urlVideo: json['url'],
      like: json['like'].toString(),
      comment: json['comment'].toString(),
      save: json['save'].toString(),
      share: json['share'].toString(),
      name: json['name'],
      description: json['description'],
      imageProfile: json['user']['image_profile'] ?? "no-image",
    );
  }

  ForYouModel copyWith(
          {int? idUser,
          String? urlVideo,
          String? like,
          String? comment,
          String? save,
          String? share,
          String? name,
          String? description,
          String? imageProfile}) =>
      ForYouModel(
        idUser: idUser ?? this.idUser,
        urlVideo: urlVideo ?? this.urlVideo,
        like: like ?? this.like,
        comment: comment ?? this.comment,
        save: save ?? this.save,
        share: share ?? this.share,
        name: name ?? this.name,
        description: description ?? this.description,
        imageProfile: imageProfile ?? this.imageProfile,
      );

  @override
  List<Object?> get props => [idUser, urlVideo, like, comment, save, share, imageProfile];
}
