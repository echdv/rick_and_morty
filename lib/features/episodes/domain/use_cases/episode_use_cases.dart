/* Local dependencies */
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episode_repository.dart';

@injectable
class EpisodeUseCases {
  final EpisodeRepository episodeRepository;

  EpisodeUseCases({required this.episodeRepository});

  Future<EpisodeModel> getEpisode(int page) async =>
      await episodeRepository.getEpisode(page);

  Future<List<CharacterResult>> getCharacter(EpisodeResult model) async =>
      await episodeRepository.getCharacter(model);
}
