import 'package:flutter/material.dart';

const yellow = Color(0xFF676000);
const orange = Color(0xFF9C441F);
const red = Color(0xFF9C3E5B);
const blue = Color(0xFF00639A);
const purple = Color(0xFF6250AA);
const pink = Color(0xFF944077);

CustomColors lightCustomColors = const CustomColors(
  sourceYellow: Color(0xFF676000),
  yellow: Color(0xFF676000),
  onYellow: Color(0xFFFFFFFF),
  yellowContainer: Color(0xFFFFF9BC),
  onYellowContainer: Color(0xFF1F1C00),
  sourceOrange: Color(0xFF9C441F),
  orange: Color(0xFF9C441F),
  onOrange: Color(0xFFFFFFFF),
  orangeContainer: Color(0xFFFFDBCE),
  onOrangeContainer: Color(0xFF380D00),
  sourceRed: Color(0xFF9C3E5B),
  red: Color(0xFF9C3E5B),
  onRed: Color(0xFFFFFFFF),
  redContainer: Color(0xFFFFD9E0),
  onRedContainer: Color(0xFF3F0019),
  sourceBlue: Color(0xFF00639A),
  blue: Color(0xFF00639A),
  onBlue: Color(0xFFFFFFFF),
  blueContainer: Color(0xFFCEE5FF),
  onBlueContainer: Color(0xFF001D32),
  sourcePurple: Color(0xFF6250AA),
  purple: Color(0xFF6250AA),
  onPurple: Color(0xFFFFFFFF),
  purpleContainer: Color(0xFFE7DEFF),
  onPurpleContainer: Color(0xFF1E0061),
  sourcePink: Color(0xFF944077),
  pink: Color(0xFF944077),
  onPink: Color(0xFFFFFFFF),
  pinkContainer: Color(0xFFFFD8EB),
  onPinkContainer: Color(0xFF3B002C),
);

