import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';
import 'home_providers.dart';

class HomeGameFab extends ConsumerWidget {
  const HomeGameFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

// check if this is selected and we are on the game page i.e index is 1
    bool isSelected = navBarIndex == 1;

    return Material(
      color: knowItTransparent,
      child: InkWell(
        onTap: () {
          // if not selected, then navigate to game page with the selected index as 1
          // if (!isSelected) {
          ref.read(selectedNavBarIndexProvider.notifier).state = 1;
          // }
        },
        child: Ink(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            borderRadius: borderRadius6,
            color: knowItColor,
          ),
          child: Icon(
            isSelected
                ? CupertinoIcons.game_controller_solid
                : CupertinoIcons.game_controller,
            color: knowItWhite,
          ), //icon inside button
        ),
      ),
    );
  }
}
