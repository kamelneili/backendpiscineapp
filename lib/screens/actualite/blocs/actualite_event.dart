import 'package:equatable/equatable.dart';
import 'package:eshopbackend/screens/actualite/models/actualite_model.dart';

abstract class ActualiteEvent extends Equatable {
  const ActualiteEvent();

  @override
  List<Object> get props => [];
}

class LoadActualite extends ActualiteEvent {
  final List<Actualite> actualites;

  const LoadActualite({
    this.actualites = const <Actualite>[],
  });
}

class AddActualite extends ActualiteEvent {
  final Actualite actualite;

  const AddActualite(this.actualite);

  @override
  List<Object> get props => [actualite];
}

class DeleteActualite extends ActualiteEvent {
  final Actualite actualite;

  const DeleteActualite(this.actualite);

  @override
  List<Object> get props => [actualite];
}
  



//


