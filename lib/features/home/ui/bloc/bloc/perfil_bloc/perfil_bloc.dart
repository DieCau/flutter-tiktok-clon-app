import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiktok_clone/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clone/features/home/domain/models/interaction_model.dart';
import 'package:tiktok_clone/features/home/domain/models/my_videos_model.dart';
import 'package:tiktok_clone/features/home/domain/repositories/profile_repository.dart';

part 'perfil_event.dart';
part 'perfil_state.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  final ProfileRepository profileRepository;

  PerfilBloc({
    required this.profileRepository,
  }) : super(const PerfilState(
          foryouProfileModel: ForyouProfileModel(
            id: 0,
            imageProfile: '',
            name: '',
            lastName: '',
            email: '',
          ),
          interactionModel: InteractionModel(
            idUser: 0,
            following: 0,
            follores: 0,
            likes: 0,
          ),
          myListVideos: [],
          sharedListVideos: [],
          likeListVideos: [],
        )) {
    on<FetchByIdEvent>(perfilEventState);
    on<FetchInteractionEvent>(interactionId);
    on<FetchMyVideosListEvent>(fetchMyVideosListEventState);
    on<FetchSharedVideosListEvent>(fetchSharedVideosListEventState);
    on<FetchLikeVideosListEvent>(fetchLikeVideosListEventState);
  }

  Future<void> perfilEventState(FetchByIdEvent event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(
      perfilStatus: PerfilStatus.loading,
    ));
    try {
      final object = await profileRepository.fetchByIdProfile(id: event.id);
      emit(state.copyWith(
        foryouProfileModel: object,
        perfilStatus: PerfilStatus.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(perfilStatus: PerfilStatus.error));
    }
  }

  Future<void> interactionId(FetchInteractionEvent event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(
      perfilStatus: PerfilStatus.loading,
    ));
    try {
      final object = await profileRepository.fetInteraction(idUser: event.id);
      emit(state.copyWith(
        interactionModel: object,
        perfilStatus: PerfilStatus.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(perfilStatus: PerfilStatus.error));
    }
  }

  Future<void> fetchMyVideosListEventState(
      FetchMyVideosListEvent event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(
      perfilStatus: PerfilStatus.loading,
    ));
    try {
      final object = await profileRepository.fetchListMyvideos(idUser: event.id);
      emit(state.copyWith(
        myListVideos: object,
        perfilStatus: PerfilStatus.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(perfilStatus: PerfilStatus.error));
    }
  }

  Future<void> fetchSharedVideosListEventState(
      FetchSharedVideosListEvent event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(
      perfilStatus: PerfilStatus.loading,
    ));
    try {
      final object = await profileRepository.fetchListSharedVideos(idUser: event.id);
      emit(state.copyWith(
        sharedListVideos: object,
        perfilStatus: PerfilStatus.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(perfilStatus: PerfilStatus.error));
    }
  }

  Future<void> fetchLikeVideosListEventState(
      FetchLikeVideosListEvent event, Emitter<PerfilState> emit) async {
    emit(state.copyWith(
      perfilStatus: PerfilStatus.loading,
    ));
    try {
      final object = await profileRepository.fetchListLikeVideos(idUser: event.id);
      emit(state.copyWith(
        likeListVideos: object,
        perfilStatus: PerfilStatus.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(perfilStatus: PerfilStatus.error));
    }
  }
}
