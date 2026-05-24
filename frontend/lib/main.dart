import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/qv_theme.dart';
import 'screens/home_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/workshops_screen.dart';
import 'screens/about_screen.dart';
import 'screens/ai_bootcamp_screen.dart';
import 'widgets/shared.dart';

void main() {
  runApp(const QuantumVectorApp());
}

final _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => _AppShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/courses', builder: (_, __) => const CoursesScreen()),
        GoRoute(path: '/courses/aws-devops', builder: (_, __) => const CoursesScreen()),
        GoRoute(path: '/courses/ai-llm-bootcamp', builder: (_, __) => const AIBootcampScreen()),
        GoRoute(path: '/webinars', builder: (_, __) => const WorkshopsScreen()),
        GoRoute(path: '/about', builder: (_, __) => const AboutScreen()),
        GoRoute(path: '/contact', builder: (_, __) => const _PlaceholderScreen('Contact Us')),
      ],
    ),
  ],
  errorBuilder: (_, state) => const _PlaceholderScreen('404 – Page Not Found'),
);

class QuantumVectorApp extends StatelessWidget {
  const QuantumVectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quantum Vector — AI & DevOps Training',
      theme: QVTheme.light,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class _AppShell extends StatelessWidget {
  final Widget child;
  const _AppShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox.expand(child: child),
          const Positioned(top: 0, left: 0, right: 0, child: QVNavbar()),
        ],
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            color: const Color(0xFFF7F7F5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: QVTheme.display2(color: const Color(0xFF1a1a1a))),
                const SizedBox(height: 20),
                Text('This page is coming soon.',
                    style: QVTheme.body(color: const Color(0xFF888))),
                const SizedBox(height: 32),
                QVButton(
                  label: '← Back to Home',
                  onTap: () => context.go('/'),
                  variant: ButtonVariant.outline,
                ),
              ],
            ),
          ),
          const QVFooter(),
        ],
      ),
    );
  }
}
