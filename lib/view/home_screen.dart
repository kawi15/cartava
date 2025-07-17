import 'dart:async';

import 'package:cartava/bloc/maps/maps_cubit.dart';
import 'package:cartava/bloc/maps/maps_state.dart';
import 'package:cartava/bloc/strava/strava_bloc.dart';
import 'package:cartava/bloc/strava/strava_event.dart';
import 'package:cartava/services/map_service.dart';
import 'package:cartava/widgets/single_activity_info.dart';
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
            polylineId: PolylineId(activity.id.toString()),
            consumeTapEvents: true,
            color: Colors.red,
            width: 1,
            points: points,
            onTap: () => context.read<MapsCubit>().onPolylineTapped(activity.id.toString())
          ),
        );
      }
    }

    context.read<MapsCubit>().setPolylines(polylines);
  }

  void _onCameraIdle() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(debounceDuration, () async {
      final bounds = await _controller.future.then((c) => c.getVisibleRegion());

      if (mounted) {
        context.read<MapsCubit>().updateVisiblePolylines(bounds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StravaBloc, StravaState>(
      builder: (context, state) {
        if (state is StravaAuthenticated && !state.isLoading) {
          loadPolylinesFromState(state);

          return Scaffold(
            body: BlocBuilder<MapsCubit, MapsState>(builder: (context, mapsState) {
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (controller) => _controller.complete(controller),
                    onCameraIdle: _onCameraIdle,
                    polylines: mapsState.visiblePolylines,
                  ),
                  if (mapsState.selectedPolylineId != null)
                    SingleActivityInfo(
                      polylineId: mapsState.selectedPolylineId!,
                      onClose: context.read<MapsCubit>().clearSelection,
                    ),
                ],
              );
            }),
            drawer: Drawer(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: state.activities.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text('${state.activities[index].name}'),
                      subtitle: Text('${(state.activities[index].distance! / 1000).toStringAsFixed(2)} km'),
                    );
                }),
              ),
            ),
          );
        } else if (state is StravaAuthenticated && state.isLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        } else {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<StravaBloc>().add(StravaAuthenticationRequested());
                    },
                    child: const Text('login')
                ),
              ),
            );
        }
      }
    );
  }
}
