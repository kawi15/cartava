import 'package:cartava/bloc/strava/strava_event.dart';
import 'package:cartava/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/strava/strava_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    context.read<StravaBloc>().add(AppStarted());
    Future.delayed(const Duration(seconds: 2)).then((_) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.directions_bike, color: Colors.deepOrangeAccent),
      ),
    );
  }
}
