import 'package:flutter/material.dart';

import 'render_slider_controller.dart';
import 'slider_decoration.dart';

///
/// Class to Control the Custom Slider Widget.
///
class SliderController extends LeafRenderObjectWidget {
  const SliderController({
    Key? key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.sliderDecoration,
  })  : assert(
          value >= min && value <= max,
          'value should be between the min or 0.0 to max or 100.0',
        ),
        assert(
          min < max,
          'value of the min should be smaller than the max',
        ),
        super(key: key);

  /// Indicates the default slider thumb value
  /// Value is between the min or 0.0 to max or 100.0
  final double value;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  final ValueChanged<double> onChanged;

  /// Indicates the Minimum value for the slider
  /// If min is null then the default value 0.0 is used
  final double min;

  /// Indicates the Maximum value for the slider
  /// If max is null then the default value 100.0 is used
  final double max;

  /// Used to Decorate the Slider Widget
  /// If decoration is null then the default value of the slider decoration is used
  final SliderDecoration? sliderDecoration;

  @override
  RenderObject createRenderObject(BuildContext context) {
    /// Create and return the render object
    return RenderSliderController(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      sliderDecoration: sliderDecoration ?? SliderDecoration(),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderSliderController renderObject,
  ) {
    /// Update the render object
    renderObject
      ..value = value
      ..onChanged = onChanged
      ..min = min
      ..max = max
      ..sliderDecoration = sliderDecoration ?? SliderDecoration();
  }
}
