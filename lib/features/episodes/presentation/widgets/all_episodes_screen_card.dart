/* External dependencies */
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/episode_info_screen/episode_info.dart';

/* Local dependencies */
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class AllEpisodeCard extends StatelessWidget {
  final List<EpisodeResult> episodeResultList;
  final ScrollController scrollController;
  final int totalCount;

  const AllEpisodeCard({
    super.key,
    required this.episodeResultList,
    required this.scrollController,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 577.h,
      child: ListView.separated(
        controller: scrollController,
        padding: EdgeInsets.zero,
        itemCount: episodeResultList.length,
        itemBuilder: (context, index) {
          if (index >= episodeResultList.length - 1) {
            return Platform.isIOS
                ? CupertinoActivityIndicator(
                    radius: 15.r,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }

          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EpisodeInfo(
                      episodeModel: episodeResultList[index],
                    ),
                  ));
            },
            child: Row(
              children: [
                SizedBox(
                  height: 60.r,
                  width: 60.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset('assets/images/episodeImage.png'),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).series,
                          style: TextStyle(
                            color: ThemeHelper.primaryAuthButton,
                          ),
                        ),
                        Text(
                          episodeResultList[index].id.toString(),
                          style: TextStyle(
                            color: ThemeHelper.primaryAuthButton,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: 259.w,
                      child: Text(
                        episodeResultList[index].name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ThemeHelper.primaryBlack,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      episodeResultList[index].airDate.toString(),
                      style: TextStyle(
                        color: ThemeHelper.primaryGrey3,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
      ),
    );
  }
}
