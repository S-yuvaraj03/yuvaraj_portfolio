class PortfolioArticle {
  const PortfolioArticle({
    required this.id,
    required this.intro,
    required this.sections,
  });

  final String id;
  final String intro;
  final List<ArticleSection> sections;
}

class ArticleSection {
  const ArticleSection({required this.title, required this.body});

  final String title;
  final String body;
}

abstract final class PortfolioArticleData {
  static const Map<String, PortfolioArticle> articles = {
    'sbi-yono': PortfolioArticle(
      id: 'sbi-yono',
      intro:
          'SBI YONO 2.0 is the largest production environment I have worked in as a Flutter developer. My work sits around payment journeys where reliability, backward compatibility and clear handling of transaction states matter as much as the interface.',
      sections: [
        ArticleSection(
          title: 'What I worked on',
          body:
              'I contributed to UPI and Bill Payment journeys, including feature enhancements, production fixes and complaint-related experiences. The work involved understanding business rules, integrating service responses into Flutter flows and making changes without disturbing existing customer journeys.',
        ),
        ArticleSection(
          title: 'Payments and integrations',
          body:
              'My project exposure includes BBPS bill-payment flows across multiple biller categories, UPI payment journeys and NPCI-facing integrations. I also worked around Tap & Pay credential synchronisation and biometric-enabled payment capabilities as part of the broader mobile payments ecosystem.',
        ),
        ArticleSection(
          title: 'Engineering responsibility',
          body:
              'The role requires debugging across UI, state and API boundaries, reviewing merge requests, coordinating with backend and client teams, and supporting fixes that can safely move through testing and release. I use clean separation of responsibilities and reactive state management to keep changes understandable.',
        ),
        ArticleSection(
          title: 'What this project taught me',
          body:
              'Banking software made me more careful about edge cases, transaction states and regression impact. It also taught me to treat production debugging as a structured engineering problem: reproduce the behaviour, trace the state and service response, isolate the cause and verify the fix across related journeys.',
        ),
      ],
    ),
    'pos': PortfolioArticle(
      id: 'pos',
      intro:
          'I built the offline POS application to practise product ownership outside a large enterprise codebase. The goal was a usable sales workflow that continues to work without depending on a network connection.',
      sections: [
        ArticleSection(
          title: 'Product scope',
          body:
              'The application covers categories, products, inventory, cart and billing, sales history and export-oriented workflows. SQLite keeps operational data on the device so the primary sales flow remains available offline.',
        ),
        ArticleSection(
          title: 'Why I built it',
          body:
              'The project helped me think about data relationships, local persistence and how several small screens combine into one complete business workflow rather than treating each page as an isolated UI exercise.',
        ),
      ],
    ),
    'music-dj': PortfolioArticle(
      id: 'music-dj',
      intro:
          'Music DJ Studio is an experimental Flutter project focused on device media, playlists and multi-track interaction.',
      sections: [
        ArticleSection(
          title: 'Technical exploration',
          body:
              'I worked with local audio discovery, playlist management, media storage and playback-oriented APIs. The project also gave me practical exposure to Firebase-backed application services.',
        ),
        ArticleSection(
          title: 'What I learned',
          body:
              'Media applications expose platform-specific behaviour quickly. Working through permissions, device libraries and playback constraints strengthened my understanding of the boundary between Flutter and native mobile capabilities.',
        ),
      ],
    ),
    'tcs': PortfolioArticle(
      id: 'tcs',
      intro:
          'I joined Tata Consultancy Services in November 2022 and moved into Flutter-focused mobile engineering, working on SBI YONO 2.0 in a banking environment with production-scale requirements.',
      sections: [
        ArticleSection(
          title: 'Role and ownership',
          body:
              'My day-to-day work includes implementing Flutter features, integrating APIs, debugging production issues and coordinating with product, client, backend and testing teams. I have owned work in payment journeys and supported changes through development, review and release.',
        ),
        ArticleSection(
          title: 'How I work',
          body:
              'I prefer to understand the complete flow before changing code: the business rule, current state, API contract, UI behaviour and possible regression points. I also review merge requests and use team feedback to improve implementation quality.',
        ),
        ArticleSection(
          title: 'Recognition',
          body:
              'My contribution was recognised with a Star of the Quarter award. The experience has strengthened my ownership, production debugging and ability to work across teams in a client-facing delivery environment.',
        ),
      ],
    ),
    'srmist': PortfolioArticle(
      id: 'srmist',
      intro:
          'I pursued a Master of Computer Applications at SRM Institute of Science and Technology from 2024 to 2026 while continuing my professional work in software development.',
      sections: [
        ArticleSection(
          title: 'Academic record',
          body:
              'The programme strengthened my computer-application foundation alongside practical industry experience. My recorded CGPA is 9.38 out of 10.',
        ),
        ArticleSection(
          title: 'Learning alongside work',
          body:
              'Studying while working gave me a useful balance: academic concepts could be compared against production engineering decisions, while problems from work gave additional context to what I was learning.',
        ),
      ],
    ),
    'madras-university': PortfolioArticle(
      id: 'madras-university',
      intro:
          'My Bachelor of Computer Applications at the University of Madras, completed between 2019 and 2022, established the foundation for my software-development career.',
      sections: [
        ArticleSection(
          title: 'Foundation',
          body:
              'The degree introduced the programming, application and database fundamentals that I later developed further through professional mobile work and independent projects. My recorded CGPA is 7.4 out of 10.',
        ),
        ArticleSection(
          title: 'From study to engineering',
          body:
              'After graduation I continued building practical software skills and eventually moved into Flutter mobile development, where those fundamentals became part of day-to-day product engineering.',
        ),
      ],
    ),
  };

  static PortfolioArticle? byId(String id) => articles[id];
}
