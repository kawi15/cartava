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

  // Debounce delay
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

  void loadPolylinesFromState(StravaAuthenticated state) {
    int i = 1;

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
            polylineId: PolylineId(i.toString()),
            color: Colors.red,
            width: 1,
            points: points,
          ),
        );
        i++;
      }
    }

    visiblePolylines.value = polylines;
  }

  Future<void> updateVisiblePolylines(LatLngBounds bounds) async {
    final updatedPolylines = <Polyline>{};
    final stopwatch = Stopwatch()..start();

    for (final singlePolyline in polylines) {
      if (MapService.polylineIntersectsBounds(singlePolyline.points, bounds)) {
        updatedPolylines.add(
          Polyline(
            polylineId: PolylineId(singlePolyline.points.hashCode.toString()),
            color: Colors.red,
            width: 1,
            points: singlePolyline.points,
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
    _debounceTimer?.cancel(); // Anuluj poprzedni timer

    _debounceTimer = Timer(debounceDuration, () async {
      final bounds = await _controller.future.then((c) => c.getVisibleRegion());

      // wywołaj metodę, która przefiltruje i zaktualizuje stan polylines
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
