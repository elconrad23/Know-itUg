import '../../../knowit_exporter.dart';
import 'components/site_tile.dart';
import 'site/exporter.dart';

class KnowItJobs extends StatelessWidget {
  const KnowItJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding16,
      children: [
        // job site tiles
        ...jobsites.map((jobSite) => JobSiteTile(jobSite: jobSite)).toList(),

        const VerticalSpace(of: spacing16 * 2),
      ],
    );
  }
}
