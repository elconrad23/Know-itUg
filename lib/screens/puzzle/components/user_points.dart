import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';

class CurrentUserPoints extends StatelessWidget {
  const CurrentUserPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Icon(
            CupertinoIcons.graph_circle_fill,
            color: knowItWhite,
          ),
          HorizontalSpace(of: spacing4),
          Text(
            "1,000",
            style: TextStyle(
              color: knowItWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
