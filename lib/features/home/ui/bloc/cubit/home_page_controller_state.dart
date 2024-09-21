part of 'home_page_controller_cubit.dart';

class HomePageControllerState extends Equatable {
  final PageController pageController;
  final int page;
  final int id;

  const HomePageControllerState({
    required this.pageController,
    required this.page,
    required this.id,
  });

  HomePageControllerState copyWith({
    PageController? pageController,
    int? page,
    int? id,
  }) =>
      HomePageControllerState(
        pageController: pageController ?? this.pageController,
        page: page ?? this.page,
        id: id ?? this.id,
      );

  @override
  List<Object> get props => [id, page, pageController];
}
