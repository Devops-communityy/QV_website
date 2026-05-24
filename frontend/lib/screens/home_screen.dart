// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
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
          StatsBar(stats: const {
            '2000+': 'Engineers Trained',
            '85%': 'Placement Rate',
            '10+': 'Years Experience',
            '4': 'Real Projects',
          }),
          const _CoursesTrackSection(),
          const _WebinarBannerSection(),
          const _WhyQVSection(),
          const _TestimonialsSection(),
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
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
          isMobile ? 24 : 80, 100, isMobile ? 24 : 80, 60),
      child: isMobile ? const _HeroMobile() : const _HeroDesktop(),
    );
  }
}

class _HeroDesktop extends StatelessWidget {
  const _HeroDesktop();

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: QVTheme.tealBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: QVTheme.tealBorder),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 7, height: 7,
                      decoration: const BoxDecoration(color: QVTheme.tealMid, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text('AI & DEVOPS TRAINING PLATFORM', style: QVTheme.label()),
                ]),
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),
              const SizedBox(height: 22),
              Text('Land Your DevOps\nJob in 90 Days',
                  style: QVTheme.display1()).animate().fadeIn(delay: 400.ms),
              const SizedBox(height: 6),
              Text('Guaranteed Results.',
                  style: QVTheme.display1(color: QVTheme.tealMid)
                      .copyWith(fontSize: 44)).animate().fadeIn(delay: 600.ms),
              const SizedBox(height: 18),
              Text(
                'From Zero to Job-Ready — Join 2000+ engineers who transformed\ntheir careers with our intensive, mentor-led programs.',
                style: QVTheme.body(),
              ).animate().fadeIn(delay: 800.ms),
              const SizedBox(height: 32),
              Row(children: [
                QVButton(label: 'Explore Courses →',
                    onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); }),
                const SizedBox(width: 14),
                QVButton(label: 'View Webinars',
                    onTap: () => context.go('/webinars'),
                    variant: ButtonVariant.outline),
              ]).animate().fadeIn(delay: 1000.ms),
              const SizedBox(height: 32),
              Row(children: [
                _TrustPill('2000+ Engineers'),
                const SizedBox(width: 20),
                _TrustPill('85% Placed'),
                const SizedBox(width: 20),
                _TrustPill('4.9 Rating'),
              ]),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: const _TerminalWidget()
              .animate().fadeIn(delay: 600.ms).slideX(begin: 0.3),
        ),
      ],
    );
  }
}

class _HeroMobile extends StatelessWidget {
  const _HeroMobile();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: QVTheme.tealBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: QVTheme.tealBorder),
          ),
          child: Text('AI & DEVOPS TRAINING PLATFORM', style: QVTheme.label()),
        ),
        const SizedBox(height: 18),
        Text('Land Your DevOps\nJob in 90 Days', style: QVTheme.display2()),
        const SizedBox(height: 8),
        Text('Guaranteed Results.', style: QVTheme.h3(color: QVTheme.tealMid)),
        const SizedBox(height: 14),
        Text('Join 2000+ engineers who transformed their careers.',
            style: QVTheme.body()),
        const SizedBox(height: 24),
        QVButton(label: 'Explore Courses →',
            onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); }, fullWidth: true),
        const SizedBox(height: 10),
        QVButton(label: 'View Webinars',
            onTap: () => context.go('/webinars'),
            variant: ButtonVariant.outline, fullWidth: true),
      ],
    );
  }
}

Widget _TrustPill(String label) => Row(children: [
  const Icon(Icons.check_circle_outline, color: QVTheme.tealMid, size: 14),
  const SizedBox(width: 5),
  Text(label, style: QVTheme.bodySmall()),
]);

