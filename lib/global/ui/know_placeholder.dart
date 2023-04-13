import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';

class KnowItPlaceholder extends StatelessWidget {
  ///This is a placeholder widget used to render blank sample screens in the app
  const KnowItPlaceholder({Key? key, required this.title}) : super(key: key);

  /// title text for the screen
  /// e.g Upload a Video
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: knowItRandomColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              CupertinoIcons.circle_grid_hex_fill,
              color: knowItWhite,
              size: 80,
            ),
          ),

          const VerticalSpace(of: spacing16),

          // title
          Text(
            title + knowItRandomColor.toString(),
            style: const TextStyle(color: knowItWhite),
          ),
        ],
      ),
    );
  }
}
