
import 'package:cartava/services/secure_storage.dart';
import 'package:strava_client/strava_client.dart';

class StravaRepository {
  final StravaClient stravaClient;

  StravaRepository({required this.stravaClient});


  Future<TokenResponse?> connectToStrava() async {
    try {
      final token = await stravaClient.authentication.authenticate(
          scopes: [
            AuthenticationScope.profile_read_all,
            AuthenticationScope.read_all,
            AuthenticationScope.activity_read_all
          ],
          redirectUrl: "cartava://localhost",
          callbackUrlScheme: "cartava"
      ).catchError((e, stack) {
        print('caught fault ${e.errors} ${e.message}');
        print('stack fault $stack');
      });

      await SecureStorage.write('token', token.accessToken);
      print("Auth token: ${token.accessToken}");
      return token;
    } on Fault catch(e, stack){
      print('caught fault ${e.errors} ${e.message}');
      print('stack fault $stack');
    }
    return null;
  }

  Future<List<SummaryActivity>> getAllActivities() async {
    try {
      int page = 1;
      bool hasMore = true;
      List<SummaryActivity> allActivities = [];

      while (hasMore) {
        final pageActivities = await stravaClient.activities.listLoggedInAthleteActivities(DateTime.now(), DateTime(2010, 1, 4), page, 200);
        if (pageActivities.isEmpty) {
          hasMore = false;
        } else {
          final rideActivities = pageActivities.where((element) => element.type == 'Ride');
          allActivities.addAll(rideActivities);
          page++;
        }
      }

      return allActivities;
    } on Fault catch(e, stack){
      print('caught fault ${e.errors} ${e.message}');
      print('stack fault $stack');
    }
    return [];
  }
}






