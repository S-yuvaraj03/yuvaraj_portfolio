class SkillDetail {
  const SkillDetail({
    required this.skillId,
    required this.summary,
    required this.gainedFrom,
    required this.usedFor,
  });

  final String skillId;
  final String summary;
  final String gainedFrom;
  final String usedFor;
}

abstract final class SkillDetailsData {
  static const List<SkillDetail> items = [
    SkillDetail(
      skillId: 'flutter',
      summary:
          'Production cross-platform mobile development with reusable UI, responsive layouts, navigation and performance-focused implementation.',
      gainedFrom: 'Tata Consultancy Services • SBI YONO 2.0',
      usedFor:
          'UPI and Bill Payment journeys, production enhancements and customer-facing banking experiences.',
    ),
    SkillDetail(
      skillId: 'dart',
      summary:
          'Daily application development using null safety, async programming, collections, object-oriented design and maintainable domain logic.',
      gainedFrom: 'TCS production Flutter work + personal Flutter projects',
      usedFor:
          'Flutter application logic, models, state and reusable components.',
    ),
    SkillDetail(
      skillId: 'bloc',
      summary:
          'Event/state based separation of UI and business logic with testable state transitions.',
      gainedFrom: 'Flutter project work and focused architecture practice',
      usedFor:
          'Authentication, API-driven screens, interview projects and scalable state-management patterns.',
    ),
    SkillDetail(
      skillId: 'mobx',
      summary:
          'Reactive state management using stores, observables, actions and generated code.',
      gainedFrom: 'SBI YONO 2.0 at TCS',
      usedFor:
          'Production payment and complaint journeys with reactive UI and business state.',
    ),
    SkillDetail(
      skillId: 'rest-api',
      summary:
          'REST integration, JSON mapping, error handling and production debugging across service-driven mobile journeys.',
      gainedFrom: 'SBI YONO 2.0 + application projects',
      usedFor:
          'Payment services, BBPS/NPCI integrations, transaction status and application data flows.',
    ),
    SkillDetail(
      skillId: 'clean-architecture',
      summary:
          'Separation of presentation, domain and data responsibilities with repository-driven design and SOLID principles.',
      gainedFrom:
          'Production Flutter engineering at TCS + architecture practice',
      usedFor:
          'Maintainable feature development, API abstraction and easier testing/debugging.',
    ),
    SkillDetail(
      skillId: 'android-kotlin',
      summary:
          'Working knowledge of native Android integration, Kotlin/Java interoperability and platform-specific mobile behavior.',
      gainedFrom: 'Mobile integration work + continued native Android learning',
      usedFor:
          'Flutter-to-Android integration and understanding platform-specific implementation.',
    ),
    SkillDetail(
      skillId: 'firebase',
      summary:
          'Hands-on Firebase integration for application services and experimentation.',
      gainedFrom: 'Personal Flutter application projects',
      usedFor: 'Music/app prototypes and cloud-backed Flutter features.',
    ),
    SkillDetail(
      skillId: 'mysql',
      summary:
          'Relational database fundamentals, queries and backend data modelling.',
      gainedFrom: 'Backend learning with Django + MySQL',
      usedFor: 'Backend practice and full-stack development exercises.',
    ),
    SkillDetail(
      skillId: 'django',
      summary:
          'Backend development exposure using Django models, applications and database integration.',
      gainedFrom: 'Personal full-stack learning',
      usedFor: 'Django + MySQL backend exercises and API-oriented learning.',
    ),
    SkillDetail(
      skillId: 'git',
      summary:
          'Version control, collaborative branching, merge-request review and production delivery workflows.',
      gainedFrom: 'TCS team delivery + GitHub/GitLab project work',
      usedFor:
          'Feature development, code review, collaboration and CI/CD workflows.',
    ),
  ];

  static SkillDetail? byId(String id) {
    for (final item in items) {
      if (item.skillId == id) return item;
    }
    return null;
  }
}