// ─── Terminal ─────────────────────────────────────────────────────────────────
class _TerminalWidget extends StatelessWidget {
  const _TerminalWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E2D4A)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF111D35),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(bottom: BorderSide(color: Color(0xFF1E2D4A))),
            ),
            child: Row(children: [
              _Dot(const Color(0xFFFF5F57)),
              const SizedBox(width: 5),
              _Dot(const Color(0xFFFFBD2E)),
              const SizedBox(width: 5),
              _Dot(const Color(0xFF28CA41)),
              const SizedBox(width: 14),
              Text('devops-career.sh',
                  style: QVTheme.mono(color: const Color(0xFF8896B3))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TLine('# Your journey starts here', isComment: true),
                _TLine(''),
                _TLine('> student init --goal "DevOps Job"'),
                _TLine(''),
                _TSuccess('✓ Linux & Shell Scripting'),
                _TSuccess('✓ Docker & Kubernetes on EKS'),
                _TSuccess('✓ CI/CD · Terraform · ArgoCD'),
                _TSuccess('✓ AI-Powered DevSecOps'),
                _TLine(''),
                _TLine('> student init --goal "AI Engineer"'),
                _TLine(''),
                _TAi('✓ Python · LLMs · RAG · Agents'),
                _TAi('✓ LangChain · LangGraph · MCP'),
                _TLine(''),
                _TLine('> deploy --resume --offer'),
                _TLine(''),
                _TOrange('🎉 Offer: ₹12 LPA @ TCS'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _Dot(Color c) =>
      Container(width: 10, height: 10, decoration: BoxDecoration(color: c, shape: BoxShape.circle));

  Widget _TLine(String t, {bool isComment = false}) => Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Text(t.isEmpty ? '' : t,
        style: QVTheme.mono(
            color: isComment ? const Color(0xFF8896B3) : const Color(0xFFF0F4FF),
            size: 12)),
  );

  Widget _TSuccess(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Text(t, style: QVTheme.mono(color: const Color(0xFF00D4C8), size: 12)),
  );

  Widget _TAi(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Text(t, style: QVTheme.mono(color: const Color(0xFFAFA9EC), size: 12)),
  );

  Widget _TOrange(String t) => Text(t,
      style: QVTheme.mono(color: const Color(0xFFFF8C42), size: 12));
}

// ─── Course Tracks ────────────────────────────────────────────────────────────
class _CoursesTrackSection extends StatelessWidget {
  const _CoursesTrackSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            label: 'CHOOSE YOUR TRACK',
            title: 'Two Job-Ready Programs',
            subtitle: 'DevOps on AWS or AI & LLM Engineering — both with live classes and real projects.',
          ),
          const SizedBox(height: 36),
          isMobile
              ? Column(children: [
                  _TrackCard(
                    tag: 'AWS DEVOPS', tagColor: QVTheme.tealMid,
                    title: 'Complete AWS DevOps Course',
                    subtitle: '2–3 Months · Online & Hyderabad',
                    desc: 'Linux → Docker → Kubernetes → AWS → Terraform → CI/CD. 4 production-grade projects.',
                    price: '₹22,000', priceSub: 'Pay ₹3,000 to enroll',
                    tags: ['Linux', 'Docker', 'Kubernetes', 'AWS', 'Terraform'],
                    accentColor: QVTheme.tealMid,
                    onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); },
                  ),
                  const SizedBox(height: 16),
                  _TrackCard(
                    tag: 'AI + LLM', tagColor: QVTheme.purple,
                    title: 'AI & LLM Engineering Bootcamp',
                    subtitle: '45 Days · Mon–Fri · 8:30–9:30 AM IST',
                    desc: 'Python → LLMs → RAG → Agents → LangGraph → MCP. 8 production AI projects.',
                    price: '₹29,999', priceSub: 'Was ₹39,999',
                    tags: ['Python', 'LLMs', 'RAG', 'LangChain', 'MCP'],
                    accentColor: QVTheme.purple,
                    onTap: () => context.go('/courses/ai-llm-bootcamp'),
                  ),
                ])
              : Row(children: [
                  Expanded(child: _TrackCard(
                    tag: 'AWS DEVOPS', tagColor: QVTheme.tealMid,
                    title: 'Complete AWS DevOps Course',
                    subtitle: '2–3 Months · Online & Hyderabad',
                    desc: 'Linux → Docker → Kubernetes → AWS → Terraform → CI/CD. 4 production-grade projects.',
                    price: '₹22,000', priceSub: 'Pay ₹3,000 to enroll',
                    tags: ['Linux', 'Docker', 'Kubernetes', 'AWS', 'Terraform'],
                    accentColor: QVTheme.tealMid,
                    onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); },
                  )),
                  const SizedBox(width: 20),
                  Expanded(child: _TrackCard(
                    tag: 'AI + LLM', tagColor: QVTheme.purple,
                    title: 'AI & LLM Engineering Bootcamp',
                    subtitle: '45 Days · Mon–Fri · 8:30–9:30 AM IST',
                    desc: 'Python → LLMs → RAG → Agents → LangGraph → MCP. 8 production AI projects.',
                    price: '₹29,999', priceSub: 'Was ₹39,999',
                    tags: ['Python', 'LLMs', 'RAG', 'LangChain', 'MCP'],
                    accentColor: QVTheme.purple,
                    onTap: () => context.go('/courses/ai-llm-bootcamp'),
                  )),
                ]),
        ],
      ),
    );
  }
}

