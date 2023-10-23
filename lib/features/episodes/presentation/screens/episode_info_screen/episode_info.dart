/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/presentation/logic/bloc/episode_bloc.dart';
import 'package:rick_and_morty/features/episodes/presentation/widgets/episode_characters_card.dart';
import 'package:rick_and_morty/features/episodes/presentation/widgets/video_play_card.dart';

/* Local dependencies */
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/character_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class EpisodeInfo extends StatefulWidget {
  final EpisodeResult episodeModel;

  const EpisodeInfo({
    super.key,
    required this.episodeModel,
  });

  @override
  State<EpisodeInfo> createState() => _EpisodeInfoState();
}

class _EpisodeInfoState extends State<EpisodeInfo> {
  late EpisodeBloc bloc;

  @override
  void initState() {
    bloc = getIt<EpisodeBloc>();
    bloc.add(GetCharacterEvent(episodeModel: widget.episodeModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/episodeImage.png',
            height: 298.h,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(top: 251.h),
            width: 1.sw,
            decoration: BoxDecoration(
              color: ThemeHelper.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 82.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.episodeModel.name.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeHelper.primaryBlack,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Серия ${widget.episodeModel.id}',
                    style: TextStyle(
                      color: ThemeHelper.primaryAuthButton,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Премьера',
                    style: TextStyle(
                      color: ThemeHelper.primaryGrey3,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    widget.episodeModel.airDate.toString(),
                    style: TextStyle(
                      color: ThemeHelper.primaryBlack,
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                const Divider(),
                SizedBox(height: 36.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    S.of(context).characters,
                    style: TextHelper.span20,
                  ),
                ),
                SizedBox(height: 24.h),
                BlocConsumer<EpisodeBloc, EpisodeState>(
                  bloc: bloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is EpisodeLoadingState) {
                      return const CharacterShimmerScreen();
                    }
                    if (state is CharacterLoadedState) {
                      return EpisodeCharacterCard(
                          characterModel: state.characterModel);
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          const VideoPlayCard(),
          Positioned(
            top: 20.h,
            left: 20.w,
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
        ],
      ),
    );
  }
}
