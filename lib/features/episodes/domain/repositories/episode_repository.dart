/* Local dependencies */
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';

abstract class EpisodeRepository {
  Future<EpisodeModel> getEpisode(int page);

  Future<List<CharacterResult>> getCharacter(EpisodeResult model);
}
