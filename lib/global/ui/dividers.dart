// Project imports:

import '../../knowit_exporter.dart';

///this is a horizontal divider
class ThickHorizontalDivider extends StatelessWidget {
  const ThickHorizontalDivider({
    Key? key,
    this.dividerColor = knowItColor,
    this.thickness = 6.0,
    this.dividerWidth = 60,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  }) : super(key: key);

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerWidth;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: thickness,
      width: dividerWidth,
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.circular(thickness / 2),
      ),
    );
  }
}

///this is a horizontal divider
class SliverThickHorizontalDivider extends StatelessWidget {
  const SliverThickHorizontalDivider({
    Key? key,
    this.dividerColor = knowItColor,
    this.thickness = 6.0,
    this.dividerWidth = 60,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  }) : super(key: key);

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerWidth;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ThickHorizontalDivider(
        margin: margin,
        thickness: thickness,
        dividerWidth: dividerWidth,
        dividerColor: dividerColor,
      ),
    );
  }
}

///this is a vertical divider
class ThickVerticalDivider extends StatelessWidget {
  const ThickVerticalDivider({
    Key? key,
    this.dividerColor = knowItColor,
    this.thickness = 6.0,
    this.dividerHeight = 150,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  }) : super(key: key);

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerHeight;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: dividerHeight,
      width: thickness,
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.circular(thickness / 2),
      ),
    );
  }
}

class SliverThickVerticalDivider extends StatelessWidget {
  const SliverThickVerticalDivider({
    Key? key,
    this.dividerColor = knowItColor,
    this.thickness = 6.0,
    this.dividerHeight = 150,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  }) : super(key: key);

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerHeight;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ThickVerticalDivider(
        margin: margin,
        dividerHeight: dividerHeight,
        thickness: thickness,
        dividerColor: dividerColor,
      ),
    );
  }
}
