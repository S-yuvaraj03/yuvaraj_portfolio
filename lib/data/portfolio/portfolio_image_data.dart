abstract final class PortfolioImageData {
  static const Map<String, String> skillImages = {
    'flutter':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/flutter/flutter-original.svg',
    'dart':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.svg',
    'firebase':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/firebase/firebase-plain.svg',
    'mysql':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original.svg',
    'git':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original.svg',
    'android-kotlin':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/kotlin/kotlin-original.svg',
    'django':
        'https://raw.githubusercontent.com/devicons/devicon/master/icons/django/django-plain.svg',
  };

  static String? skill(String id) => skillImages[id];
}
