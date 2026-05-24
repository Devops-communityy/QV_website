import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/qv_theme.dart';
import '../models/data.dart';
import '../widgets/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _HeroSection(),
          StatsBar(stats: QVData.stats),
          const _WhatWeTeachSection(),
          const _CoursesPreviewSection(),
          const _WorkshopBannerSection(),
          const _WhyQVSection(),
          const _TestimonialsSection(),
          const _TrainersSection(),
          const _FAQSection(),
          const _CTASection(),
          const QVFooter(),
        ],
      ),
    );
  }
}

// ─── Hero ─────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 768;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 700),
      decoration: const BoxDecoration(gradient: QVTheme.heroGradient),
      child: Stack(
        children: [
          // Background grid
          Positioned.fill(child: CustomPaint(painter: _GridPainter())),
          // Glow orbs
          Positioned(top: -100, right: -100,
            child: Container(
              width: 500, height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  QVTheme.teal.withOpacity(0.08),
                  Colors.transparent,
                ]),
              ),
            ),
          ),
          Positioned(bottom: -100, left: -100,
            child: Container(
              width: 400, height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  QVTheme.orange.withOpacity(0.06),
                  Colors.transparent,
                ]),
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.fromLTRB(
                isMobile ? 24 : 80, 120, isMobile ? 24 : 80, 80),
            child: isMobile
                ? _HeroContentMobile()
                : _HeroContentDesktop(),
          ),
        ],
      ),
    );
  }
}

class _HeroContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: QVTheme.glassBg,
                  border: Border.all(color: QVTheme.teal.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 8, height: 8,
                    decoration: const BoxDecoration(
                        color: QVTheme.teal, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text('AI & DevOps Training Platform',
                      style: QVTheme.label().copyWith(fontSize: 11)),
                ]),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),

              const SizedBox(height: 24),
              Text('Land Your DevOps\nJob in 90 Days',
                  style: QVTheme.display1()).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),

              const SizedBox(height: 8),
              ShaderMask(
                shaderCallback: (b) => QVTheme.tealGradient.createShader(b),
                child: Text('Guaranteed Results.',
                    style: QVTheme.display1().copyWith(fontSize: 52)),
              ).animate().fadeIn(delay: 600.ms),

              const SizedBox(height: 20),
              Text(
                'From Zero to Job-Ready — Join 2000+ engineers who transformed\ntheir careers with our AI-powered, mentor-led DevOps programs.',
                style: QVTheme.body(color: QVTheme.textMuted),
              ).animate().fadeIn(delay: 800.ms),

              const SizedBox(height: 36),
              Row(children: [
                QVButton(
                  label: 'Explore Courses →',
                  onTap: () => context.go('/courses'),
                ).animate().fadeIn(delay: 1000.ms).slideX(begin: -0.2),
                const SizedBox(width: 16),
                QVButton(
                  label: 'View Workshops',
                  onTap: () => context.go('/workshops'),
                  variant: ButtonVariant.outline,
                ).animate().fadeIn(delay: 1100.ms).slideX(begin: -0.2),
              ]),

              const SizedBox(height: 48),
              _TrustRow(),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: _TerminalWidget().animate().fadeIn(delay: 600.ms).slideX(begin: 0.3),
        ),
      ],
    );
  }
}

class _HeroContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: QVTheme.glassBg,
            border: Border.all(color: QVTheme.teal.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('AI & DevOps Training Platform', style: QVTheme.label().copyWith(fontSize: 10)),
        ),
        const SizedBox(height: 20),
        Text('Land Your DevOps\nJob in 90 Days', style: QVTheme.display2()),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (b) => QVTheme.tealGradient.createShader(b),
          child: Text('Guaranteed.', style: QVTheme.display2()),
        ),
        const SizedBox(height: 16),
        Text('Join 2000+ engineers who transformed their careers.',
            style: QVTheme.body(color: QVTheme.textMuted)),
        const SizedBox(height: 28),
        QVButton(label: 'Explore Courses →', onTap: () => context.go('/courses'), fullWidth: true),
        const SizedBox(height: 12),
        QVButton(label: 'View Workshops', onTap: () => context.go('/workshops'),
            variant: ButtonVariant.outline, fullWidth: true),
        const SizedBox(height: 32),
        _TrustRow(),
      ],
    );
  }
}

