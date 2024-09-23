part of 'perfil_bloc.dart';

class PerfilEvent extends Equatable {
  const PerfilEvent();

  @override
  List<Object> get props => [];
}

class FetchByIdEvent extends PerfilEvent {
  final int id;
  const FetchByIdEvent({required this.id});
}

class FetchInteractionEvent extends PerfilEvent {
  final int id;
  const FetchInteractionEvent({required this.id});
}

class FetchMyVideosListEvent extends PerfilEvent {
  final int id;
  const FetchMyVideosListEvent({required this.id});
}

class FetchSharedVideosListEvent extends PerfilEvent {
  final int id;
  const FetchSharedVideosListEvent({required this.id});
}

class FetchLikeVideosListEvent extends PerfilEvent {
  final int id;
  const FetchLikeVideosListEvent({required this.id});
}
