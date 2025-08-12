

import 'dart:io';

import 'package:cartava/database/tables/polyline_points.dart';
import 'package:cartava/database/tables/polylines.dart';
import 'package:cartava/database/tables/strava_activities.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';


part 'database.g.dart';

@DriftDatabase(tables: [StravaActivities, Polylines, PolylinePoints])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());


  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}