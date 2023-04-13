import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../home_providers.dart';
import 'navbar_icon.dart';

class HomeNavAppBar extends ConsumerWidget {
  const HomeNavAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

// check if this is selected and we are on the jobs page i.e index is 1
    bool isJobsPage = (navBarIndex == 0);

    // is profile page selected
    bool isProfilePage = (navBarIndex == 2);

    //
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: knowItColor,
      clipBehavior: Clip.antiAlias,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(borderRadius: borderRadius0),
        RoundedRectangleBorder(borderRadius: borderRadius6),
      ), //shape of notch
      notchMargin: spacing4,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: spacing16),
        child: Row(
          // children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavAppBarIcon(
              isSelected: isJobsPage,
              text: "Job Sites",
              selectedIcon: CupertinoIcons.news_solid,
              unselectedIcon: CupertinoIcons.news,
              onPressed: () =>
                  ref.read(selectedNavBarIndexProvider.notifier).state = 0,
            ),
            const EmptySpace(),
            NavAppBarIcon(
              isSelected: isProfilePage,
              text: "Tips",
              selectedIcon: CupertinoIcons.doc_on_clipboard_fill,
              unselectedIcon: CupertinoIcons.doc_on_clipboard,
              onPressed: () =>
                  ref.read(selectedNavBarIndexProvider.notifier).state = 2,
            ),
          ],
        ),
      ),
    );
  }
}
