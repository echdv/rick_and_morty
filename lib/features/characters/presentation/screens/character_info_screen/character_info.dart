/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_episode_card.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_image_card.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_info_card.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/episode_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/rick_and_morty_utils.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';
class CharacterInfo extends StatefulWidget {
  final CharacterResult characterModel;

  const CharacterInfo({super.key, required this.characterModel});

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  late CharacterBloc bloc;

  @override
  void initState() {
    bloc = getIt<CharacterBloc>();
    bloc.add(GetCharacterEpisodeEvent(characterModel: widget.characterModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CharacterImageCard(
            characterModel: widget.characterModel,
          ),
          SizedBox(height: 90.h),
          Center(
            child: Text(
              widget.characterModel.name.toString(),
              style: TextStyle(
                color: ThemeHelper.primaryBlack,
                fontSize: 34.sp,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Text(
              getStatus(
                widget.characterModel.status!,
              ),
              style: TextStyle(
                color: colorStatus(
                  widget.characterModel.status,
                ),
              ),
            ),
          ),
          SizedBox(height: 36.h),
          CharacterInfoCard(
            characterModel: widget.characterModel,
          ),
          SizedBox(height: 36.h),
          Divider(
            color: ThemeHelper.primaryGrey,
            thickness: 0,
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  S.of(context).episodes_,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: ThemeHelper.primaryBlack,
                  ),
                ),
                const Spacer(),
                Text(
                  S.of(context).all_episodes,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ThemeHelper.primaryGrey2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          BlocBuilder<CharacterBloc, CharacterState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CharacterLoadingState) {
                return const EpisodeShimmerCard();
              }

              if (state is EpisodeLoadedState) {
                return CharacterEpisodeCard(
                  characterEpisodeModel: state.characterEpisodeModel,
                  characterModel: widget.characterModel,
                );
              }

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
