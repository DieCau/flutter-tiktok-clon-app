import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/home/ui/bloc/bloc/foryou_bloc/foryou_bloc.dart';
import 'package:tiktok_clone/features/home/ui/bloc/cubit/home_page_controller_cubit.dart';
import 'package:tiktok_clone/shared/widgets/description_widget.dart';

import 'package:tiktok_clone/shared/widgets/floating_bottom_widget.dart';

import 'package:tiktok_clone/shared/widgets/video_player_widget.dart';

class ForyouPage extends StatelessWidget {
  const ForyouPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ForyouBloc, ForyouState>(
      builder: (context, state) {
        if (state.status == ForyouStatus.loading) {
          return Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white38,
              ),
            ),
          );
        } else {
          return Container(
            height: size.height,
            width: size.width,
            color: Colors.black,
            child: PageView.builder(
              itemCount: state.foryouList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = state.foryouList[index];
                context.read<HomePageControllerCubit>().idToPage(item.idUser);
                return SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayerWidget(
                        play: true,
                        ktoplbarheigh: true,
                        url: item.urlVideo,
                      ),
                      FloatingButtonsWidget(
                        item: item,
                      ),
                      DescriptionWidget(item: item),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
