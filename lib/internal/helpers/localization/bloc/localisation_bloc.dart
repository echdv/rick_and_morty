import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

part 'localisation_event.dart';
part 'localisation_state.dart';

@singleton
class LocalisationBloc extends Bloc<LocalisationEvent, LocalisationState> {
  LocalisationBloc() : super(LocalisationInitial()) {
    on<ChangeLocaleEvent>((event, emit) async {
      emit(LocalisationLodingState());

      LocalizationHelper.setLocale(event.locale);

      String locale = await LocalizationHelper.getLocale();

      emit(LocalisationLodedState(locale: locale));

      try {} catch (e) {
        emit(LocalisationErrorState());
      }
    });
  }
}
