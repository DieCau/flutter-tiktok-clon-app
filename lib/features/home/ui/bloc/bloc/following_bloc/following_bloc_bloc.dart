import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/features/home/domain/models/following_model.dart';
import 'package:tiktok_clone/features/home/domain/repositories/folliwing_repository.dart';

part 'following_bloc_event.dart';
part 'following_bloc_state.dart';

class FollowingBlocBloc extends Bloc<FollowingBlocEvent, FollowingBlocState> {
  final FollowingRepository followingRepository;
  FollowingBlocBloc({required this.followingRepository})
      : super(const FollowingBlocState([], FollowingStatus.initial)) {
    on<FetchAllFollowingEvent>(followingBlocEventState);
  }

  Future<void> followingBlocEventState(
      FollowingBlocEvent event, Emitter<FollowingBlocState> emit) async {
    emit(state.copyWith(follingStatus: FollowingStatus.loading));
    final followingList = [...state.followingList];
    try {
      final response = await followingRepository.fetchAllFollowing();
      followingList.addAll(response);
      emit(state.copyWith(followingList: followingList, follingStatus: FollowingStatus.sucess));
    } catch (e) {
      emit(state.copyWith(follingStatus: FollowingStatus.error));
    }
  }
}
