/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_info_screen/character_info.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/rick_and_morty_utils.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class EpisodeCharacterCard extends StatelessWidget {
  final List<CharacterResult> characterModel;

  const EpisodeCharacterCard({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: characterModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterInfo(
                    characterModel: characterModel[index],
                  ),
                ));
          },
          child: Row(
            children: [
              SizedBox(
                height: 74.r,
                width: 74.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.network(
                    characterModel[index].image.toString(),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getStatus(characterModel[index].status),
                    style: TextStyle(
                      color: colorStatus(characterModel[index].status),
                    ),
                  ),
                  Text(
                    characterModel[index].name.toString(),
                    style: TextStyle(color: ThemeHelper.primaryBlack),
                  ),
                  Row(
                    children: [
                      Text(
                        '${getGender(characterModel[index].gender)}, ',
                        style: TextStyle(
                          color: ThemeHelper.primaryGrey3,
                        ),
                      ),
                      Text(
                        getSpecies(characterModel[index].species),
                        style: TextStyle(
                          color: ThemeHelper.primaryGrey3,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios,
                  size: 15.r, color: ThemeHelper.primaryBlack)
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
