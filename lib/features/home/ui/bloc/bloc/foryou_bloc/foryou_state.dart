part of 'foryou_bloc.dart';

enum ForyouStatus { initial, loading, sucess, error }

class ForyouState extends Equatable {
  final List<ForYouModel> foryouList;
  final List<ForyouProfileModel> profilesList;
  final ForyouStatus status;
  const ForyouState({
    required this.foryouList,
    required this.status,
    required this.profilesList,
  });

  ForyouState copyWith({
    List<ForYouModel>? foryouList,
    ForyouStatus? status,
    List<ForyouProfileModel>? profilesList,
  }) =>
      ForyouState(
        foryouList: foryouList ?? this.foryouList,
        status: status ?? this.status,
        profilesList: profilesList ?? this.profilesList,
      );

  @override
  List<Object> get props => [foryouList, status, profilesList];
}
