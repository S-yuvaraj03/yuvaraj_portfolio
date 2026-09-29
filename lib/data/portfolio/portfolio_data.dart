import '../../app/router/app_routes.dart';
import '../models/portfolio_item.dart';

abstract final class PortfolioData {
  static const List<PortfolioItem> items = [
    // --------------------
    // TECHNICAL SKILLS
    // --------------------
    PortfolioItem(
      id: 'flutter',
      title: 'Flutter',
      subtitle: 'Cross-platform development',
      type: PortfolioItemType.skill,
      keywords: [
        'flutter',
        'mobile',
        'android',
        'ios',
        'web',
        'cross platform',
        'frontend',
      ],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'dart',
      title: 'Dart',
      subtitle: 'Programming Language',
      type: PortfolioItemType.skill,
      keywords: ['dart', 'programming', 'language', 'flutter', 'oops'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'bloc',
      title: 'BLoC',
      subtitle: 'State Management',
      type: PortfolioItemType.skill,
      keywords: [
        'bloc',
        'state management',
        'flutter bloc',
        'architecture',
        'equatable',
      ],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'mobx',
      title: 'MobX',
      subtitle: 'Reactive State Management',
      type: PortfolioItemType.skill,
      keywords: ['mobx', 'state management', 'reactive', 'flutter'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'django',
      title: 'Django',
      subtitle: 'Backend Development',
      type: PortfolioItemType.skill,
      keywords: ['django', 'python', 'backend', 'api', 'rest api'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'mysql',
      title: 'MySQL',
      subtitle: 'Database',
      type: PortfolioItemType.skill,
      keywords: ['mysql', 'sql', 'database', 'backend'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'firebase',
      title: 'Firebase',
      subtitle: 'Cloud & Application Services',
      type: PortfolioItemType.skill,
      keywords: ['firebase', 'cloud', 'firestore', 'authentication'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'git',
      title: 'Git',
      subtitle: 'Version Control',
      type: PortfolioItemType.skill,
      keywords: ['git', 'github', 'gitlab', 'version control', 'merge request'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'rest-api',
      title: 'REST APIs',
      subtitle: 'Integration & Networking',
      type: PortfolioItemType.skill,
      keywords: ['rest', 'api', 'dio', 'http', 'json', 'integration'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'clean-architecture',
      title: 'Clean Architecture',
      subtitle: 'Maintainable Application Design',
      type: PortfolioItemType.skill,
      keywords: ['clean architecture', 'solid', 'repository', 'usecase', 'dependency injection'],
      route: AppRoutes.skills,
    ),

    PortfolioItem(
      id: 'android-kotlin',
      title: 'Android & Kotlin',
      subtitle: 'Native Mobile Integration',
      type: PortfolioItemType.skill,
      keywords: ['android', 'kotlin', 'native', 'mobile', 'integration'],
      route: AppRoutes.skills,
    ),

    // --------------------
    // PROJECTS
    // --------------------
    PortfolioItem(
      id: 'sbi-yono',
      title: 'SBI YONO 2.0',
      subtitle: 'Banking & FinTech',
      description:
          'Flutter engineering across high-traffic UPI and Bill Payment journeys, including enhancements, production fixes and complaint experiences.',
      type: PortfolioItemType.project,
      keywords: [
        'sbi',
        'yono',
        'banking',
        'fintech',
        'flutter',
        'upi',
        'payment',
        'bill payment',
        'p2p',
        'p2m',
        'production',
        'mobile banking',
      ],
      route: AppRoutes.projects,
    ),

    PortfolioItem(
      id: 'pos',
      title: 'Offline POS',
      subtitle: 'Flutter • SQLite',
      description:
          'Offline point-of-sale application with inventory, cart, billing, sales history and export workflows.',
      type: PortfolioItemType.project,
      keywords: [
        'pos',
        'flutter',
        'sqlite',
        'offline',
        'billing',
        'inventory',
        'sales',
      ],
      route: AppRoutes.projects,
    ),

    PortfolioItem(
      id: 'music-dj',
      title: 'Music DJ Studio',
      subtitle: 'Flutter • Media • Firebase',
      description:
          'A local music experience with device scanning, playlists and multi-track DJ mixing experiments.',
      type: PortfolioItemType.project,
      keywords: ['music', 'dj', 'flutter', 'firebase', 'media', 'playlist', 'audio'],
      route: AppRoutes.projects,
    ),

    // --------------------
    // EXPERIENCE
    // --------------------
    PortfolioItem(
      id: 'tcs',
      title: 'Tata Consultancy Services',
      subtitle: 'Flutter Developer',
      type: PortfolioItemType.experience,
      keywords: [
        'tcs',
        'experience',
        'flutter developer',
        'software developer',
        'banking',
        'fintech',
        'client',
      ],
      route: AppRoutes.experience,
    ),

    // --------------------
    // EDUCATION
    // --------------------
    PortfolioItem(
      id: 'srmist',
      title: 'SRM Institute of Science and Technology',
      subtitle: 'Education',
      type: PortfolioItemType.education,
      keywords: [
        'srm',
        'srmist',
        'college',
        'university',
        'education',
        'degree',
      ],
      route: AppRoutes.education,
    ),

    // --------------------
    // SOFT SKILLS
    // --------------------
    PortfolioItem(
      id: 'problem-solving',
      title: 'Problem Solving',
      subtitle: 'Soft Skill',
      type: PortfolioItemType.softSkill,
      keywords: [
        'problem solving',
        'debugging',
        'production',
        'analysis',
        'soft skill',
      ],
      route: AppRoutes.about,
    ),

    PortfolioItem(
      id: 'ownership',
      title: 'Ownership',
      subtitle: 'Soft Skill',
      type: PortfolioItemType.softSkill,
      keywords: [
        'ownership',
        'responsibility',
        'leadership',
        'delivery',
        'soft skill',
      ],
      route: AppRoutes.about,
    ),

    PortfolioItem(
      id: 'collaboration',
      title: 'Cross-functional Collaboration',
      subtitle: 'Soft Skill',
      type: PortfolioItemType.softSkill,
      keywords: [
        'collaboration',
        'teamwork',
        'client',
        'product',
        'design',
        'backend',
        'leadership',
      ],
      route: AppRoutes.about,
    ),
  ];
}
