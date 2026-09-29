# Yuvaraj — Flutter Developer Portfolio

A responsive Flutter Web portfolio designed as a personal interactive universe rather than a static résumé.

## Experience

- Galaxy-inspired dark interface with a morphing Dynamic Island
- Responsive desktop, tablet and mobile layouts
- Search across skills, projects, experience and education
- Data-driven portfolio content
- Flutter BLoC state management
- Navigator 2.0 routing with `go_router`
- Lightweight Flutter-native animations

## Architecture

The UI is intentionally separated from editable portfolio content. Update searchable content in:

`lib/data/portfolio/portfolio_data.dart`

Core feature code lives under:

`lib/features/portfolio/`

Shared portfolio widgets live under:

`lib/features/widgets/`

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Quality checks

```bash
dart format lib test
flutter analyze
flutter test
flutter build web --release
```

## Web deployment

The production output is generated in `build/web`.

For Cloudflare Pages, use a Flutter-capable build environment and publish `build/web`. When deploying client-side routes directly, configure the host to fall back to `index.html`.

## Content still intentionally configurable

Exact social/profile URLs and any education details not present in the project data are intentionally not invented. Add those values only when verified.
