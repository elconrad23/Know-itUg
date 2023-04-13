import '../knowit_exporter.dart';

class KnowIt extends ConsumerWidget {
  const KnowIt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final theme = ref.watch(themeProvider);

    // final themeMode = ref.watch(themeModeProvider);
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      color: knowItColor,
      title: "Thumbs App",
      restorationScopeId: knowitId,

      // *theme
      // themeMode: themeMode,
      theme: theme.light,
      // Enable this later on in the Future when we add dark mode support
      // darkTheme: theme.darkTheme,

      // *router
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      //* -- Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
