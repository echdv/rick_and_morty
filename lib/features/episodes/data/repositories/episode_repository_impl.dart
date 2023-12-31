import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception_helper.dart';

@Injectable(as: EpisodeRepository)
class EpisodeRepositoryImpl implements EpisodeRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<EpisodeModel> getEpisode(int page) async {
    try {
      Response response = await apiRequester.toGet(
        'episode',
        param: {'page': page},
        queryParams: {},
      );

      if (response.statusCode == 200) {
        return EpisodeModel.fromJson(response.data);
      }
      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<List<CharacterResult>> getCharacter(EpisodeResult model) async {
    try {
      List<CharacterResult> characterModelList = [];

      for (var element in model.characters!) {
        Response response = await apiRequester
            .toGet('character/${element.substring(42)}', queryParams: {});

        characterModelList.add(CharacterResult.fromJson(response.data));
      }

      return characterModelList;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
