/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/location_card.dart';

/* Local dependencies */
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/rick_and_morty_utils.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';
class CharacterInfoCard extends StatelessWidget {
  final CharacterResult characterModel;

  const CharacterInfoCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).bio_rick,
            style: TextStyle(color: ThemeHelper.primaryBlack),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).floor,
                      style: TextStyle(
                        color: ThemeHelper.primaryGrey3,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      getGender(
                        characterModel.gender,
                      ),
                      style: TextStyle(color: ThemeHelper.primaryBlack),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).race,
                      style: TextStyle(
                        color: ThemeHelper.primaryBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      getSpecies(characterModel.species),
                      style: TextStyle(color: ThemeHelper.primaryBlack),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          LocationCard(
            origin:
                characterModel.origin?.name?.toString() ?? S.of(context).false_,
            title: S.of(context).place_of_birth,
          ),
          SizedBox(height: 24.h),
          LocationCard(
            origin: characterModel.location?.name?.toString() ??
                S.of(context).false_,
            title: S.of(context).Location,
          ),
        ],
      ),
    );
  }
}
