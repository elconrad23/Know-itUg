import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../detail/detail.dart';
import '../site/exporter.dart';

class JobSiteTile extends StatelessWidget {
  const JobSiteTile({
    Key? key,
    required this.jobSite,
  }) : super(key: key);

  final JobSite jobSite;

  @override
  Widget build(BuildContext context) {
// site color
    final siteColor = jobSite.siteThemeColor;
    // text color
    final textColor = jobSite.siteTextColor;
    // description
    final description = jobSite.siteDescription;
    // site name
    final siteName = jobSite.siteName;
    // site logo
    final siteLogo = jobSite.siteLogoUrl;

    return OpenRoute(
      routePath: "pathToVisitedUserProfile",
      to: JobSiteDetail(jobSite: jobSite),
      closedBorderRadius: BorderRadius.zero,
      closedBuilder: (context, openVisitedSite) => Padding(
        padding: const EdgeInsets.symmetric(vertical: spacing4),
        child: EntranceFader(
          child: ListTile(
            tileColor: siteColor,
            shape: const RoundedRectangleBorder(
              borderRadius: borderRadius8,
            ),
            leading: Container(
              padding: padding4,
              decoration: BoxDecoration(
                color: textColor.withOpacity(.1),
                border: Border.all(
                  color: textColor.withOpacity(.8),
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: knowItWhite,
                backgroundImage: CachedNetworkImageProvider(siteLogo),
              ),
            ),
            title: Text(
              siteName,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: openVisitedSite,
            isThreeLine: true,
            subtitle: Text(
              description,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
                color: textColor.withOpacity(.5),
              ),
            ),
            trailing: Column(
              // to ensure that the icon is centered we did this
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.chevron_right_circle_fill,
                  color: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
