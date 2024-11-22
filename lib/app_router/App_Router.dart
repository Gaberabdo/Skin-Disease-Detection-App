import 'package:flutter/material.dart';
import 'package:skin_disease_detection/Maps_Cubit/cubit.dart';
import 'package:skin_disease_detection/home.dart';
import 'package:skin_disease_detection/repository/maps_repo.dart';
import 'package:skin_disease_detection/web_services/Places_WebServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/Map_screen/map_screen.dart';
import '../shared/constants/constants.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (BuildContext context) =>
                    MapsCubit(MapsRepository(PlacesWebservices())),
                child: MapScreen(),
              ),
        );
    }
  }
}