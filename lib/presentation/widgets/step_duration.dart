import 'package:flutter/widgets.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';

class StepDuration extends StatelessWidget {
  final RecipeStepLink stepLink;
  final Color color;

  const StepDuration({super.key, required this.stepLink, required this.color});

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: stepLink.step.duration);
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds.remainder(
      60,
    )).toString().padLeft(2, '0');

    return Text(
      "$minutes:$seconds",
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
