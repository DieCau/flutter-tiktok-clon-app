import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/home/data/datasource/network/datasource_ntw.dart';
import 'package:tiktok_clone/features/home/data/repositories/following_repository_imp.dart';
import 'package:tiktok_clone/features/home/ui/bloc/bloc/following_bloc/following_bloc_bloc.dart';

import 'package:tiktok_clone/shared/constants/colors.dart';
import 'package:tiktok_clone/shared/widgets/video_player_widget.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({
    super.key,
  });

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  final PageController _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_handlePageChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _handlePageChange() {
    int page = _pageController.page!.round();

    if (_currentPage != page) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => FollowingBlocBloc(
        followingRepository: FollowingReposirotyImpl(
          datasourcesNtw: DatasourcesNtw(),
        ),
      )..add(const FetchAllFollowingEvent()),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Creadores Populares",
              style: textTheme.displayLarge,
            ),
            const SizedBox(height: 12),
            Text(
              "Sigue una cuenta para ver vides mas recientes\n aqui",
              textAlign: TextAlign.center,
              style: textTheme.displayMedium,
            ),
            Container(
              height: size.height * 0.5,
              width: double.infinity,
              color: const Color.fromARGB(0, 5, 2, 2),
              child: BlocBuilder<FollowingBlocBloc, FollowingBlocState>(
                builder: (context, state) {
                  if (state.follingStatus == FollowingStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.follingStatus == FollowingStatus.sucess) {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: state.followingList.length,
                      itemBuilder: (context, index) {
                        final item = state.followingList[index];

                        return AnimatedBuilder(
                          animation: _pageController,
                          builder: (BuildContext context, Widget? child) {
                            double value = 1.0;
                            if (_pageController.position.haveDimensions) {
                              value = _pageController.page! - index;
                              value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                            }
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: size.height * 0.5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.grey0,
                                  borderRadius: BorderRadius.circular(20),
                                ), // Placeholder for the actual content
                                child: index == _currentPage
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: VideoPlayerWidget(
                                          play: true,
                                          ktoplbarheigh: false,
                                          url: item.urlVideo,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: VideoPlayerWidget(
                                          play: false,
                                          ktoplbarheigh: false,
                                          url: item.urlVideo,
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0.9),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: item.imageProfile != "no-image"
                                          ? NetworkImage(item.imageProfile)
                                          : const NetworkImage(
                                              'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      item.name,
                                      style: textTheme.displayLarge!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "@${item.name}",
                                      style: textTheme.displayMedium,
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      height: 47,
                                      width: 160,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.pink,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Text(
                                        "Seguir",
                                        textAlign: TextAlign.center,
                                        style: textTheme.displayLarge!.copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
