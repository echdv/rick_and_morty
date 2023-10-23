/* External dependencies */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/domain/use_cases/character_use_cases.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

/* Local dependencies */
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';
part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactherUseCases useCases;

  CharacterBloc(this.useCases) : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) {});

    on<GetCharacterEvent>((event, emit) async {
      if (event.isFirstCall) {
        emit(CharacterLoadingState());
      }

      await useCases
          .getCharacter(event.page)
          .then((characterModel) =>
              emit(CharacterLoadedState(characterModel: characterModel)))
          .onError((error, stackTrace) => emit(CharacterErrorState(
              error: CatchException.convertException(error))));
    });

    on<GetCharacterEpisodeEvent>((event, emit) async {
      emit(CharacterLoadingState());

      await useCases
          .getEpisode(event.characterModel)
          .then((characterEpisodeModel) => emit(
              EpisodeLoadedState(characterEpisodeModel: characterEpisodeModel)))
          .onError((error, stackTrace) => emit(CharacterErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
