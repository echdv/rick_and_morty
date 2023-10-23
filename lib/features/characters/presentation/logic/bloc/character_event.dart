part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class GetCharacterEvent extends CharacterEvent {
  final bool isFirstCall;
  final int page;

  GetCharacterEvent({
    this.isFirstCall = false,
    required this.page,
  });
}

class GetCharacterEpisodeEvent extends CharacterEvent {
  final CharacterResult characterModel;

  GetCharacterEpisodeEvent({required this.characterModel});
}
