import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/home/data/datasource/network/datasource_ntw.dart';
import 'package:tiktok_clone/features/home/data/repositories/fouryou_repository_impl.dart';
import 'package:tiktok_clone/features/home/ui/bloc/bloc/foryou_bloc/foryou_bloc.dart';
import 'package:tiktok_clone/features/home/ui/bloc/cubit/home_page_controller_cubit.dart';
import 'package:tiktok_clone/features/home/ui/page/following_page.dart';
import 'package:tiktok_clone/features/home/ui/page/foryou_page.dart';
import 'package:tiktok_clone/features/home/ui/page/perfil_page.dart';
import 'package:tiktok_clone/shared/widgets/appbar_widget.dart';
import 'package:tiktok_clone/shared/widgets/navbar_widget.dart';

class HomeScreen extends StatelessWidget {
  static const name = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ForyouBloc(
        foryouRepository: ForyouRepositoryImpl(
          foryouDatasourcesNtw: DatasourcesNtw(),
        ),
      )..add(const FetchDataEvent()),
      child: BlocBuilder<HomePageControllerCubit, HomePageControllerState>(
        builder: (context, state) {
          return Scaffold(
            body: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height,
                    width: size.width,
                    child: PageView(
                      controller: state.pageController,
                      onPageChanged: context.read<HomePageControllerCubit>().onPageChanged,
                      children: const [
                        FollowingPage(),
                        ForyouPage(),
                        PerfilPage(),
                      ],
                    ),
                  ),
                  state.page != 2
                      ? const Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: AppbarWidget(),
                        )
                      : const SizedBox(),
                  state.page != 2
                      ? const Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: NavbarWidget(),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
