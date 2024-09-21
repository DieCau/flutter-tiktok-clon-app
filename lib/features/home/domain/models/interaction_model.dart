import 'package:equatable/equatable.dart';

class InteractionModel extends Equatable {
  final int idUser;
  final int following;
  final int follores;
  final int likes;

  const InteractionModel({
    required this.idUser,
    required this.following,
    required this.follores,
    required this.likes,
  });

  factory InteractionModel.fromJson(Map<String, dynamic> json) => InteractionModel(
        idUser: json['id_user'],
        following: json['followings'],
        follores: json['followers'],
        likes: json['likes'],
      );

  @override
  List<Object?> get props => [idUser, following, follores, likes];
}