class _TrackCard extends StatefulWidget {
  final String tag, title, subtitle, desc, price, priceSub;
  final List<String> tags;
  final Color tagColor, accentColor;
  final VoidCallback onTap;
  const _TrackCard({
    required this.tag, required this.tagColor, required this.title,
    required this.subtitle, required this.desc, required this.price,
    required this.priceSub, required this.tags, required this.accentColor,
    required this.onTap,
  });
  @override State<_TrackCard> createState() => _TrackCardState();
}
class _TrackCardState extends State<_TrackCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hover ? widget.accentColor : QVTheme.border,
              width: _hover ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TechTag(label: widget.tag, color: widget.tagColor),
              const SizedBox(height: 14),
              Text(widget.title, style: QVTheme.h4()),
              const SizedBox(height: 4),
              Text(widget.subtitle,
                  style: QVTheme.bodySmall(color: widget.accentColor)),
              const SizedBox(height: 10),
              Text(widget.desc, style: QVTheme.bodySmall()),
              const SizedBox(height: 16),
              Wrap(spacing: 6, runSpacing: 6,
                  children: widget.tags.map((t) =>
                      TechTag(label: t, color: widget.tagColor)).toList()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(widget.price,
                        style: QVTheme.h3(color: widget.accentColor)
                            .copyWith(fontSize: 22)),
                    Text(widget.priceSub, style: QVTheme.bodySmall()),
                  ]),
                  QVButton(
                    label: 'View Details →',
                    onTap: widget.onTap,
                    small: true,
                    variant: widget.accentColor == QVTheme.purple
                        ? ButtonVariant.purple : ButtonVariant.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Webinar Banner ───────────────────────────────────────────────────────────
class _WebinarBannerSection extends StatelessWidget {
  const _WebinarBannerSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: QVTheme.bgSurface,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'UPCOMING WEBINAR',
            title: 'AI-Ready DevSecOps\nLive Project on EKS',
            center: false,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: QVTheme.orangeBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: QVTheme.orangeBorder),
            ),
            child: isMobile
                ? _WebinarBannerMobile()
                : _WebinarBannerDesktop(),
          ),
        ],
      ),
    );
  }
}

class _WebinarBannerDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              TechTag(label: 'UPCOMING', color: QVTheme.orange),
              const SizedBox(width: 8),
              TechTag(label: 'LIMITED SEATS'),
            ]),
            const SizedBox(height: 14),
            Text('Build a Production-Grade AI-Augmented DevSecOps Pipeline on AWS EKS',
                style: QVTheme.h4()),
            const SizedBox(height: 8),
            Text('Real Systems. Real Security. Real Deployment. AI at every security checkpoint.',
                style: QVTheme.body()),
            const SizedBox(height: 14),
            Row(children: [
              const Icon(Icons.calendar_today, size: 13, color: QVTheme.tealMid),
              const SizedBox(width: 6),
              Text('9 & 10 May 2026', style: QVTheme.bodySmall()),
              const SizedBox(width: 20),
              const Icon(Icons.access_time, size: 13, color: QVTheme.tealMid),
              const SizedBox(width: 6),
              Text('7:00 PM – 10:00 PM IST', style: QVTheme.bodySmall()),
            ]),
          ],
        )),
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('₹2,249', style: QVTheme.h3(color: QVTheme.orange)
                .copyWith(fontSize: 30, letterSpacing: -1)),
            Text('₹2,499', style: QVTheme.bodySmall()
                .copyWith(decoration: TextDecoration.lineThrough)),
            const SizedBox(height: 14),
            QVButton(label: 'Register Now →',
                onTap: () => context.go('/webinars'),
                variant: ButtonVariant.orange),
            const SizedBox(height: 6),
            Text('Offer valid till 28 Apr',
                style: QVTheme.bodySmall(color: QVTheme.orange)),
          ],
        ),
      ],
    );
  }
}

