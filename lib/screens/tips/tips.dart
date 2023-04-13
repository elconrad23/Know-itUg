import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';

class KnowItTips extends StatelessWidget {
  const KnowItTips({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      children: [
        const VerticalSpace(of: spacing4),
        ...srhInfoList.map((srhInfo) => TipTile(srhInfo: srhInfo)),
        const VerticalSpace(of: spacing32),
      ],
    );
  }
}

class TipTile extends StatelessWidget {
  const TipTile({
    super.key,
    required this.srhInfo,
  });

  final SRHInfo srhInfo;

  @override
  Widget build(BuildContext context) {
    //
    return EntranceFader(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: spacing4,
          horizontal: spacing8,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: knowItColor,
          borderRadius: borderRadius8,
          border: Border.all(
            color: knowItColor,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: padding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    srhInfo.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                      color: knowItWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HorizontalSpace(of: spacing8),
                  const Icon(
                    CupertinoIcons.wand_stars_inverse,
                    color: knowItWhite,
                  ),
                ],
              ),
            ),
            Container(
              padding: padding8,
              decoration: const BoxDecoration(
                borderRadius: borderRadius8,
                color: knowItWhite,
              ),
              child: Text(
                srhInfo.description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
