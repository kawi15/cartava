

import 'package:flutter/material.dart';

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

  void _closeSheet() {
    setState(() {
      _isVisible = false;
    });
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.4,
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Polyline id: ${widget.polylineId}',
                      textAlign: TextAlign.center,
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
