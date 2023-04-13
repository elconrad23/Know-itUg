// Project imports:
import '../../knowit_exporter.dart';

///An animation wrapper around [OpenContainer]
class OpenRoute extends StatelessWidget {
  const OpenRoute({
    Key? key,
    required this.to,
    required this.closedBuilder,
    this.openColor = knowItColor,
    this.closedColor = knowItTransparent,
    required this.routePath,
    this.closedBorderRadius,
    this.closedShape,
  }) : super(key: key);

  final String routePath;
  final Color openColor, closedColor;

  ///The Widget we are navigating to
  final Widget to;

  // border radius for the closed container
  final BorderRadius? closedBorderRadius;

 final ShapeBorder? closedShape;

  final CloseContainerBuilder closedBuilder;
  @override
  Widget build(BuildContext context) {
    // TODO add ability to update url here
    //  i guess this can be done by adding the navigator method on the on tap of the open container, try it out and see
    //
    return OpenContainer(
      openBuilder: (context, _) => to,
      openColor: openColor,
      useRootNavigator: true,
      //*closed
      closedColor: closedColor,
      clipBehavior: Clip.antiAlias,
      closedElevation: 0,
      closedShape:closedShape?? RoundedRectangleBorder(
        borderRadius: closedBorderRadius ??
            const BorderRadius.all(Radius.circular(spacing8)),
      ),
      closedBuilder: closedBuilder,
      routeSettings: RouteSettings(name: routePath),
    );
  }
}
