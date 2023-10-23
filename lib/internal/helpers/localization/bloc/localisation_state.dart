// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localisation_bloc.dart';

@immutable
sealed class LocalisationState {}

final class LocalisationInitial extends LocalisationState {}

class LocalisationLodingState extends LocalisationState {}

class LocalisationLodedState extends LocalisationState {
  final String locale;
  
  LocalisationLodedState({required this.locale});
}

class LocalisationErrorState extends LocalisationState {}