class _WebinarBannerMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechTag(label: 'UPCOMING', color: QVTheme.orange),
        const SizedBox(height: 12),
        Text('AI-Ready DevSecOps Live Project on EKS', style: QVTheme.h4()),
        const SizedBox(height: 8),
        Text('₹2,249', style: QVTheme.h3(color: QVTheme.orange)
            .copyWith(fontSize: 26, letterSpacing: -1)),
        Text('₹2,499', style: QVTheme.bodySmall()
            .copyWith(decoration: TextDecoration.lineThrough)),
        const SizedBox(height: 14),
        QVButton(label: 'Register Now →',
            onTap: () => context.go('/webinars'),
            variant: ButtonVariant.orange, fullWidth: true),
      ],
    );
  }
}

// ─── Why QV ───────────────────────────────────────────────────────────────────
class _WhyQVSection extends StatelessWidget {
  const _WhyQVSection();

  static const features = [
    (Icons.code, 'Real-World Projects', 'Build production-grade applications that go directly on your resume.', QVTheme.tealMid),
    (Icons.work_outline, 'Career Support', 'Resume & LinkedIn optimization, mock interviews, and placement referrals.', QVTheme.orange),
    (Icons.psychology, 'Expert Mentorship', '1:1 guidance from senior engineers with 10–13 years of industry experience.', QVTheme.tealMid),
    (Icons.smart_toy, 'AI-Integrated Curriculum', 'Learn Claude AI, MCP, and agentic DevOps workflows — not just theory.', QVTheme.purple),
    (Icons.people_outline, 'Community Access', '2000+ engineers on WhatsApp & Discord. Alumni share job leads actively.', QVTheme.tealMid),
    (Icons.replay, 'Lifetime Access', 'All recordings, materials, and future curriculum updates. Never expires.', QVTheme.orange),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            label: 'WHY QUANTUM VECTOR',
            title: 'Not Just Training.\nA Career Launch Pad.',
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: isMobile ? 3.5 : 1.6,
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
  final String title, desc;
  final Color color;
  const _FeatureCard({required this.icon, required this.title,
    required this.desc, required this.color});

  Color get _bg => color == QVTheme.orange ? QVTheme.orangeBg
      : color == QVTheme.purple ? QVTheme.purpleBg : QVTheme.tealBg;

  @override
  Widget build(BuildContext context) {
    return GlassCard(hoverable: true, child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: _bg, borderRadius: BorderRadius.circular(9)),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 12),
        Text(title, style: QVTheme.h4().copyWith(fontSize: 15)),
        const SizedBox(height: 6),
        Text(desc, style: QVTheme.bodySmall()),
      ],
    ));
  }
}

