abstract final class PortfolioImageData {
  static const String flutter =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg';
  static const String dart =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg';
  static const String git =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg';
  static const String firebase =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg';
  static const String kotlin =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/kotlin/kotlin-original.svg';
  static const String django =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/django/django-plain.svg';
  static const String mysql =
      'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-original.svg';

  static const Map<String, String> skillImages = {
    'flutter': flutter,
    'dart': dart,
    'firebase': firebase,
    'mysql': mysql,
    'git': git,
    'android-kotlin': kotlin,
    'django': django,
  };

  static String? skill(String id) => skillImages[id];
}
