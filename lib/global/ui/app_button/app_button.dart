import '../../../knowit_exporter.dart';
import 'button_body.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor = knowItWhite,
    this.buttonColor = knowItColor,
    this.iconData,
    this.iconWidget,
    this.toolTip,
    this.isSmallButton = false,
    this.tooltipTextColor,
    this.tooltipColor,
  }) : super(key: key);

  const AppButton.small({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor = knowItWhite,
    this.buttonColor = knowItColor,
    this.iconData,
    this.toolTip,
    this.iconWidget,
    this.isSmallButton = true,
    this.tooltipTextColor,
    this.tooltipColor,
  }) : super(key: key);

  ///Wether the button is small or not
  final bool isSmallButton;
  final String text;
  final Widget? iconWidget;
  final VoidCallback onTap;

  // button colors
  final Color textColor, buttonColor;

  // tooltip colors
  final Color? tooltipTextColor, tooltipColor;

  final IconData? iconData;
  final String? toolTip;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    ///This variable declares that if we are on phone
    ///, no mouse region, else we gat a mouse region
    final isPhone = (isBoxAndroid || isBoxiOs);

    return MouseRegion(
      onHover: isPhone ? null : (_) => setState(() => isHovered = true),
      onExit: isPhone ? null : (_) => setState(() => isHovered = false),
      child: ButtonBody(
        buttonColor: widget.buttonColor,
        textColor: widget.textColor,
        tooltipColor: widget.tooltipColor,
        tooltipTextColor: widget.tooltipTextColor,
        toolTip: widget.toolTip,
        text: widget.text,
        iconData: widget.iconData,
        iconWidget: widget.iconWidget,
        onTap: () {
          setState(() => isHovered = false);
          //
          widget.onTap();
        },
        isHovered: isHovered,
        isSmallButton: widget.isSmallButton,
      ),
    );
  }
}
