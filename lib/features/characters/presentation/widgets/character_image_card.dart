/* External dependencies */

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class CharacterImageCard extends StatelessWidget {
  final CharacterResult characterModel;

  const CharacterImageCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 218.h,
          width: 383.w,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Image.network(
              characterModel.image.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -69.h,
          left: 123.w,
          child: Container(
            height: 146.r,
            width: 146.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(
                width: 8.w,
                color: ThemeHelper.primaryWhite,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                characterModel.image.toString(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 61.h,
          left: 24.w,
          child: InkWell(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeHelper.primaryWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
