import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

@injectable
class CharactherUseCases {
  final CharacterRepository characterRepository;

  CharactherUseCases({required this.characterRepository});

  Future<CharacterModel> getCharacter(int page) async =>
      await characterRepository.getCharacter(page);

  Future<List<EpisodeResult>> getEpisode(CharacterResult model) async =>
      await characterRepository.getEpisode(model);
}
