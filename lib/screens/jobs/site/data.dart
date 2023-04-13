// list of all job sites
import 'package:know_it/knowit_exporter.dart';

import 'job_site.dart';

final List<JobSite> jobsites = [
  // linkedin
  JobSite(
    siteName: "LinkedIn",
    siteUrl: "https://www.linkedin.com/",
    siteLogoUrl:
        '$jobSiteImagesRepo/linkedin.png',
    siteDescription:
        "LinkedIn is the world's largest business network, helping professionals like you discover inside connections to recommended job candidates, industry experts, and business partners.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF0077B5),
  ),

  // Indeed
  JobSite(
    siteName: "Indeed",
    siteUrl: "https://www.indeed.com/",
    siteLogoUrl: "$jobSiteImagesRepo/indeed-logo.png",
    siteDescription:
        "A search engine for jobs that aggregates listings from a variety of sources, including company career pages and other job boards.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF003A9B),
  ),
  // Glassdoor
  JobSite(
    siteName: "Glassdoor",
    siteUrl: "https://www.glassdoor.com/",
    siteLogoUrl: '$jobSiteImagesRepo/glassdoor.png',
    siteDescription:
        "A website that provides information about companies, including reviews from current and former employees, as well as job listings.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF0CAA41),
  ),
  // Monster
  JobSite(
    siteName: "Monster",
    siteUrl: "https://www.monster.com/",
    siteLogoUrl: "$jobSiteImagesRepo/moster.png",
    siteDescription:
        "A job search website that connects job seekers with potential employers and offers a variety of resources, such as resume building tools and salary information.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF4E2E85),
  ),
  // CareerBuilder
  JobSite(
    siteName: "CareerBuilder",
    siteUrl: "https://www.careerbuilder.com/",
    siteLogoUrl: "$jobSiteImagesRepo/careerbuiders.png",
    siteDescription:
        "A job search website that allows users to search for jobs, upload their resumes, and receive personalized job recommendations.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF0E0E24),
  ),
  // SimplyHired
  JobSite(
    siteName: "SimplyHired",
    siteUrl: "https://www.simplyhired.com/",
    siteLogoUrl: "$jobSiteImagesRepo/simplylearn.png",
    siteDescription:
        "A job search engine that lists job openings from a variety of sources, including company career pages, job boards, and newspapers.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF9B1368),
  ),
  // The Ladders
  JobSite(
    siteName: "The Ladders",
    siteUrl: "https://www.theladders.com/",
    siteLogoUrl: "$jobSiteImagesRepo/ladders.png",
    siteDescription:
        "A job search website that focuses on high-paying jobs in specific industries, such as finance, technology, and healthcare.",
    siteTextColor: knowItWhite,
    siteThemeColor: const Color(0xFF4A4A4A),
  ),
];
