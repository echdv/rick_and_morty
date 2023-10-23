import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> getCharacter(int page);

  Future<List<EpisodeResult>> getEpisode(CharacterResult model);
}
