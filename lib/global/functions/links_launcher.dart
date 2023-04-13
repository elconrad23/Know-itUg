import '../../knowit_exporter.dart';

///This Opens the links
Future<void> linkLauncher(String link) async {
  if (await canLaunchUrl(Uri.parse(link))) {
    await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $link';
  }
}
