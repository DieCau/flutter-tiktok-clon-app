import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clone/features/home/data/datasource/network/datasource_ntw.dart';
import 'package:tiktok_clone/features/home/data/repositories/profile_repository_impl.dart';
import 'package:tiktok_clone/features/home/domain/models/my_videos_model.dart';
import 'package:tiktok_clone/features/home/ui/bloc/bloc/perfil_bloc/perfil_bloc.dart';
import 'package:tiktok_clone/features/home/ui/bloc/cubit/home_page_controller_cubit.dart';
import 'package:tiktok_clone/shared/constants/colors.dart';
import 'package:tiktok_clone/shared/constants/icons_svg.dart';
import 'package:tiktok_clone/shared/widgets/video_player_widget.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<HomePageControllerCubit, HomePageControllerState>(
      builder: (context, state) {
        return Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: DefaultTabController(
            length: 3,
            child: BlocProvider(
              create: (context) => PerfilBloc(
                profileRepository: ProfileRepositoryImpl(
                  datasourcesNtw: DatasourcesNtw(),
                ),
              )
                ..add(FetchByIdEvent(id: state.id))
                ..add(FetchInteractionEvent(id: state.id))
                ..add(FetchMyVideosListEvent(id: state.id))
                ..add(FetchSharedVideosListEvent(id: state.id))
                ..add(FetchLikeVideosListEvent(id: state.id)),
              child: NestedScrollView(
                headerSliverBuilder: (context, index) {
                  return <Widget>[
                    const SliverAppbarWidget(),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: MyDelegate(
                        tabBar: const TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(Icons.menu),
                            ),
                            Tab(
                              icon: Icon(Icons.share_outlined),
                            ),
                            Tab(
                              icon: Icon(Icons.favorite_border_outlined),
                            ),
                          ],
                          indicatorColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    BlocBuilder<PerfilBloc, PerfilState>(
                      builder: (context, state) {
                        return ListGridWidget(
                          itemCount: state.myListVideos.length,
                          listVideos: state.myListVideos,
                        );
                      },
                    ),
                    BlocBuilder<PerfilBloc, PerfilState>(
                      builder: (context, state) {
                        return ListGridWidget(
                          itemCount: state.sharedListVideos.length,
                          listVideos: state.sharedListVideos,
                        );
                      },
                    ),
                    BlocBuilder<PerfilBloc, PerfilState>(
                      builder: (context, state) {
                        return ListGridWidget(
                          itemCount: state.likeListVideos.length,
                          listVideos: state.likeListVideos,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SliverAppbarWidget extends StatelessWidget {
  const SliverAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<PerfilBloc, PerfilState>(
      builder: (context, state) {
        final item = state.foryouProfileModel;
        return SliverAppBar(
          leading: const Icon(Icons.arrow_back_ios),
          pinned: true,
          actions: [
            SvgPicture.asset(
              IconsSvg.bell,
              height: 30,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                IconsSvg.shareOutlined,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
          title: Text(
            item.name,
            style: textTheme.displayLarge!.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          expandedHeight: size.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    backgroundImage: item.imageProfile.isNotEmpty
                        ? NetworkImage(item.imageProfile)
                        : const NetworkImage(
                            'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.email,
                    style: textTheme.displayMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FollowingWidget(
                        number: state.interactionModel.following.toString(),
                        name: 'Siguiendo',
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.grey,
                      ),
                      FollowingWidget(
                        number: state.interactionModel.follores.toString(),
                        name: 'Seguidores',
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.grey,
                      ),
                      FollowingWidget(
                        number: state.interactionModel.likes.toString(),
                        name: 'Me gusta',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          "Seguir",
                          style: textTheme.displayMedium!.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          "Mensajes",
                          style: textTheme.displayMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        alignment: Alignment.center,
                        height: 47,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.lastName,
                    style: textTheme.displayLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Instagram",
                    style: textTheme.displayLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FollowingWidget extends StatelessWidget {
  const FollowingWidget({
    super.key,
    required this.number,
    required this.name,
  });
  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          number,
          style: textTheme.displayLarge!.copyWith(color: Colors.black),
        ),
        Text(
          name,
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class ListGridWidget extends StatelessWidget {
  const ListGridWidget({super.key, required this.itemCount, required this.listVideos});

  final int itemCount;
  final List<MyVideosModel> listVideos;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        final item = listVideos[index];
        return Container(
          color: AppColors.grey,
          child: VideoPlayerWidget(
            play: false,
            ktoplbarheigh: false,
            url: item.url,
          ),
        );
      },
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MyDelegate({required this.tabBar});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // O cualquier color que se ajuste al diseño de tu app
      child: Column(
        children: [
          tabBar,
        ],
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