class _TrustRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TrustPill(icon: Icons.people_outline, label: '2000+ Engineers'),
        const SizedBox(width: 16),
        _TrustPill(icon: Icons.verified_outlined, label: '85% Placed'),
        const SizedBox(width: 16),
        _TrustPill(icon: Icons.star_outline, label: '4.9 Rating'),
      ],
    );
  }
}

class _TrustPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _TrustPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: QVTheme.teal, size: 14),
        const SizedBox(width: 6),
        Text(label, style: QVTheme.bodySmall()),
      ],
    );
  }
}

// ─── Terminal Widget (hero right panel) ───────────────────────────────────────
class _TerminalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: QVTheme.navyDeep,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.cardBorder),
        boxShadow: [
          BoxShadow(color: QVTheme.teal.withOpacity(0.1), blurRadius: 40, spreadRadius: -5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: QVTheme.navyMid,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(bottom: BorderSide(color: QVTheme.cardBorder)),
            ),
            child: Row(
              children: [
                _dot(const Color(0xFFFF5F57)),
                const SizedBox(width: 6),
                _dot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 6),
                _dot(const Color(0xFF28CA41)),
                const SizedBox(width: 16),
                Text('devops-career.sh', style: QVTheme.mono(size: 12)),
              ],
            ),
          ),
          // Code content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _line('# Your DevOps journey starts here', isComment: true),
                _line(''),
                _line('student init --name "You" --goal "DevOps Job"'),
                _line(''),
                _output('✓ Linux & Shell Scripting'),
                _output('✓ Docker & Container Networking'),
                _output('✓ Kubernetes on AWS EKS'),
                _output('✓ CI/CD with GitHub Actions'),
                _output('✓ Terraform IaC'),
                _output('✓ AI-Powered DevSecOps'),
                _line(''),
                _line('deploy --resume --interviews --offer'),
                _line(''),
                _output('🎉 Offer received: ₹12 LPA at TCS'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color c) =>
      Container(width: 12, height: 12, decoration: BoxDecoration(color: c, shape: BoxShape.circle));

  Widget _line(String text, {bool isComment = false}) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          text.isEmpty ? '' : (isComment ? text : '> $text'),
          style: QVTheme.mono(
              color: isComment ? QVTheme.textMuted : QVTheme.offWhite, size: 12),
        ),
      );

  Widget _output(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 3, left: 12),
        child: Text(text, style: QVTheme.mono(color: QVTheme.teal, size: 12)),
      );
}

// ─── What We Teach ─────────────────────────────────────────────────────────────
class _WhatWeTeachSection extends StatelessWidget {
  const _WhatWeTeachSection();

