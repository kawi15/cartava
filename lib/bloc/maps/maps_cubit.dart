import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/map_service.dart';
import 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapService mapService;

  MapsCubit({required this.mapService})
      : super(const MapsState(allPolylines: {}, visiblePolylines: {}, selectedPolylineId: null));

  void setPolylines(Set<Polyline> polylines) {
    emit(state.copyWith(allPolylines: polylines, visiblePolylines: polylines));
  }

  Future<void> updateVisiblePolylines(LatLngBounds bounds) async {
    final updatedPolylines = <Polyline>{};
    final stopwatch = Stopwatch()..start();

    for (final singlePolyline in state.allPolylines) {
      if (MapService.polylineIntersectsBounds(singlePolyline.points, bounds)) {
        final isSelected = singlePolyline.polylineId.value == state.selectedPolylineId;

        updatedPolylines.add(
          Polyline(
              polylineId: PolylineId(singlePolyline.polylineId.value),
              consumeTapEvents: true,
              color: isSelected ? Colors.black : Colors.red,
              width: 1,
              points: singlePolyline.points,
              onTap: () => onPolylineTapped(singlePolyline.polylineId.value)
          ),
        );
      }
    }

    print('count ${state.visiblePolylines.length}');
    print('updatedCount ${updatedPolylines.length}');
    stopwatch.stop();
    print('updateVisiblePolylines took: ${stopwatch.elapsedMilliseconds}ms');

    emit(state.copyWith(visiblePolylines: updatedPolylines, selectedPolylineId: state.selectedPolylineId));
  }

  void clearSelection() {
    final updatedPolylines = state.visiblePolylines.map((polyline) {
      return polyline.copyWith(colorParam: Colors.red);
    });

    emit(state.copyWith(visiblePolylines: updatedPolylines.toSet(), selectedPolylineId: null));
  }

  void onPolylineTapped(String id) {
    //TODO get information about this activity
    final allVisiblePolylines = state.visiblePolylines.toList();
    final selected = allVisiblePolylines.firstWhere((p) => p.polylineId.value == id);
    final others = allVisiblePolylines.where((p) => p.polylineId.value != id).toList();

    final reordered = [
      ...others.map((polyline) => polyline.copyWith(colorParam: Colors.red)),
      selected.copyWith(colorParam: Colors.black),
    ];

    emit(state.copyWith(visiblePolylines: reordered.toSet(), selectedPolylineId: id));
  }
}