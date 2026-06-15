import 'package:flutter/material.dart';

class StepCheckbox extends StatefulWidget {
  final bool isRunned;
  const StepCheckbox({super.key, required this.isRunned});

  @override
  State<StepCheckbox> createState() => _StepCheckboxState();
}

class _StepCheckboxState extends State<StepCheckbox>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant StepCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isRunned && !widget.isRunned) {
      setState(() {
        _isChecked = false;
      });
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });

    if (_isChecked) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Widget _buildIcon(IconData icon, Color color) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 1.5).animate(_controller),
      child: Icon(
        icon,
        size: 32,
        color: widget.isRunned ? color : color.withValues(alpha: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedColor = colorScheme.onPrimaryFixed;

    return GestureDetector(
      onTap: () => _toggleCheckbox(!_isChecked),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: _buildIcon(
          Icons.check_box_outline_blank,
          colorScheme.onSecondary,
        ),
        secondChild: _buildIcon(Icons.check_box, selectedColor),
        crossFadeState:
            _isChecked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        layoutBuilder: (topChild, topKey, bottomChild, bottomKey) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(key: bottomKey, child: bottomChild),
              Positioned(key: topKey, child: topChild),
            ],
          );
        },
      ),
    );
  }
}
