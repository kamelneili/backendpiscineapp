import 'package:equatable/equatable.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';

abstract class ActualiteState extends Equatable {
  const ActualiteState();

  @override
  List<Object> get props => [];
}

class ActualiteLoading extends ActualiteState {}

class ActualiteLoaded extends ActualiteState {
  final List<Actualite> actualites;

  const ActualiteLoaded({this.actualites = const <Actualite>[]});

  @override
  List<Object> get props => [actualites];
}

class ActualiteAdded extends ActualiteState {}

class ActualiteDeleted extends ActualiteState {}
