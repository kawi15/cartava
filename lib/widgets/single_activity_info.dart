

import 'package:cartava/bloc/strava/strava_bloc.dart';
import 'package:cartava/bloc/strava/strava_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:strava_client/strava_client.dart';

class SingleActivityInfo extends StatefulWidget {
  final String polylineId;
  final VoidCallback onClose;

  const SingleActivityInfo({
    super.key,
    required this.polylineId,
    required this.onClose,
  });

  @override
  State<SingleActivityInfo> createState() => _SingleActivityInfoState();
}

class _SingleActivityInfoState extends State<SingleActivityInfo> {
  bool _isVisible = true;
  late final SummaryActivity activity;

  void _closeSheet() {
    setState(() {
      _isVisible = false;
    });
    widget.onClose();
  }


  @override
  void initState() {
    super.initState();
    final state = context.read<StravaBloc>().state as StravaAuthenticated;
    activity = state.activities.firstWhere((element) => element.id.toString() == widget.polylineId);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      minChildSize: 0.1,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'Name: ${activity.name}'
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Distance: ${activity.distance! / 1000} km'
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Date: ${DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(activity.startDateLocal!))}'
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _closeSheet,
                      child: const Text('Zamknij'),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
