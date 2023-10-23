// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find characters`
  String get findcharacter {
    return Intl.message(
      'Find characters',
      name: 'findcharacter',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL CHARACTERS: `
  String get totalcharacters {
    return Intl.message(
      'TOTAL CHARACTERS: ',
      name: 'totalcharacters',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get characters {
    return Intl.message(
      'Characters',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get episod {
    return Intl.message(
      'Episodes',
      name: 'episod',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get nav_setting {
    return Intl.message(
      'setting',
      name: 'nav_setting',
      desc: '',
      args: [],
    );
  }

  /// `find episode`
  String get findepisode {
    return Intl.message(
      'find episode',
      name: 'findepisode',
      desc: '',
      args: [],
    );
  }

  /// `EPISODES: `
  String get episodes {
    return Intl.message(
      'EPISODES: ',
      name: 'episodes',
      desc: '',
      args: [],
    );
  }

  /// `episodes`
  String get episodes_ {
    return Intl.message(
      'episodes',
      name: 'episodes_',
      desc: '',
      args: [],
    );
  }

  /// `All episodes`
  String get all_episodes {
    return Intl.message(
      'All episodes',
      name: 'all_episodes',
      desc: '',
      args: [],
    );
  }

  /// `Series `
  String get series {
    return Intl.message(
      'Series ',
      name: 'series',
      desc: '',
      args: [],
    );
  }

  /// `alive`
  String get alive {
    return Intl.message(
      'alive',
      name: 'alive',
      desc: '',
      args: [],
    );
  }

  /// `dead`
  String get dead {
    return Intl.message(
      'dead',
      name: 'dead',
      desc: '',
      args: [],
    );
  }

  /// `Human`
  String get human {
    return Intl.message(
      'Human',
      name: 'human',
      desc: '',
      args: [],
    );
  }

  /// `Alien`
  String get alien {
    return Intl.message(
      'Alien',
      name: 'alien',
      desc: '',
      args: [],
    );
  }

  /// `ROBOT`
  String get robot {
    return Intl.message(
      'ROBOT',
      name: 'robot',
      desc: '',
      args: [],
    );
  }

  /// `Animal`
  String get animal {
    return Intl.message(
      'Animal',
      name: 'animal',
      desc: '',
      args: [],
    );
  }

  /// `Mythological creature`
  String get mythological {
    return Intl.message(
      'Mythological creature',
      name: 'mythological',
      desc: '',
      args: [],
    );
  }

  /// `False`
  String get false_ {
    return Intl.message(
      'False',
      name: 'false_',
      desc: '',
      args: [],
    );
  }

  /// `Cronengber`
  String get Cronengber {
    return Intl.message(
      'Cronengber',
      name: 'Cronengber',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `floor`
  String get floor {
    return Intl.message(
      'floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `race`
  String get race {
    return Intl.message(
      'race',
      name: 'race',
      desc: '',
      args: [],
    );
  }

  /// `Place of birth`
  String get place_of_birth {
    return Intl.message(
      'Place of birth',
      name: 'place_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Filter by status`
  String get filter_by_status {
    return Intl.message(
      'Filter by status',
      name: 'filter_by_status',
      desc: '',
      args: [],
    );
  }

  /// `Show everyone`
  String get show_everyone {
    return Intl.message(
      'Show everyone',
      name: 'show_everyone',
      desc: '',
      args: [],
    );
  }

  /// `Show only living people`
  String get show_only_living_people {
    return Intl.message(
      'Show only living people',
      name: 'show_only_living_people',
      desc: '',
      args: [],
    );
  }

  /// `Show only dead ones`
  String get show_only_dead_ones {
    return Intl.message(
      'Show only dead ones',
      name: 'show_only_dead_ones',
      desc: '',
      args: [],
    );
  }

  /// `Richard 'Rick' Sanchez is the main protagonist of the animated series Rick and Morty. A mad scientist whose alcoholism, recklessness and sociopathy leave his daughter's family worried.`
  String get bio_rick {
    return Intl.message(
      'Richard \'Rick\' Sanchez is the main protagonist of the animated series Rick and Morty. A mad scientist whose alcoholism, recklessness and sociopathy leave his daughter\'s family worried.',
      name: 'bio_rick',
      desc: '',
      args: [],
    );
  }

  /// `No gender`
  String get no_gender {
    return Intl.message(
      'No gender',
      name: 'no_gender',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Change photo`
  String get change_photo {
    return Intl.message(
      'Change photo',
      name: 'change_photo',
      desc: '',
      args: [],
    );
  }

  /// `PROFILE`
  String get profile {
    return Intl.message(
      'PROFILE',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Change full name`
  String get change_full_name {
    return Intl.message(
      'Change full name',
      name: 'change_full_name',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get about_me {
    return Intl.message(
      'About me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Esentur`
  String get name {
    return Intl.message(
      'Esentur',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Childebekov`
  String get surname {
    return Intl.message(
      'Childebekov',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Childebekovich`
  String get patronymic {
    return Intl.message(
      'Childebekovich',
      name: 'patronymic',
      desc: '',
      args: [],
    );
  }

  /// `Hello World`
  String get selfInfo {
    return Intl.message(
      'Hello World',
      name: 'selfInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
