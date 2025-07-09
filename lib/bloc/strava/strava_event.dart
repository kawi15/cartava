

abstract class StravaEvent {

}

class AppStarted extends StravaEvent {}

class StravaAuthenticationRequested extends StravaEvent {}

class StravaActivitiesRefreshed extends StravaEvent {}