import 'knowit_exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //
  runApp(
    const ProviderScope(
      child: KnowIt(),
    ),
  );
}
 