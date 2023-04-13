// JobSite class
import '../../../knowit_exporter.dart';

class JobSite {
  final String siteName;
  final String siteUrl;
  final String siteLogoUrl;
  final String siteDescription;

  final Color siteThemeColor;
  final Color siteTextColor;

  JobSite({
    required this.siteName,
    required this.siteUrl,
    required this.siteLogoUrl,
    required this.siteDescription,
    required this.siteThemeColor,
    required this.siteTextColor,
  });
  // final String siteCategory;
  // final String siteLocation;
  // final String siteType;

}
