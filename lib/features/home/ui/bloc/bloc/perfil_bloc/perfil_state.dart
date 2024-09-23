part of 'perfil_bloc.dart';

enum PerfilStatus { initial, loading, sucess, error }

class PerfilState extends Equatable {
  final ForyouProfileModel foryouProfileModel;
  final PerfilStatus perfilStatus;
  final InteractionModel interactionModel;
  final List<MyVideosModel> myListVideos;
  final List<MyVideosModel> sharedListVideos;
  final List<MyVideosModel> likeListVideos;
  const PerfilState({
    required this.foryouProfileModel,
    required this.interactionModel,
    this.perfilStatus = PerfilStatus.initial,
    required this.myListVideos,
    required this.likeListVideos,
    required this.sharedListVideos,
  });

  PerfilState copyWith({
    ForyouProfileModel? foryouProfileModel,
    PerfilStatus? perfilStatus,
    InteractionModel? interactionModel,
    List<MyVideosModel>? myListVideos,
    List<MyVideosModel>? sharedListVideos,
    List<MyVideosModel>? likeListVideos,
  }) =>
      PerfilState(
        foryouProfileModel: foryouProfileModel ?? this.foryouProfileModel,
        perfilStatus: perfilStatus ?? this.perfilStatus,
        interactionModel: interactionModel ?? this.interactionModel,
        myListVideos: myListVideos ?? this.myListVideos,
        sharedListVideos: sharedListVideos ?? this.sharedListVideos,
        likeListVideos: likeListVideos ?? this.likeListVideos,
      );

  @override
  List<Object> get props => [foryouProfileModel, perfilStatus, interactionModel, myListVideos];
}
