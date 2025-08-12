import 'package:cartava/database/tables/polylines.dart';
import 'package:drift/drift.dart';

class StravaActivities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  RealColumn get distance => real()();
  DateTimeColumn get date => dateTime().named('start_date')();
  BoolColumn get isVisible => boolean().withDefault(const Constant(false))();
  IntColumn get polylineId => integer().references(Polylines, #id)();
}