// ─── Testimonials ─────────────────────────────────────────────────────────────
class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  static const testimonials = [
    ('Ravi', 'Capgemini', 'Switched from QA to DevOps in just a few months. The mentors were always available!'),
    ('Priya', 'Infosys', 'Real projects made the difference. Landed my first DevOps job at Infosys!'),
    ('Sandeep', 'TCS', 'Resume help was a game changer. Got 3 MNC interviews in a month.'),
    ('Anjali', 'Cognizant', 'Mock interviews gave me confidence to ace my Azure DevOps interview.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: QVTheme.bgSurface,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(label: 'SUCCESS STORIES', title: 'What Our Alumni Say'),
          const SizedBox(height: 36),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 4,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: isMobile ? 2.5 : 1.1,
            children: testimonials.map((t) => _TestiCard(
              name: t.$1, company: t.$2, quote: t.$3,
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _TestiCard extends StatelessWidget {
  final String name, company, quote;
  const _TestiCard({required this.name, required this.company, required this.quote});

  @override
  Widget build(BuildContext context) {
    return GlassCard(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: List.generate(5, (_) =>
            const Icon(Icons.star, color: Color(0xFFBA7517), size: 13))),
        const SizedBox(height: 10),
        Expanded(child: Text('"$quote"',
            style: QVTheme.bodySmall().copyWith(fontStyle: FontStyle.italic))),
        const SizedBox(height: 12),
        Row(children: [
          Container(
            width: 30, height: 30,
            decoration: BoxDecoration(color: QVTheme.tealBg, shape: BoxShape.circle),
            child: Center(child: Text(name[0],
                style: QVTheme.bodySmall(color: QVTheme.tealMid)
                    .copyWith(fontWeight: FontWeight.w700))),
          ),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: QVTheme.bodySmall(color: QVTheme.txtPrimary)
                .copyWith(fontWeight: FontWeight.w700)),
            Text(company, style: QVTheme.bodySmall(color: QVTheme.tealMid)),
          ]),
        ]),
      ],
    ));
  }
}

// ─── FAQ ─────────────────────────────────────────────────────────────────────
class _FAQSection extends StatelessWidget {
  const _FAQSection();

  static const faqs = [
    ('Who is this program for?',
     'Perfect for freshers, career changers, and professionals looking to transition into DevOps or AI engineering. No prior experience needed.'),
    ('What makes DCLP different?',
     'We combine real production projects, AI-powered curriculum (Claude AI, MCP), 1:1 mentorship from senior engineers, and strong placement support — not just video lectures.'),
    ('How long is the program?',
     'The AWS DevOps course is 2–3 months (1 hr/day). The AI & LLM Bootcamp is 45 days Mon–Fri. All sessions are recorded for lifetime access.'),
    ('Do you help with job placement?',
     'Yes — resume writing, LinkedIn optimization, mock technical interviews, and referrals to 50+ hiring partners. 85% placement rate within 90 days.'),
    ('What if I cannot keep up?',
     'All sessions are recorded. Mentors are available on WhatsApp for doubts. We work at your pace — no one gets left behind.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(label: 'FAQ', title: 'Questions? We\'ve Got Answers.'),
          const SizedBox(height: 36),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              children: faqs.map((f) => _FAQItem(q: f.$1, a: f.$2)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String q, a;
  const _FAQItem({required this.q, required this.a});
  @override State<_FAQItem> createState() => _FAQItemState();
}
class _FAQItemState extends State<_FAQItem> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: _open ? QVTheme.tealBg : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _open ? QVTheme.tealBorder : QVTheme.border),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(children: [
              Expanded(child: Text(widget.q,
                  style: QVTheme.body(color: QVTheme.txtPrimary)
                      .copyWith(fontWeight: FontWeight.w600))),
              AnimatedRotation(
                turns: _open ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.keyboard_arrow_down,
                    color: QVTheme.tealMid),
              ),
            ]),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: _open
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: Text(widget.a, style: QVTheme.body()))
                : const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }
}

// ─── CTA ─────────────────────────────────────────────────────────────────────
class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 40),
      padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 32),
      decoration: BoxDecoration(
        color: QVTheme.tealBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: QVTheme.tealBorder),
      ),
      child: Column(children: [
        Text('Ready to Transform Your Career?',
            style: QVTheme.display2(), textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text('Join 2000+ engineers. Pick your track and start today.',
            style: QVTheme.body(), textAlign: TextAlign.center),
        const SizedBox(height: 28),
        Wrap(alignment: WrapAlignment.center, spacing: 12, runSpacing: 10, children: [
          QVButton(label: 'AWS DevOps Track →',
              onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); }),
          QVButton(label: 'AI & LLM Track →',
              onTap: () => context.go('/courses/ai-llm-bootcamp'),
              variant: ButtonVariant.purple),
        ]),
      ]),
    );
  }
}
