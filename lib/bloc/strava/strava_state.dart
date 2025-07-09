

import 'package:equatable/equatable.dart';
import 'package:strava_client/strava_client.dart';

class StravaState extends Equatable {

  @override
  List<Object?> get props => throw UnimplementedError();
}

class StravaInitial extends StravaState {}

class StravaAuthenticated extends StravaState {
  final List<SummaryActivity> activities;
  final bool isLoading;

  StravaAuthenticated(this.activities, {this.isLoading = false});

  @override
  List<Object?> get props => [activities, isLoading];
}