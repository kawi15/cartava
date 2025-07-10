

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  //TODO przerzucić tu funkcje z home screen

  /// Function that decodes Polylines to List of [LatLng]
  static List<LatLng> decodePolyline(String encoded) {
    final polylinePoints = PolylinePoints();
    final points = polylinePoints.decodePolyline(encoded);
    return points.map((p) => LatLng(p.latitude, p.longitude)).toList();
  }

  /// Function that checks if [points] are visible on given [bounds]
  static bool polylineIntersectsBounds(List<LatLng> points, LatLngBounds bounds) {
    return points.any((point) =>
    point.latitude >= bounds.southwest.latitude &&
        point.latitude <= bounds.northeast.latitude &&
        point.longitude >= bounds.southwest.longitude &&
        point.longitude <= bounds.northeast.longitude);
  }
}