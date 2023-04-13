import '../../../knowit_exporter.dart';

class NavAppBarIcon extends StatelessWidget {
  const NavAppBarIcon({
    Key? key,
    required this.isSelected,
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final bool isSelected;

  // icon text
  final String text;

  // icon data
  final IconData unselectedIcon, selectedIcon;

  // on pressed
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: IconButton(
              icon: AnimatedSwitcher(
                duration: halfSeconds,
                child: Icon(
                  isSelected ? selectedIcon : unselectedIcon,
                  key: ValueKey(isSelected),
                  color: knowItWhite,
                  semanticLabel: text,
                ),
              ),
              onPressed: onPressed,
            ),
          ),
          const VerticalSpace(of: spacing8),
          isSelected
              ? const KnowItDot(dotDiameter: 4, dotColor: knowItWhite)
              : Text(
                  text,
                  style: TextStyle(
                    color: knowItWhite.withOpacity(.8),
                    fontSize: 10,
                  ),
                ),
        ],
      ),
    );
  }
}
