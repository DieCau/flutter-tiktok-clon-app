import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clone/features/home/domain/models/fouryou_model.dart';

import 'package:tiktok_clone/shared/constants/colors.dart';
import 'package:tiktok_clone/shared/constants/icons_svg.dart';

class FloatingButtonsWidget extends StatelessWidget {
  const FloatingButtonsWidget({super.key, required this.item});
  final ForYouModel item;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: const AlignmentDirectional(1, 0.7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: item.imageProfile != "no-image"
                          ? NetworkImage(item.imageProfile)
                          : const NetworkImage(
                              'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.pink,
                      child: SvgPicture.asset(
                        IconsSvg.add,
                        colorFilter: const ColorFilter.mode(
                          AppColors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(
              IconsSvg.favorite,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            Text(
              "${item.like} mill",
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(
              IconsSvg.comments,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            Text(
              item.comment,
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(
              IconsSvg.save,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            Text(
              item.save,
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            SvgPicture.asset(
              IconsSvg.share,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            Text(
              item.share,
              style: textTheme.displayMedium,
            ),
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 20,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
