import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clone/features/home/ui/bloc/cubit/home_page_controller_cubit.dart';
import 'package:tiktok_clone/shared/constants/colors.dart';

import 'package:tiktok_clone/shared/constants/icons_svg.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomePageControllerCubit, HomePageControllerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: widget.preferredSize.height,
            width: widget.preferredSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          IconsSvg.camera,
                          width: 25,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 2),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 14,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 10,
                                    backgroundImage: NetworkImage(
                                        "https://cdn.pixabay.com/photo/2024/04/25/17/19/ai-generated-8720322_1280.jpg"),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.pink,
                                    width: 2,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png"),
                                  radius: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ...List.generate(
                  2,
                  (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          context.read<HomePageControllerCubit>().updatePage(page: index);

                          selectedIndex = state.page;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: IconAppbarWIdget(
                          isSelected: state.page == index,
                          title: appbarList[index]['title']!,
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          IconsSvg.live,
                          height: 25,
                        ),
                      ),
                      SvgPicture.asset(
                        IconsSvg.search,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconAppbarWIdget extends StatelessWidget {
  const IconAppbarWIdget({super.key, required this.isSelected, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: isSelected
              ? textTheme.displayLarge
              : textTheme.displayLarge!.copyWith(
                  color: AppColors.grey0,
                  fontWeight: FontWeight.normal,
                ),
        ),
        const SizedBox(height: 5),
        AnimatedContainer(
          height: 4,
          width: 35,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
