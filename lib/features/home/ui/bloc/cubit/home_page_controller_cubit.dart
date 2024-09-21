import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_controller_state.dart';

class HomePageControllerCubit extends Cubit<HomePageControllerState> {
  HomePageControllerCubit()
      : super(
          HomePageControllerState(pageController: PageController(initialPage: 1), page: 1, id: -1),
        );

  void updatePage({required int page}) {
    state.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300), // Puedes ajustar la duración según sea necesario
      curve: Curves.ease, // Puedes ajustar la curva de animación según sea necesario
    );
    emit(state.copyWith(
      page: page,
    ));
  }

  void Function(int) get onPageChanged => (pageIndex) {
        emit(state.copyWith(page: pageIndex));
      };

  int getCurrentPageIndex() {
    return state.pageController.page?.round() ?? 0;
  }

  void idToPage(int id) {
    emit(state.copyWith(
      id: id,
    ));
  }

  @override
  Future<void> close() {
    state.pageController.dispose();
    return super.close();
  }
}
