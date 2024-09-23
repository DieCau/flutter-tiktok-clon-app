import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_model.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_profile_model.dart';
import 'package:tiktok_clon_app/features/home/domain/repositories/foryou_repository.dart';


part 'foryou_event.dart';
part 'foryou_state.dart';

class ForyouBloc extends Bloc<ForyouEvent, ForyouState> {
  final ForyouRepository foryouRepository;
  ForyouBloc({required this.foryouRepository})
      : super(const ForyouState(foryouList: [], status: ForyouStatus.initial, profilesList: [])) {
    on<FetchDataEvent>(fetchDataEventState);
    on<GetByIdEvent>(getByIdEventState);
  }

  FutureOr<void> fetchDataEventState(FetchDataEvent event, Emitter<ForyouState> emit) async {
    emit(state.copyWith(status: ForyouStatus.initial));

    final foryouList = [...state.foryouList];
    emit(state.copyWith(status: ForyouStatus.loading));
    try {
      emit(state.copyWith(foryouList: foryouList));
      final response = await foryouRepository.fetchAllForyou();
      foryouList.addAll(response);
      emit(state.copyWith(foryouList: foryouList, status: ForyouStatus.sucess));
    } catch (e) {
      emit(
        state.copyWith(status: ForyouStatus.error),
      );
    }
  }

  Future<void> getByIdEventState(GetByIdEvent event, Emitter<ForyouState> emit) async {
    final profileList = [...state.profilesList];
    try {
      final response = await foryouRepository.getProfileId(idUser: event.id);
      profileList.add(response);
      emit(state.copyWith(profilesList: profileList));
    } catch (e) {
      emit(state.copyWith(status: ForyouStatus.error));
    }
  }
}
