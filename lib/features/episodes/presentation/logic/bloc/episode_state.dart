part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoadedState extends EpisodeState {
  final EpisodeModel episodeModel;

  EpisodeLoadedState({required this.episodeModel});
}

class EpisodeLoadingState extends EpisodeState {}

// ignore: must_be_immutable
class EpisodeErrorState extends EpisodeState {
  CatchException error;

  EpisodeErrorState({required this.error});
}

// ignore: must_be_immutable
class CharacterLoadedState extends EpisodeState {
  List<CharacterResult> characterModel;

  CharacterLoadedState({required this.characterModel});
}
