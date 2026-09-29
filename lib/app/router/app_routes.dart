abstract final class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String skills = '/skills';
  static const String projects = '/projects';
  static const String experience = '/experience';
  static const String education = '/education';
  static const String contact = '/contact';

  static String project(String id) => '/projects/$id';
}
