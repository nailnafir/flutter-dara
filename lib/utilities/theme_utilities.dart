part of 'utilities.dart';

abstract class ColorThemeUtilities {
  static Color bgLight = const Color(0xFFF5F5F5);
  static Color bgDark = const Color(0xFF251500);
  static Color primaryColor = const Color(0xFFFFCE81);
  static Color secondaryColor = const Color(0xFFFAB266);
  static Color tertiaryColor = const Color(0xFFFDE3C8);
  static Color greenColor = const Color(0xFF08AF80);
  static Color blueColor = const Color(0xFF01ABE6);
  static Color redColor = const Color(0xFFF65D5A);
  static Color accentColorDarkGrey = const Color(0xFFADADAD);
  static Color accentColorLightGrey = const Color(0xFFE3E3E3);
}

abstract class TextThemeUtilities {
  static TextStyle titleTextFont = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle subTitleTextFont = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bigTextFont = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontSize: 16,
  );
  static TextStyle normalTextFont = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontSize: 14,
  );
  static TextStyle smallTextFont = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontSize: 12,
  );
}
