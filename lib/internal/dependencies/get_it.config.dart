// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/characters/data/repositories/character_repository_impl.dart'
    as _i4;
import '../../features/characters/domain/repositories/character_repository.dart'
    as _i3;
import '../../features/characters/domain/use_cases/character_use_cases.dart'
    as _i5;
import '../../features/characters/presentation/logic/bloc/character_bloc.dart'
    as _i13;
import '../../features/episodes/data/repositories/episode_repository_impl.dart'
    as _i7;
import '../../features/episodes/domain/repositories/episode_repository.dart'
    as _i6;
import '../../features/episodes/domain/use_cases/episode_use_cases.dart' as _i8;
import '../../features/episodes/presentation/logic/bloc/episode_bloc.dart'
    as _i14;
import '../../features/settings/data/repositories/profile_repository_impl.dart'
    as _i11;
import '../../features/settings/domain/repositories/profile_repository.dart'
    as _i10;
import '../../features/settings/domain/use_cases/profile_use_cases.dart'
    as _i12;
import '../../features/settings/presentation/logic/bloc/profile_bloc.dart'
    as _i15;
import '../helpers/localization/bloc/localisation_bloc.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CharacterRepository>(() => _i4.CharacterRepositoryImpl());
  gh.factory<_i5.CharactherUseCases>(() => _i5.CharactherUseCases(
      characterRepository: gh<_i3.CharacterRepository>()));
  gh.factory<_i6.EpisodeRepository>(() => _i7.EpisodeRepositoryImpl());
  gh.factory<_i8.EpisodeUseCases>(() =>
      _i8.EpisodeUseCases(episodeRepository: gh<_i6.EpisodeRepository>()));
  gh.singleton<_i9.LocalisationBloc>(_i9.LocalisationBloc());
  gh.factory<_i10.ProfileRepository>(() => _i11.ProfileRepositoryImpl());
  gh.factory<_i12.ProfileUseCases>(() =>
      _i12.ProfileUseCases(profileRepository: gh<_i10.ProfileRepository>()));
  gh.factory<_i13.CharacterBloc>(
      () => _i13.CharacterBloc(gh<_i5.CharactherUseCases>()));
  gh.factory<_i14.EpisodeBloc>(
      () => _i14.EpisodeBloc(gh<_i8.EpisodeUseCases>()));
  gh.factory<_i15.ProfileBloc>(
      () => _i15.ProfileBloc(gh<_i12.ProfileUseCases>()));
  return getIt;
}
