import "package:flutter/material.dart";

class GlobalTheme {
  final TextTheme textTheme;

  const GlobalTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281753245),
      surfaceTint: Color(4281753245),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286753004),
      onPrimaryContainer: Color(4278197312),
      secondary: Color(4283522937),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292470015),
      onSecondaryContainer: Color(4282141026),
      tertiary: Color(4286663303),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291858900),
      onTertiaryContainer: Color(4281729343),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294572543),
      onSurface: Color(4279901216),
      onSurfaceVariant: Color(4282599248),
      outline: Color(4285757313),
      outlineVariant: Color(4291020498),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282613),
      inversePrimary: Color(4289382399),
      primaryFixed: Color(4292273151),
      onPrimaryFixed: Color(4278197054),
      primaryFixedDim: Color(4289382399),
      onPrimaryFixedVariant: Color(4279846531),
      secondaryFixed: Color(4292273151),
      onSecondaryFixed: Color(4279049266),
      secondaryFixedDim: Color(4290365413),
      onSecondaryFixedVariant: Color(4282009440),
      tertiaryFixed: Color(4294956798),
      onTertiaryFixed: Color(4281663806),
      tertiaryFixedDim: Color(4294095093),
      onTertiaryFixedVariant: Color(4284953197),
      surfaceDim: Color(4292532703),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177785),
      surfaceContainer: Color(4293848563),
      surfaceContainerHigh: Color(4293453805),
      surfaceContainerHighest: Color(4293059304),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4289382399),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289842175),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294703871),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290628585),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294423802),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374615),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291283670),
      outlineVariant: Color(4291283670),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059304),
      inversePrimary: Color(4278200665),
      primaryFixed: Color(4292732927),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289842175),
      onPrimaryFixedVariant: Color(4278195764),
      secondaryFixed: Color(4292732927),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290628585),
      onSecondaryFixedVariant: Color(4278654509),
      tertiaryFixed: Color(4294958333),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294423802),
      onTertiaryFixedVariant: Color(4281139253),
      surfaceDim: Color(4279374615),
      surfaceBright: Color(4281874750),
      surfaceContainerLowest: Color(4278980114),
      surfaceContainerLow: Color(4279901216),
      surfaceContainer: Color(4280164388),
      surfaceContainerHigh: Color(4280822318),
      surfaceContainerHighest: Color(4281546041),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      fontFamily: "Quicksand"
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [
  ];
}

class GlobalTextTheme {
  static TextTheme globalTextTheme = const TextTheme(
  displayLarge: TextStyle(
  fontFamily: 'Quicksand', fontSize: 72, fontWeight: FontWeight.bold),
  displayMedium: TextStyle(
  fontFamily: 'Quicksand', fontSize: 60, fontWeight: FontWeight.w600),
  displaySmall: TextStyle(
  fontFamily: 'Quicksand', fontSize: 48, fontWeight: FontWeight.w500),
  headlineLarge: TextStyle(
  fontFamily: 'Quicksand', fontSize: 34, fontWeight: FontWeight.w400),
  headlineMedium: TextStyle(
  fontFamily: 'Quicksand', fontSize: 24, fontWeight: FontWeight.w400),
  headlineSmall: TextStyle(
  fontFamily: 'Quicksand', fontSize: 20, fontWeight: FontWeight.w400),
  titleLarge: TextStyle(
  fontFamily: 'Quicksand', fontSize: 20, fontWeight: FontWeight.w500),
  titleMedium: TextStyle(
  fontFamily: 'Quicksand', fontSize: 16, fontWeight: FontWeight.w400),
  titleSmall: TextStyle(
  fontFamily: 'Quicksand', fontSize: 14, fontWeight: FontWeight.w500),
  bodyLarge: TextStyle(
  fontFamily: 'Quicksand', fontSize: 16, fontWeight: FontWeight.w400),
  bodyMedium: TextStyle(
  fontFamily: 'Quicksand', fontSize: 14, fontWeight: FontWeight.w400),
  bodySmall: TextStyle(
  fontFamily: 'Quicksand', fontSize: 12, fontWeight: FontWeight.w400),
  labelLarge: TextStyle(
  fontFamily: 'Quicksand', fontSize: 14, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(
  fontFamily: 'Quicksand', fontSize: 12, fontWeight: FontWeight.w500),
  labelSmall: TextStyle(
  fontFamily: 'Quicksand', fontSize: 10, fontWeight: FontWeight.w400),
  );
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
