import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CharacterModel> getCharacter(int page) async {
    try {
      Response response = await apiRequester.toGet(
        'character',
        param: {'page': page},
        queryParams: {},
      );

      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<List<EpisodeResult>> getEpisode(CharacterResult model) async {
    try {
      List<EpisodeResult> episodeModelList = [];

      for (var element in model.episode!) {
        Response response = await apiRequester
            .toGet('episode/${element.substring(40)}', queryParams: {});

        episodeModelList.add(EpisodeResult.fromJson(response.data));
      }
      return episodeModelList;
    } catch (e) {
      print('error === $e');
      throw CatchException.convertException(e);
    }
  }
}
