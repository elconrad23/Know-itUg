// Project imports:


import '../../knowit_exporter.dart';

/// THis is a dot in a bullet=like format
class KnowItDot extends StatelessWidget {
  const KnowItDot({
    Key? key,
    this.dotColor = knowItColor,
    this.dotDiameter = 10,
    this.margin = padding4,
  }) : super(key: key);

  // color of the dot
  final Color? dotColor;

  // diameter of the dot
  final double? dotDiameter;

  // margin of the dot
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dotDiameter,
      height: dotDiameter,
      margin: margin,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
