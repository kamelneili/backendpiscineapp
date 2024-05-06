import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_event.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_state.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';
import 'package:eshopbackend/screens/actualite/repositories/actualite_repository.dart';

class ActualiteBloc extends Bloc<ActualiteEvent, ActualiteState> {
  final ActualiteRepository _actualiteRepository;
  ActualiteBloc({
    required ActualiteRepository actualiteRepository,
  })  : _actualiteRepository = actualiteRepository,
        super(ActualiteLoading()) {
    on<LoadActualite>(_onLoadActualite);
    on<AddActualite>(_onAddActualite);
    on<DeleteActualite>(_onDeleteActualite);
  }
  //
  Future<void> _onLoadActualite(
    LoadActualite event,
    Emitter<ActualiteState> emit,
  ) async {
    // emit(AppointmentLoading());

    //Appointment appointment = new Appointment();
    try {
      final List<Actualite> actualites =
          await _actualiteRepository.getAllActualites().first;

      print('srv:');
      print(actualites);

      emit(ActualiteLoaded(actualites: actualites));
    } catch (_) {}
  }

  //add act
  Future<void> _onAddActualite(
    AddActualite event,
    Emitter<ActualiteState> emit,
  ) async {
    // emit(AppointmentLoading());

    //Appointment appointment = new Appointment();
    try {
      await _actualiteRepository.addActualite(event.actualite);

      print('added:');

      emit(ActualiteAdded());
    } catch (_) {}
  }

  //delete act
  Future<void> _onDeleteActualite(
    DeleteActualite event,
    Emitter<ActualiteState> emit,
  ) async {
    try {
      await _actualiteRepository.deleteUser(event.actualite);

      print('added:');

      final List<Actualite> actualites =
          await _actualiteRepository.getAllActualites().first;

      print('srv:');
      print(actualites);

      emit(ActualiteLoaded(actualites: actualites));
    } catch (_) {}
  }
}
