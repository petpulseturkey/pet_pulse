class Strings {
  static const String generalPath = "assets/images/";
  static const String imageType = ".png";
  static const String appName = "PetPulse";

  static const List<String> animals = [
    "kedi",
    "kopek",
    "kus",
    "diger",
  ];

  static var animalImages = <String>[
    (generalPath + animals[0].toString() + imageType),
    (generalPath + animals[1].toString() + imageType),
    (generalPath + animals[2].toString() + imageType),
    (generalPath + animals[3].toString() + imageType),
  ];

  static const darklogo = 'assets/logos/darkThemelogo.png';
  static const lightlogo = 'assets/logos/transplogo.png';
}
