/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/domain/use_cases/episode_use_cases.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

/* Local dependencies */

part 'episode_event.dart';
part 'episode_state.dart';

@injectable
class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeUseCases useCases;

  EpisodeBloc(this.useCases) : super(EpisodeInitial()) {
    on<EpisodeEvent>((event, emit) {});

    on<GetEpisodeEvent>((event, emit) async {
      if (event.isFirstCall) {
        emit(EpisodeLoadingState());
      }

      await useCases
          .getEpisode(event.page)
          .then((episodeModel) =>
              emit(EpisodeLoadedState(episodeModel: episodeModel)))
          .onError((error, stackTrace) => emit(EpisodeErrorState(
              error: CatchException.convertException(error))));
    });

    on<GetCharacterEvent>((event, emit) async {
      emit(EpisodeLoadingState());

      await useCases
          .getCharacter(event.episodeModel)
          .then((characterModel) =>
              emit(CharacterLoadedState(characterModel: characterModel)))
          .onError((error, stackTrace) => emit(EpisodeErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
