// Project imports:

import '../../../knowit_exporter.dart';
import '../reward.dart';

class RewardsCard extends StatelessWidget {
  const RewardsCard({
    Key? key,
    required this.reward,
  }) : super(key: key);

  final Reward reward;

  @override
  Widget build(BuildContext context) {
    // values from reward
    final rewards = reward.rewardScore;
    final title = reward.title;
    final background = reward.background;
    final textColor = reward.textColor;
    final rewardIcon = reward.rewardIcon;

    // container with a big text e.g 5000 and a footer text e.g videos watched
    return Container(
      margin: const EdgeInsets.all(spacing4),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: background.withOpacity(.7),
        borderRadius: BorderRadius.circular(spacing8),
        // thin border
        border: Border.all(
          color: background,
          width: 2,
        ),
      ),
      padding: padding8,
      child: ExpandedScrollingColumn(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            rewardIcon,
            color: textColor,
            size: 30,
          ),
          const VerticalSpace(of: spacing8),
          // text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${numberFormatter.format(rewards)}${rewards > 1000 ? '+' : ''}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: textColor.withOpacity(.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              ThickHorizontalDivider(
                dividerColor: textColor,
                margin: const EdgeInsets.all(spacing8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