  static const topics = [
    ('☸️', 'Kubernetes & EKS', 'From kubeadm to production-grade EKS clusters'),
    ('☁️', 'AWS Cloud', 'EC2, EKS, S3, RDS, VPC, IAM, CloudWatch'),
    ('🤖', 'AI in DevOps', 'Claude AI, MCP, Agentic AI workflows'),
    ('🔒', 'DevSecOps', 'SAST, DAST, Container Security, Vault'),
    ('🔄', 'CI/CD Pipelines', 'GitHub Actions, Jenkins, ArgoCD, GitOps'),
    ('📊', 'Observability', 'Prometheus, Grafana, Alerting, Dashboards'),
    ('🏗️', 'Terraform IaC', 'Infrastructure as Code at scale'),
    ('🐳', 'Docker', 'Containers, Networking, Compose, Registry'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const SectionHeader(
            label: 'CURRICULUM',
            title: 'Everything You Need\nto Land the Job',
            subtitle: 'A complete AI & DevOps curriculum built for the 2026 job market.',
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: isMobile ? 1.1 : 1.3,
            children: topics.map((t) => _TopicCard(
              emoji: t.$1, title: t.$2, desc: t.$3,
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _TopicCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String desc;
  const _TopicCard({required this.emoji, required this.title, required this.desc});

  @override
  State<_TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<_TopicCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [QVTheme.cardBg, Color(0xFF0F172A)],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hover ? QVTheme.teal.withOpacity(0.5) : QVTheme.cardBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 12),
            Text(widget.title, style: QVTheme.h4().copyWith(fontSize: 15)),
            const SizedBox(height: 6),
            Text(widget.desc, style: QVTheme.bodySmall(), maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

// ─── Courses Preview ───────────────────────────────────────────────────────────
class _CoursesPreviewSection extends StatelessWidget {
  const _CoursesPreviewSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      color: QVTheme.cardBg.withOpacity(0.3),
      child: Column(
        children: [
          const SectionHeader(
            label: 'COURSES',
            title: 'Pick Your Path\nto a DevOps Career',
          ),
          const SizedBox(height: 48),
          ...QVData.courses.map((c) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _CourseCard(course: c),
          )),
          const SizedBox(height: 16),
          QVButton(
            label: 'View All Courses →',
            onTap: () => context.go('/courses'),
            variant: ButtonVariant.outline,
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final Course course;
  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return GlassCard(
      hoverable: true,
      onTap: () => context.go('/courses'),
      child: isMobile
          ? _CourseCardContentMobile(course: course)
          : _CourseCardContentDesktop(course: course),
    );
  }
}

class _CourseCardContentDesktop extends StatelessWidget {
  final Course course;
  const _CourseCardContentDesktop({required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                TechTag(label: course.badge),
                if (course.isFeatured) ...[
                  const SizedBox(width: 8),
                  TechTag(label: 'FEATURED', color: QVTheme.orange),
                ],
              ]),
              const SizedBox(height: 14),
              Text(course.title, style: QVTheme.h3()),
              Text(course.subtitle, style: QVTheme.body(color: QVTheme.teal)),
              const SizedBox(height: 10),
              Text(course.description, style: QVTheme.bodySmall(), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8, runSpacing: 6,
                children: course.tags.map((t) => TechTag(label: t)).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(course.price,
                style: QVTheme.display2().copyWith(fontSize: 32, color: QVTheme.teal)),
            const SizedBox(height: 4),
            Text('One-time payment', style: QVTheme.bodySmall()),
            const SizedBox(height: 8),
            Text('⏱ ${course.duration}', style: QVTheme.bodySmall()),
            Text('📈 ${course.level}', style: QVTheme.bodySmall()),
            const SizedBox(height: 20),
            QVButton(label: 'Learn More →', onTap: () => context.go('/courses')),
          ],
        ),
      ],
    );
  }
}

class _CourseCardContentMobile extends StatelessWidget {
  final Course course;
  const _CourseCardContentMobile({required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechTag(label: course.badge),
        const SizedBox(height: 12),
        Text(course.title, style: QVTheme.h4()),
        Text(course.subtitle, style: QVTheme.body(color: QVTheme.teal).copyWith(fontSize: 14)),
        const SizedBox(height: 8),
        Text(course.price, style: QVTheme.h3().copyWith(color: QVTheme.teal, fontSize: 28)),
        const SizedBox(height: 12),
        Wrap(spacing: 6, runSpacing: 6,
          children: course.tags.take(4).map((t) => TechTag(label: t)).toList()),
        const SizedBox(height: 16),
        QVButton(label: 'Learn More →', onTap: () => context.go('/courses'), fullWidth: true),
      ],
    );
  }
}

// ─── Workshop Banner ───────────────────────────────────────────────────────────
class _WorkshopBannerSection extends StatelessWidget {
  const _WorkshopBannerSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final ws = QVData.workshops.first;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 40),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [QVTheme.navyMid, QVTheme.orange.withOpacity(0.1)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: QVTheme.orange.withOpacity(0.3)),
      ),
      child: isMobile
          ? _WorkshopBannerMobile(ws: ws)
          : _WorkshopBannerDesktop(ws: ws),
    );
  }
}

class _WorkshopBannerDesktop extends StatelessWidget {
  final Workshop ws;
  const _WorkshopBannerDesktop({required this.ws});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                TechTag(label: '⚡ UPCOMING WORKSHOP', color: QVTheme.orange),
                const SizedBox(width: 8),
                TechTag(label: '🤖 AI-POWERED', color: QVTheme.teal),
              ]),
              const SizedBox(height: 16),
              Text(ws.title, style: QVTheme.display2().copyWith(fontSize: 36)),
              Text(ws.subtitle, style: QVTheme.body(color: QVTheme.orange)),
              const SizedBox(height: 12),
              Text(ws.description, style: QVTheme.bodySmall()),
              const SizedBox(height: 16),
              Row(children: [
                const Icon(Icons.calendar_today, color: QVTheme.teal, size: 14),
                const SizedBox(width: 6),
                Text(ws.date, style: QVTheme.bodySmall(color: QVTheme.teal)),
                const SizedBox(width: 20),
                const Icon(Icons.access_time, color: QVTheme.teal, size: 14),
                const SizedBox(width: 6),
                Text(ws.time, style: QVTheme.bodySmall(color: QVTheme.teal)),
                const SizedBox(width: 20),
                const Icon(Icons.laptop, color: QVTheme.teal, size: 14),
                const SizedBox(width: 6),
                Text(ws.mode, style: QVTheme.bodySmall(color: QVTheme.teal)),
              ]),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(ws.price, style: QVTheme.display2().copyWith(fontSize: 40, color: QVTheme.orange)),
            Text('One-Time Fee', style: QVTheme.bodySmall()),
            const SizedBox(height: 20),
            QVButton(
              label: 'Register Now →',
              onTap: () => context.go('/workshops'),
              variant: ButtonVariant.orange,
            ),
            const SizedBox(height: 8),
            Text('⚡ Limited seats available', style: QVTheme.bodySmall(color: QVTheme.orange)),
          ],
        ),
      ],
    );
  }
}

