import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';

class HomePage {
  // icon data
  final IconData unselectedIcon, selectedIcon;

  // title
  final String title;
  // screen
  final Widget screen;

  final String? tooltip;

  HomePage({
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.title,
    required this.screen,
    this.tooltip,
  });
}

// nav screens home, Jobs, forum, messages
final List<HomePage> homePages = [
  HomePage(
    unselectedIcon: Icons.location_on_outlined,
    selectedIcon: Icons.location_on,
    title: "Job Sites",
    tooltip: "Go to Job Sites",
    screen: const KnowItJobs(),
  ),
  HomePage(
    unselectedIcon: Icons.forum_outlined,
    selectedIcon: CupertinoIcons.game_controller_solid,
    title: "Game",
    tooltip: "Go to Game",
    //Adding the how to play button here
    screen: const KnowItSpinWheel(),
  ),
  // HomePage(
  //   unselectedIcon: Icons.mail_outlined,
  //   selectedIcon: Icons.mail,
  //   title: "Profile",
  //   tooltip: "Go to Profile",
  //   screen: const KnowItProfile(),
  // ),
  HomePage(
    unselectedIcon: Icons.mail_outlined,
    selectedIcon: Icons.mail,
    title: "Tips",
    tooltip: "Go to Tips",
    screen: const KnowItTips(),
  ),
];
