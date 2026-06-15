import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RiveCheckbox({super.key, required this.value, required this.onChanged});

  @override
  State<RiveCheckbox> createState() => _ButtonRiveWidgetState();
}

class _ButtonRiveWidgetState extends State<RiveCheckbox> {
  RiveWidgetController? _riveController;
  StateMachine? _stateMachine;
  late FileLoader loader;

  void _updateRiveValue(bool value) {
    if (_stateMachine != null) {
      _stateMachine!.boolean('checked')?.value = value;
    }
  }

  void _onLikePressed(RiveLoaded state) {
    widget.onChanged(!widget.value);
  }

  @override
  void initState() {
    super.initState();
    loader = FileLoader.fromAsset(
      'assets/animations/twitter_like.riv',
      riveFactory: Factory.rive,
    );
  }

  @override
  void didUpdateWidget(covariant RiveCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _updateRiveValue(widget.value);
    }
  }

  @override
  void dispose() {
    _riveController = null;
    _stateMachine = null;
    loader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: RiveWidgetBuilder(
        onLoaded: (load) {
          _riveController = load.controller;
          _stateMachine = _riveController?.stateMachine;
          _updateRiveValue(widget.value);
        },
        fileLoader: loader,
        builder: (context, state) => switch (state) {
          RiveLoading() => const Center(child: CircularProgressIndicator()),
          RiveFailed() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  const Text('Ошибка загрузки Button'),
                  Text('${state.error}', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          RiveLoaded() => GestureDetector(
              onTap: () => _onLikePressed(state),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: Stack(
                  children: [
                    RiveWidget(controller: state.controller, fit: Fit.contain),
                  ],
                ),
              ),
            ),
        },
      ),
    );
  }
}
