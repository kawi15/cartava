

import 'package:cartava/bloc/strava/strava_event.dart';
import 'package:cartava/bloc/strava/strava_state.dart';
import 'package:cartava/repository/strava_repository.dart';
import 'package:cartava/services/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strava_client/strava_client.dart';

class StravaBloc extends Bloc<StravaEvent, StravaState> {

  final StravaRepository stravaRepository;


  StravaBloc({required this.stravaRepository}) : super(StravaInitial()) {
    on<AppStarted>((event, emit) async {
      final token = await SecureStorage.read('token');
      print('app started token $token');
      if (token != null) {
        emit(StravaAuthenticated(const [], isLoading: true));
        List<SummaryActivity> activities = await stravaRepository.getAllActivities();
        emit(StravaAuthenticated(activities));
      }
      // TODO trzebaby zrobić jakieś cachowanie aktywności ze stravy, żeby przy każdym uruchomieniu ich nie pobierać
    });



    on<StravaAuthenticationRequested>((event, emit) async {
      final TokenResponse? token = await stravaRepository.connectToStrava();
      print('token $token');
      if (token != null) {
        emit(StravaAuthenticated(const [], isLoading: true));
        List<SummaryActivity> activities = await stravaRepository.getAllActivities();
        emit(StravaAuthenticated(activities));
      } else {
        // logowanie nie powiodło się
      }
    });
  }



}