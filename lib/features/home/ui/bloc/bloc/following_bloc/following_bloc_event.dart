part of 'following_bloc_bloc.dart';

sealed class FollowingBlocEvent extends Equatable {
  const FollowingBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchAllFollowingEvent extends FollowingBlocEvent {
  const FetchAllFollowingEvent();
  @override
  List<Object> get props => [];
}
