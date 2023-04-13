import 'package:cached_network_image/cached_network_image.dart';

import '../../knowit_exporter.dart';
import 'components/card.dart';
import 'reward.dart';

class KnowItProfile extends StatelessWidget {
  const KnowItProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // if we are on mobile
    final isMobile = KnowItResponsive.isMobile(context) ||
        KnowItResponsive.isSmallMobile(context) ||
        KnowItResponsive.isMediumMobile(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: borderRadius8,
            ),
            clipBehavior: Clip.antiAlias,
            height: 300,
            margin: margin8,
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: demoProfilePic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // space
        const SliverVerticalSpace(of: spacing8),
        // name
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverToBoxAdapter(
            child: Text(
              "John Doe",
              style: TextStyle(
                color: knowItBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // space
        const SliverVerticalSpace(of: spacing8),
        // bio
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc vel tincidunt lacinia, nunc nisl aliquam nisl, eu aliquam nisl nisl eu nunc. Sed euismod, nunc vel tincidunt lacinia, nunc nisl aliquam nisl, eu aliquam nisl nisl eu nunc.",
              maxLines: 3,
              style: TextStyle(
                color: knowItBlack.withOpacity(.6),
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SliverVerticalSpace(of: spacing8),
        // points scored
        // games played
        // TODO fetch results from cloud
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: spacing8),
          sliver: SliverGrid.extent(
            maxCrossAxisExtent: isMobile ? 200 : 300,
            childAspectRatio: 1,
            children:
                rewards.map((reward) => RewardsCard(reward: reward)).toList(),
          ),
        ),

        const SliverVerticalSpace(of: spacing32),
      ],
    );
  }
}
