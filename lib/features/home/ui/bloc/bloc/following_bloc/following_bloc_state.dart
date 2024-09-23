part of 'following_bloc_bloc.dart';

enum FollowingStatus { initial, loading, sucess, error }

class FollowingBlocState extends Equatable {
  final List<FollowingModel> followingList;
  final FollowingStatus follingStatus;
  const FollowingBlocState(
    this.followingList,
    this.follingStatus,
  );

  FollowingBlocState copyWith({
    List<FollowingModel>? followingList,
    FollowingStatus? follingStatus,
  }) =>
      FollowingBlocState(
        followingList ?? this.followingList,
        follingStatus ?? this.follingStatus,
      );

  @override
  List<Object> get props => [followingList, follingStatus];
}
