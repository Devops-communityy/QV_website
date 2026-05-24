import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../models/data.dart';
import '../widgets/shared.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Page Hero
          _CoursesHero(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...QVData.courses.map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: _FullCourseCard(course: c),
                )),
              ],
            ),
          ),
          const _CourseComparisonTable(),
          const _EnrollmentCTA(),
          const QVFooter(),
        ],
      ),
    );
  }
}

class _CoursesHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(80, 120, 80, 60),
      decoration: const BoxDecoration(gradient: QVTheme.heroGradient),
      child: Column(
        children: [
          const SectionHeader(
            label: 'JOB-READY PROGRAMS',
            title: 'AWS DevOps Courses\nBuilt for 2026 Jobs',
            subtitle: 'Everything from Linux fundamentals to AI-powered DevSecOps.\nReal projects. Real mentors. Real results.',
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HeroPill(icon: Icons.verified, label: '85% Placement Rate'),
              const SizedBox(width: 24),
              _HeroPill(icon: Icons.schedule, label: '1 hr/day Live Sessions'),
              const SizedBox(width: 24),
              _HeroPill(icon: Icons.replay, label: 'Lifetime Access'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeroPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: QVTheme.glassBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: QVTheme.teal.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: QVTheme.teal, size: 16),
          const SizedBox(width: 8),
          Text(label, style: QVTheme.body().copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}

class _FullCourseCard extends StatelessWidget {
  final Course course;
  const _FullCourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      TechTag(label: course.badge),
                      if (course.isFeatured) ...[
                        const SizedBox(width: 8),
                        TechTag(label: 'MOST POPULAR', color: QVTheme.orange),
                      ],
                    ]),
                    const SizedBox(height: 16),
                    Text(course.title, style: QVTheme.display2().copyWith(fontSize: 36)),
                    const SizedBox(height: 4),
                    Text(course.subtitle, style: QVTheme.h4(color: QVTheme.teal)),
                    const SizedBox(height: 12),
                    Text(course.description, style: QVTheme.body(color: QVTheme.textMuted)),
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 40),
                _PriceBox(course: course),
              ],
            ],
          ),
          const SizedBox(height: 28),
          // Tags
          Wrap(
            spacing: 8, runSpacing: 8,
            children: course.tags.map((t) => TechTag(label: t)).toList(),
          ),
          const SizedBox(height: 28),
          // Curriculum
          Text('Curriculum', style: QVTheme.h4().copyWith(color: QVTheme.teal, fontSize: 16)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: isMobile ? 10 : 12,
            children: course.curriculum.map((item) => Row(
              children: [
                const Icon(Icons.check_circle_outline, color: QVTheme.teal, size: 16),
                const SizedBox(width: 10),
                Expanded(child: Text(item, style: QVTheme.bodySmall())),
              ],
            )).toList(),
          ),
          if (isMobile) ...[
            const SizedBox(height: 24),
            _PriceBox(course: course, mobile: true),
          ],
        ],
      ),
    );
  }
}

class _PriceBox extends StatelessWidget {
  final Course course;
  final bool mobile;
  const _PriceBox({required this.course, this.mobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 220,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [QVTheme.teal.withOpacity(0.1), QVTheme.navyDeep],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.teal.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.price,
              style: QVTheme.display2().copyWith(fontSize: 36, color: QVTheme.teal)),
          Text('One-time payment', style: QVTheme.bodySmall()),
          const SizedBox(height: 16),
          _InfoRow(icon: Icons.schedule, label: course.duration),
          const SizedBox(height: 6),
          _InfoRow(icon: Icons.trending_up, label: course.level),
          const SizedBox(height: 6),
          _InfoRow(icon: Icons.laptop, label: 'Online + Hyderabad'),
          const SizedBox(height: 20),
          QVButton(
            label: 'Enroll Now →',
            onTap: () {},
            fullWidth: true,
          ),
          const SizedBox(height: 8),
          Center(
            child: Text('📞 DM us on Instagram', style: QVTheme.bodySmall(color: QVTheme.textMuted)),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, color: QVTheme.teal, size: 14),
      const SizedBox(width: 8),
      Text(label, style: QVTheme.bodySmall()),
    ]);
  }
}

class _CourseComparisonTable extends StatelessWidget {
  const _CourseComparisonTable();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    if (isMobile) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            label: 'COMPARE',
            title: 'Find Your Perfect Program',
          ),
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: QVTheme.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: QVTheme.cardBorder),
            ),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              children: [
                _tableHeader(),
                _tableRow('Duration', '2-3 Months', '6 Weeks', '4 Weeks'),
                _tableRow('Level', 'Beginner → Adv', 'Intermediate', 'Intermediate → Adv'),
                _tableRow('Price', '₹29,999', '₹14,999', '₹9,999'),
                _tableRow('Projects', '4 Projects', '2 Projects', '2 Projects'),
                _tableRow('AI Content', '✓ Included', '✓✓ Core Focus', '✓ Partial'),
                _tableRow('DevSecOps', '✓ Included', '✓✓ Core Focus', '✗'),
                _tableRow('Placement', '✓ Full Support', '✓ Support', '✓ Support'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _tableHeader() => TableRow(
    decoration: const BoxDecoration(
      color: QVTheme.navyMid,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    children: ['Feature', 'AWS DevOps', 'AI DevSecOps', 'Kubernetes']
        .map((h) => Padding(
      padding: const EdgeInsets.all(16),
      child: Text(h,
          style: h == 'Feature'
              ? QVTheme.bodySmall()
              : QVTheme.h4().copyWith(fontSize: 14, color: QVTheme.teal)),
    ))
        .toList(),
  );

  TableRow _tableRow(String feature, String v1, String v2, String v3) => TableRow(
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: QVTheme.cardBorder)),
    ),
    children: [feature, v1, v2, v3].map((v) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(v, style: QVTheme.bodySmall(
          color: v.startsWith('✓') ? QVTheme.teal
              : v == '✗' ? QVTheme.textMuted.withOpacity(0.4)
              : QVTheme.offWhite)),
    )).toList(),
  );
}

class _EnrollmentCTA extends StatelessWidget {
  const _EnrollmentCTA();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(80, 0, 80, 60),
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        gradient: QVTheme.tealGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Not sure which course to pick?',
                  style: QVTheme.h3(color: QVTheme.navyDeep)),
              Text('DM us on Instagram and we\'ll help you choose.',
                  style: QVTheme.body(color: QVTheme.navyDeep.withOpacity(0.7))),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: QVTheme.navyDeep,
              foregroundColor: QVTheme.teal,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('DM PROJECT on Instagram'),
          ),
        ],
      ),
    );
  }
}
