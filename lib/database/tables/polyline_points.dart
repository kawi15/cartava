import 'package:cartava/database/tables/polylines.dart';
import 'package:drift/drift.dart';

class PolylinePoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get polylineId => integer().references(Polylines, #id)();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
}