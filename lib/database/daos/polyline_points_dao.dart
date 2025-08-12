
import 'package:cartava/database/database.dart';
import 'package:cartava/database/tables/polyline_points.dart';
import 'package:drift/drift.dart';

part 'polyline_points_dao.g.dart';

@DriftAccessor(tables: [PolylinePoints])
class PolylinePointsDao extends DatabaseAccessor<AppDatabase> with _$PolylinePointsDaoMixin {
  PolylinePointsDao(super.db);
}