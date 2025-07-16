

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState {
  final Set<Polyline> allPolylines;
  final Set<Polyline> visiblePolylines;
  final String? selectedPolylineId;

  const MapsState({
    required this.allPolylines,
    required this.visiblePolylines,
    this.selectedPolylineId,
  });

  MapsState copyWith({
    Set<Polyline>? allPolylines,
    Set<Polyline>? visiblePolylines,
    String? selectedPolylineId,
  }) {
    return MapsState(
      allPolylines: allPolylines ?? this.allPolylines,
      visiblePolylines: visiblePolylines ?? this.visiblePolylines,
      selectedPolylineId: selectedPolylineId,
    );
  }
}