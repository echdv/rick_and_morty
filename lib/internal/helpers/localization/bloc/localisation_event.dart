// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localisation_bloc.dart';

abstract class LocalisationEvent {}

class ChangeLocaleEvent extends LocalisationEvent {
  final String locale;

  ChangeLocaleEvent({required this.locale});
}
