import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../site/exporter.dart';

class JobSiteDetail extends StatelessWidget {
  const JobSiteDetail({
    super.key,
    required this.jobSite,
  });

  final JobSite jobSite;

  @override
  Widget build(BuildContext context) {
// site color
    final siteColor = jobSite.siteThemeColor;
    // text color
    final textColor = jobSite.siteTextColor;

    // site name
    final siteName = jobSite.siteName;
    // site logo
    final siteLogo = jobSite.siteLogoUrl;


    //
    return Scaffold(
      backgroundColor: knowItWhite,
      appBar: AppBar(
        backgroundColor: siteColor,
        title: Text(siteName),
      ),
      bottomNavigationBar: Container(
        color: siteColor,
        padding: padding8,
        child: AppButton(
          text: "Visit $siteName",
          textColor: siteColor,
          buttonColor: textColor,
          toolTip: "Visit The $siteName Website",
          tooltipColor: textColor,
          tooltipTextColor: siteColor,
          iconData: CupertinoIcons.arrow_up_right_circle_fill,
          onTap: () async {
            // launch site url
            await linkLauncher(jobSite.siteUrl);
          },
        ),
      ),
      body: ExpandedScrollingColumn(
        children: [
          // circle avatar with logo
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                margin: margin16,
                padding: padding4,
                decoration: BoxDecoration(
                  color: textColor.withOpacity(.3),
                  border: Border.all(
                    color: siteColor.withOpacity(.8),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: siteColor,
                  radius: 100,
                  backgroundImage: CachedNetworkImageProvider(siteLogo),
                ),
              ),
            ),
          ),

          //
          Expanded(
            flex: 2,
            child: SiteDescription(jobSite: jobSite),
          ),
        ],
      ),
    );
  }
}

class SiteDescription extends StatelessWidget {
  const SiteDescription({
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

    // site url
    final siteUrl = jobSite.siteUrl;

    return Container(
      padding: padding16,
      decoration: BoxDecoration(
        color: siteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(spacing16),
          topRight: Radius.circular(spacing16),
        ),
        // top drop shadow
        boxShadow: [
          BoxShadow(
            color: knowItBlack.withOpacity(.1),
            offset: const Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ThickHorizontalDivider(
              dividerColor: textColor,
              thickness: 5,
              dividerWidth: 70,
              margin: padding4,
            ),
          ),
          const VerticalSpace(of: spacing16),
          //
          Text(
            "$siteName,",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpace(of: spacing8),

          //
          Text(
            description,
            style: TextStyle(
              color: textColor.withOpacity(.8),
              fontSize: 16,
            ),
          ),
          const VerticalSpace(of: spacing16),

          //
          Text(
            "Website:",
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpace(of: spacing8),

          //
          Text(
            siteUrl,
            style: TextStyle(
              color: textColor.withOpacity(.8),
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