CustomColors darkCustomColors = const CustomColors(
  sourceYellow: Color(0xFF676000),
  yellow: Color(0xFFD4CA51),
  onYellow: Color(0xFF353100),
  yellowContainer: Color(0xFF4D4800),
  onYellowContainer: Color(0xFFF1E66A),
  sourceOrange: Color(0xFF9C441F),
  orange: Color(0xFFFFB59A),
  onOrange: Color(0xFF5A1B00),
  orangeContainer: Color(0xFF7D2D08),
  onOrangeContainer: Color(0xFFFFDBCE),
  sourceRed: Color(0xFF9C3E5B),
  red: Color(0xFFFFB1C3),
  onRed: Color(0xFF600E2D),
  redContainer: Color(0xFF7E2644),
  onRedContainer: Color(0xFFFFD9E0),
  sourceBlue: Color(0xFF00639A),
  blue: Color(0xFF96CCFF),
  onBlue: Color(0xFF003353),
  blueContainer: Color(0xFF004A75),
  onBlueContainer: Color(0xFFCEE5FF),
  sourcePurple: Color(0xFF6250AA),
  purple: Color(0xFFCBBEFF),
  onPurple: Color(0xFF331E79),
  purpleContainer: Color(0xFF4A3790),
  onPurpleContainer: Color(0xFFE7DEFF),
  sourcePink: Color(0xFF944077),
  pink: Color(0xFFFFAEDD),
  onPink: Color(0xFF5B0E46),
  pinkContainer: Color(0xFF77285E),
  onPinkContainer: Color(0xFFFFD8EB),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceYellow,
    required this.yellow,
    required this.onYellow,
    required this.yellowContainer,
    required this.onYellowContainer,
    required this.sourceOrange,
    required this.orange,
    required this.onOrange,
    required this.orangeContainer,
    required this.onOrangeContainer,
    required this.sourceRed,
    required this.red,
    required this.onRed,
    required this.redContainer,
    required this.onRedContainer,
    required this.sourceBlue,
    required this.blue,
    required this.onBlue,
    required this.blueContainer,
    required this.onBlueContainer,
    required this.sourcePurple,
    required this.purple,
    required this.onPurple,
    required this.purpleContainer,
    required this.onPurpleContainer,
    required this.sourcePink,
    required this.pink,
    required this.onPink,
    required this.pinkContainer,
    required this.onPinkContainer,
  });

  final Color? sourceYellow;
  final Color? yellow;
  final Color? onYellow;
  final Color? yellowContainer;
  final Color? onYellowContainer;
  final Color? sourceOrange;
  final Color? orange;
  final Color? onOrange;
  final Color? orangeContainer;
  final Color? onOrangeContainer;
  final Color? sourceRed;
  final Color? red;
  final Color? onRed;
  final Color? redContainer;
  final Color? onRedContainer;
  final Color? sourceBlue;
  final Color? blue;
  final Color? onBlue;
  final Color? blueContainer;
  final Color? onBlueContainer;
  final Color? sourcePurple;
  final Color? purple;
  final Color? onPurple;
  final Color? purpleContainer;
  final Color? onPurpleContainer;
  final Color? sourcePink;
  final Color? pink;
  final Color? onPink;
  final Color? pinkContainer;
  final Color? onPinkContainer;

  @override
  CustomColors copyWith({
    Color? sourceYellow,
    Color? yellow,
    Color? onYellow,
    Color? yellowContainer,
    Color? onYellowContainer,
    Color? sourceOrange,
    Color? orange,
    Color? onOrange,
    Color? orangeContainer,
    Color? onOrangeContainer,
    Color? sourceRed,
    Color? red,
    Color? onRed,
    Color? redContainer,
    Color? onRedContainer,
    Color? sourceBlue,
    Color? blue,
    Color? onBlue,
    Color? blueContainer,
    Color? onBlueContainer,
    Color? sourcePurple,
    Color? purple,
    Color? onPurple,
    Color? purpleContainer,
    Color? onPurpleContainer,
    Color? sourcePink,
    Color? pink,
    Color? onPink,
    Color? pinkContainer,
    Color? onPinkContainer,
  }) {
    return CustomColors(
      sourceYellow: sourceYellow ?? this.sourceYellow,
      yellow: yellow ?? this.yellow,
      onYellow: onYellow ?? this.onYellow,
      yellowContainer: yellowContainer ?? this.yellowContainer,
      onYellowContainer: onYellowContainer ?? this.onYellowContainer,
      sourceOrange: sourceOrange ?? this.sourceOrange,
      orange: orange ?? this.orange,
      onOrange: onOrange ?? this.onOrange,
      orangeContainer: orangeContainer ?? this.orangeContainer,
      onOrangeContainer: onOrangeContainer ?? this.onOrangeContainer,
      sourceRed: sourceRed ?? this.sourceRed,
      red: red ?? this.red,
      onRed: onRed ?? this.onRed,
      redContainer: redContainer ?? this.redContainer,
      onRedContainer: onRedContainer ?? this.onRedContainer,
      sourceBlue: sourceBlue ?? this.sourceBlue,
      blue: blue ?? this.blue,
      onBlue: onBlue ?? this.onBlue,
      blueContainer: blueContainer ?? this.blueContainer,
      onBlueContainer: onBlueContainer ?? this.onBlueContainer,
      sourcePurple: sourcePurple ?? this.sourcePurple,
      purple: purple ?? this.purple,
      onPurple: onPurple ?? this.onPurple,
      purpleContainer: purpleContainer ?? this.purpleContainer,
      onPurpleContainer: onPurpleContainer ?? this.onPurpleContainer,
      sourcePink: sourcePink ?? this.sourcePink,
      pink: pink ?? this.pink,
      onPink: onPink ?? this.onPink,
      pinkContainer: pinkContainer ?? this.pinkContainer,
      onPinkContainer: onPinkContainer ?? this.onPinkContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceYellow: Color.lerp(sourceYellow, other.sourceYellow, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      onYellow: Color.lerp(onYellow, other.onYellow, t),
      yellowContainer: Color.lerp(yellowContainer, other.yellowContainer, t),
      onYellowContainer: Color.lerp(onYellowContainer, other.onYellowContainer, t),
      sourceOrange: Color.lerp(sourceOrange, other.sourceOrange, t),
      orange: Color.lerp(orange, other.orange, t),
      onOrange: Color.lerp(onOrange, other.onOrange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
      onOrangeContainer: Color.lerp(onOrangeContainer, other.onOrangeContainer, t),
      sourceRed: Color.lerp(sourceRed, other.sourceRed, t),
      red: Color.lerp(red, other.red, t),
      onRed: Color.lerp(onRed, other.onRed, t),
      redContainer: Color.lerp(redContainer, other.redContainer, t),
      onRedContainer: Color.lerp(onRedContainer, other.onRedContainer, t),
      sourceBlue: Color.lerp(sourceBlue, other.sourceBlue, t),
      blue: Color.lerp(blue, other.blue, t),
      onBlue: Color.lerp(onBlue, other.onBlue, t),
      blueContainer: Color.lerp(blueContainer, other.blueContainer, t),
      onBlueContainer: Color.lerp(onBlueContainer, other.onBlueContainer, t),
      sourcePurple: Color.lerp(sourcePurple, other.sourcePurple, t),
      purple: Color.lerp(purple, other.purple, t),
      onPurple: Color.lerp(onPurple, other.onPurple, t),
      purpleContainer: Color.lerp(purpleContainer, other.purpleContainer, t),
      onPurpleContainer: Color.lerp(onPurpleContainer, other.onPurpleContainer, t),
      sourcePink: Color.lerp(sourcePink, other.sourcePink, t),
      pink: Color.lerp(pink, other.pink, t),
      onPink: Color.lerp(onPink, other.onPink, t),
      pinkContainer: Color.lerp(pinkContainer, other.pinkContainer, t),
      onPinkContainer: Color.lerp(onPinkContainer, other.onPinkContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
