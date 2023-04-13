// Project imports:

import '../../knowit_exporter.dart';

final themeProvider = Provider<AppTheme>((ref) => AppTheme());

class AppTheme {
  ThemeData get light => _lightTheme();

  static _lightTheme([TextTheme? textTheme]) {
    textTheme ??= ThemeData.light().textTheme;
    const textStyleFunction = GoogleFonts.lato;

    return ThemeData(
      // useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: knowItColor,
      scaffoldBackgroundColor: knowItBackgroundColor,
      //* -- Visual Density
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //* -- Appbar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: knowItColor,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: knowItWhite,
        ),
      ),
      //* -- tooltip
      tooltipTheme: TooltipThemeData(
        textStyle: const TextStyle(color: knowItWhite),
        decoration: BoxDecoration(
          color: knowItTeal,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      //* -- text button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(14),
          ),
        ),
      ),
      //* Text Theme
      textTheme: TextTheme(
        displayLarge: textStyleFunction(textStyle: textTheme.displayLarge),
        displayMedium: textStyleFunction(textStyle: textTheme.displayMedium),
        displaySmall: textStyleFunction(textStyle: textTheme.displaySmall),
        headlineLarge: textStyleFunction(textStyle: textTheme.headlineLarge),
        headlineMedium: textStyleFunction(textStyle: textTheme.headlineMedium),
        headlineSmall: textStyleFunction(textStyle: textTheme.headlineSmall),
        titleLarge: textStyleFunction(textStyle: textTheme.titleLarge),
        titleMedium: textStyleFunction(textStyle: textTheme.titleMedium),
        titleSmall: textStyleFunction(textStyle: textTheme.titleSmall),
        bodyLarge: textStyleFunction(textStyle: textTheme.bodyLarge),
        bodyMedium: textStyleFunction(textStyle: textTheme.bodyMedium),
        bodySmall: textStyleFunction(textStyle: textTheme.bodySmall),
        labelLarge: textStyleFunction(textStyle: textTheme.labelLarge),
        labelMedium: textStyleFunction(textStyle: textTheme.labelMedium),
        labelSmall: textStyleFunction(textStyle: textTheme.labelSmall),
      ),
    );
  }
}