class _WorkshopBannerMobile extends StatelessWidget {
  final Workshop ws;
  const _WorkshopBannerMobile({required this.ws});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechTag(label: '⚡ UPCOMING WORKSHOP', color: QVTheme.orange),
        const SizedBox(height: 12),
        Text(ws.title, style: QVTheme.h3()),
        Text(ws.subtitle, style: QVTheme.body(color: QVTheme.orange)),
        const SizedBox(height: 8),
        Text(ws.price, style: QVTheme.h3().copyWith(color: QVTheme.orange, fontSize: 32)),
        const SizedBox(height: 16),
        QVButton(
          label: 'Register Now →', onTap: () => context.go('/workshops'),
          variant: ButtonVariant.orange, fullWidth: true,
        ),
      ],
    );
  }
}

// ─── Why QV ────────────────────────────────────────────────────────────────────
class _WhyQVSection extends StatelessWidget {
  const _WhyQVSection();

  static const features = [
    (Icons.code, 'Real-World Projects', 'Build 4 production-grade projects that go directly on your resume — not toy apps.', QVTheme.teal),
    (Icons.psychology, '1:1 Expert Mentorship', 'Direct access to trainers with 10-13 years of real industry experience at top companies.', QVTheme.orange),
    (Icons.work, 'Career Support', 'Resume writing, LinkedIn optimization, mock interviews, and job referrals included.', QVTheme.teal),
    (Icons.smart_toy, 'AI-Integrated Curriculum', 'Learn to use Claude AI, MCP, and agentic tools as a DevOps engineer — not just theory.', QVTheme.orange),
    (Icons.people, 'Community Access', 'Join 2000+ engineers on WhatsApp & Discord. Alumni network actively shares job leads.', QVTheme.teal),
    (Icons.replay, 'Lifetime Access', 'All recordings, materials, and future updates. Re-watch anytime — your learning never expires.', QVTheme.orange),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const SectionHeader(
            label: 'WHY QUANTUM VECTOR',
            title: 'Not Just Training.\nA Career Launch Pad.',
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: isMobile ? 2.5 : 1.4,
            children: features.map((f) => _FeatureCard(
              icon: f.$1, title: f.$2, desc: f.$3, color: f.$4,
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;
  const _FeatureCard({required this.icon, required this.title, required this.desc, required this.color});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 14),
          Text(title, style: QVTheme.h4().copyWith(fontSize: 17)),
          const SizedBox(height: 8),
          Text(desc, style: QVTheme.bodySmall()),
        ],
      ),
    );
  }
}

// ─── Testimonials ──────────────────────────────────────────────────────────────
class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      color: QVTheme.cardBg.withOpacity(0.2),
      child: Column(
        children: [
          const SectionHeader(
            label: 'SUCCESS STORIES',
            title: '2000+ Engineers.\nReal Results.',
          ),
          const SizedBox(height: 48),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: QVData.testimonials.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (_, i) => _TestimonialCard(t: QVData.testimonials[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Testimonial t;
  const _TestimonialCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: List.generate(5, (_) =>
              const Icon(Icons.star, color: QVTheme.orange, size: 14))),
            const SizedBox(height: 12),
            Text('"${t.quote}"',
                style: QVTheme.body(color: QVTheme.offWhite).copyWith(fontSize: 14),
                maxLines: 4, overflow: TextOverflow.ellipsis),
            const Spacer(),
            Row(children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  gradient: QVTheme.tealGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(t.name[0], style: QVTheme.h4().copyWith(fontSize: 16, color: QVTheme.navyDeep)),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.name, style: QVTheme.body().copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
                  Text('${t.role} @ ${t.company}', style: QVTheme.bodySmall(color: QVTheme.teal)),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

// ─── Trainers ──────────────────────────────────────────────────────────────────
class _TrainersSection extends StatelessWidget {
  const _TrainersSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          const SectionHeader(
            label: 'YOUR MENTORS',
            title: 'Learn From Engineers\nWho\'ve Done It',
          ),
          const SizedBox(height: 48),
          isMobile
              ? Column(
                  children: QVData.trainers.map((t) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _TrainerCard(trainer: t),
                  )).toList(),
                )
              : Row(
                  children: QVData.trainers.map((t) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _TrainerCard(trainer: t),
                    ),
                  )).toList(),
                ),
        ],
      ),
    );
  }
}

