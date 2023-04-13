// Flutter imports:
import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';

class Reward {
  final double rewardScore;

  // description
  final String title;

  // background color
  final Color background;

  // text color
  final Color textColor;

  // rewardIcon
  final IconData rewardIcon;

  Reward({
    required this.rewardScore,
    required this.title,
    required this.background,
    required this.textColor,
    required this.rewardIcon,
  });
}

List<Reward> rewards = [
  Reward(
    rewardScore: 1100,
    title: 'Games Played',
    textColor: knowItWhite,
    background: knowItTeal,
    rewardIcon: CupertinoIcons.game_controller_solid,
  ),
  Reward(
    rewardScore: 550.5,
    title: 'Points Scored',
    textColor: knowItBlack,
    background: knowItOrange,
    rewardIcon: CupertinoIcons.gift,
  ),
];
