import 'package:skin_disease_detection/model/place.dart';
import 'package:skin_disease_detection/model/place_direction.dart';
import 'package:skin_disease_detection/model/place_suggestion.dart';


abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
 final List<PlaceSuggestion> places;

 PlacesLoaded(this.places);

}

class PlaceLocationLoaded extends MapsState {
 final Place place;

 PlaceLocationLoaded(this.place);

}


class DirectionsLoaded extends MapsState {
 final PlaceDirections placeDirections;

 DirectionsLoaded(this.placeDirections);

}