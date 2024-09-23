import 'package:flutter/material.dart';
import 'package:tiktok_clon_app/features/home/domain/models/foryou_model.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.item,
  });

  final ForYouModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: const AlignmentDirectional(-1, 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.name,
              style: textTheme.displayLarge,
            ),
            const SizedBox(height: 12),
            Text(
              item.description,
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
