
import 'package:cartava/database/database.dart';
import 'package:cartava/database/tables/polylines.dart';
import 'package:drift/drift.dart';

part 'polylines_dao.g.dart';

@DriftAccessor(tables: [Polylines])
class PolylineDao extends DatabaseAccessor<AppDatabase> with _$PolylineDaoMixin {
  PolylineDao(super.db);
}