class _TrainerCard extends StatelessWidget {
  final Trainer trainer;
  const _TrainerCard({required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(
                gradient: QVTheme.tealGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(trainer.name[0],
                    style: QVTheme.display2().copyWith(fontSize: 26, color: QVTheme.navyDeep)),
              ),
            ),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(trainer.name, style: QVTheme.h4()),
              Text(trainer.title, style: QVTheme.bodySmall(color: QVTheme.teal)),
              Text('${trainer.yearsExp}+ years experience', style: QVTheme.bodySmall()),
            ]),
          ]),
          const SizedBox(height: 16),
          Text(trainer.bio, style: QVTheme.bodySmall()),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8, runSpacing: 6,
            children: trainer.expertise.map((e) => TechTag(label: e)).toList(),
          ),
        ],
      ),
    );
  }
}

// ─── FAQ ───────────────────────────────────────────────────────────────────────
class _FAQSection extends StatelessWidget {
  const _FAQSection();

  static const faqs = [
    ('Who is this for?', 'Perfect for freshers, career changers, and working professionals looking to transition into DevOps or upskill. No prior DevOps experience needed — just basic programming/Linux knowledge.'),
    ('What makes Quantum Vector different?', 'We combine real production projects, AI-powered tooling curriculum (Claude AI, MCP, Agentic AI), 1:1 mentorship from senior engineers, and strong placement support. Not just video lectures.'),
    ('How long is the program?', 'The flagship AWS DevOps course is 2-3 months of live sessions (1 hour/day). Workshops are intensive 2-day or 4-week formats. All sessions are recorded for lifetime access.'),
    ('Do you help with job placement?', 'Yes — resume writing, LinkedIn profile optimization, mock technical interviews, and referrals to our hiring partner network (50+ companies). 85% placement rate within 90 days.'),
    ('What if I fall behind?', 'All sessions are recorded. You can rewatch anytime. Mentors are available on WhatsApp for doubts. We work at your pace without leaving anyone behind.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      color: QVTheme.cardBg.withOpacity(0.2),
      child: Column(
        children: [
          const SectionHeader(
            label: 'FAQ',
            title: 'Questions?\nWe\'ve Got Answers.',
          ),
          const SizedBox(height: 48),
          ...faqs.map((f) => _FAQItem(q: f.$1, a: f.$2)),
        ],
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String q;
  final String a;
  const _FAQItem({required this.q, required this.a});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: QVTheme.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _open ? QVTheme.teal.withOpacity(0.4) : QVTheme.cardBorder),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Expanded(child: Text(widget.q, style: QVTheme.h4().copyWith(fontSize: 17))),
                  AnimatedRotation(
                    turns: _open ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down, color: QVTheme.teal),
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: _open
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                      child: Text(widget.a, style: QVTheme.body(color: QVTheme.textMuted)),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CTA ───────────────────────────────────────────────────────────────────────
class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [QVTheme.teal.withOpacity(0.15), QVTheme.navy, QVTheme.orange.withOpacity(0.1)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: QVTheme.teal.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text('Ready to Transform\nYour Career?',
              style: QVTheme.display2(), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text('Join 2000+ engineers who chose Quantum Vector.\nYour DevOps job is 90 days away.',
              style: QVTheme.body(color: QVTheme.textMuted), textAlign: TextAlign.center),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QVButton(
                label: 'Start Your Journey →',
                onTap: () => context.go('/courses'),
              ),
              const SizedBox(width: 16),
              QVButton(
                label: 'Contact Us',
                onTap: () => context.go('/about'),
                variant: ButtonVariant.outline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Grid Background Painter ───────────────────────────────────────────────────
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = QVTheme.teal.withOpacity(0.04)
      ..strokeWidth = 1;

    const step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
