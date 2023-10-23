/* External dependencies */
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_info_screen/character_info.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/rick_and_morty_utils.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class ListViewCard extends StatelessWidget {
  final List<CharacterResult> characterResultList;
  final ScrollController scrollController;

  const ListViewCard({
    super.key,
    required this.characterResultList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 24.h),
      controller: scrollController,
      itemCount: characterResultList.length,
      itemBuilder: (context, index) {
        if (index >= characterResultList.length - 1) {
          return Platform.isIOS
              ? CupertinoActivityIndicator(radius: 15.r)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterInfo(
                  characterModel: characterResultList[index],
                ),
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(
                height: 74.r,
                width: 74.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(600).r,
                  child: Image.network(
                    characterResultList[index].image.toString(),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getStatus(
                      characterResultList[index].status!,
                    ),
                    style: TextStyle(
                      color: colorStatus(
                        characterResultList[index].status!,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      characterResultList[index].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: ThemeHelper.primaryBlack),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '${getSpecies(
                        characterResultList[index].species,
                      )}, ',
                      style: TextStyle(
                        color: ThemeHelper.primaryGrey3,
                      ),
                      children: [
                        TextSpan(
                          text: getGender(
                            characterResultList[index].gender,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
    );
  }
}
