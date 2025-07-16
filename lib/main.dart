import 'package:cartava/bloc/maps/maps_cubit.dart';
import 'package:cartava/bloc/strava/strava_bloc.dart';
import 'package:cartava/repository/strava_repository.dart';
import 'package:cartava/services/map_service.dart';
import 'package:cartava/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strava_client/strava_client.dart';

import '../secret.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StravaRepository stravaRepository;
  late final StravaClient stravaClient;
  late final MapService mapService;

  @override
  void initState() {
    super.initState();
    stravaClient = StravaClient(secret: secret, clientId: clientId);
    stravaRepository = StravaRepository(stravaClient: stravaClient);
    mapService = MapService();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => StravaBloc(stravaRepository: stravaRepository)),
        BlocProvider(create: (_) => MapsCubit(mapService: mapService))
      ],
      child: MaterialApp(
        title: 'Cartava',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
