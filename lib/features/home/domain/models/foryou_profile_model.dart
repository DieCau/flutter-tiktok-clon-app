import 'package:equatable/equatable.dart';

class ForyouProfileModel extends Equatable {
  final int id;
  final String imageProfile;
  final String name;
  final String lastName;
  final String email;

  const ForyouProfileModel(
      {required this.id,
      required this.imageProfile,
      required this.name,
      required this.lastName,
      required this.email});

  factory ForyouProfileModel.fromJson(Map<String, dynamic> json) {
    return ForyouProfileModel(
      id: json['id'],
      imageProfile: json['image_profile'] ?? "",
      name: json['name'],
      lastName: json['lastname'],
      email: json['email'],
    );
  }

  @override
  List<Object?> get props => [id, imageProfile, name, lastName, email];
}
