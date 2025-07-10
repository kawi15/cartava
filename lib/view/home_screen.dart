import 'dart:async';

import 'package:cartava/bloc/strava/strava_bloc.dart';
import 'package:cartava/bloc/strava/strava_event.dart';
import 'package:cartava/services/map_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/strava/strava_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // TODO zastanowić się nad simplify polylines by zredukować ścinanie przy zoomie

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late CameraPosition _initialCameraPosition;
  final Set<Polyline> polylines = {};
  final ValueNotifier<Set<Polyline>> visiblePolylines = ValueNotifier({});
  Timer? _debounceTimer;
  String? selectedPolylineId;

  static const debounceDuration = Duration(milliseconds: 400);

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = const CameraPosition(
      target: LatLng(52.0, 19.0),
      zoom: 5.5,
    );
  }

  // TODO zrobić Bloc/Cubit dla zarządzania stanem mapy
  // TODO uporządkować polylines

  void loadPolylinesFromState(StravaAuthenticated state) {
    for (final activity in state.activities) {
      final encoded = activity.map?.summaryPolyline;
      if (encoded != null && encoded.isNotEmpty) {
        final points = MapService.decodePolyline(encoded);

        if (_initialCameraPosition.target.latitude == 52.0 &&
            points.isNotEmpty) {
          _initialCameraPosition = CameraPosition(
            target: points.first,
            zoom: 6.5,
          );
        }

        polylines.add(
          Polyline(
            polylineId: PolylineId(points.hashCode.toString()),
            consumeTapEvents: true,
            color: Colors.red,
            width: 1,
            points: points,
            onTap: () {
              _onPolylineTapped(points.hashCode.toString());
            }
          ),
        );
      }
    }

    visiblePolylines.value = polylines;
  }

  void _onPolylineTapped(String id) {
    if (selectedPolylineId == id) {
      selectedPolylineId = null;
    } else {
      selectedPolylineId = id;
    }

    visiblePolylines.value = visiblePolylines.value.map((polyline) {
      final isSelected = polyline.polylineId.value == selectedPolylineId;
      return polyline.copyWith(
        colorParam: isSelected ? Colors.black : Colors.red
      );
    }).toSet();
  }

  Future<void> updateVisiblePolylines(LatLngBounds bounds) async {
    final updatedPolylines = <Polyline>{};
    final stopwatch = Stopwatch()..start();

    for (final singlePolyline in polylines) {
      if (MapService.polylineIntersectsBounds(singlePolyline.points, bounds)) {
        final isSelected = singlePolyline.polylineId.value == selectedPolylineId;

        updatedPolylines.add(
          Polyline(
            polylineId: PolylineId(singlePolyline.points.hashCode.toString()),
            consumeTapEvents: true,
            color: isSelected ? Colors.black : Colors.red,
            width: 1,
            points: singlePolyline.points,
            onTap: () {
              _onPolylineTapped(singlePolyline.points.hashCode.toString());
            }
          ),
        );
      }
    }

    print('count ${polylines.length}');
    print('updatedCount ${updatedPolylines.length}');
    stopwatch.stop();
    print('updateVisiblePolylines took: ${stopwatch.elapsedMilliseconds}ms');

    visiblePolylines.value = updatedPolylines;
  }

  void _onCameraIdle() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(debounceDuration, () async {
      final bounds = await _controller.future.then((c) => c.getVisibleRegion());

      updateVisiblePolylines(bounds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StravaBloc, StravaState>(
        builder: (context, state) {
          if (state is StravaAuthenticated && !state.isLoading) {
            loadPolylinesFromState(state);

            return ValueListenableBuilder<Set<Polyline>>(
              valueListenable: visiblePolylines,
              builder: (context, polylines, _) {
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) => _controller.complete(controller),
                  onCameraIdle: _onCameraIdle,
                  polylines: polylines ?? {},
                );
              },
            );
          } else if (state is StravaAuthenticated && state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<StravaBloc>().add(StravaAuthenticationRequested());
                  },
                  child: const Text('login')
              ),
            );
          }
        }
      ),
    );
  }
}
