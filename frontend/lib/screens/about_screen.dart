import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../models/data.dart';
import '../widgets/shared.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          _AboutHero(),
          _MissionSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
            child: const Column(
              children: [
                _TrainersDetailSection(),
                SizedBox(height: 80),
                _TechStackSection(),
                SizedBox(height: 80),
                _StatsSection(),
                SizedBox(height: 80),
                _OfficeSection(),
              ],
            ),
          ),
          const QVFooter(),
        ],
      ),
    );
  }
}

class _AboutHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(isMobile ? 24 : 80, 120, isMobile ? 24 : 80, 80),
      decoration: const BoxDecoration(gradient: QVTheme.heroGradient),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: QVTheme.glassBg,
              border: Border.all(color: QVTheme.teal.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('// ABOUT QUANTUM VECTOR', style: QVTheme.label()),
          ),
          const SizedBox(height: 24),
          Text('Where Engineers Grow,\nInnovate & Lead',
              style: QVTheme.display1().copyWith(fontSize: 54),
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          SizedBox(
            width: 640,
            child: Text(
              'We believe DevOps isn\'t just a skill — it\'s a mindset. Our mission is to empower engineers from all backgrounds to master the tools, practices, and culture that drive world-class software delivery.',
              style: QVTheme.body(color: QVTheme.textMuted),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
      color: QVTheme.cardBg.withOpacity(0.2),
      child: Column(
        children: [
          const SectionHeader(
            label: 'OUR MISSION',
            title: 'Why We Exist',
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: isMobile ? 2 : 1.5,
            children: const [
              _MissionCard(
                icon: Icons.precision_manufacturing,
                title: 'Industry-Aligned',
                desc: 'The tech industry evolves fast. Traditional degrees don\'t cut it. We fill the gap with job-market-aligned training built by real engineers.',
              ),
              _MissionCard(
                icon: Icons.groups,
                title: 'Community First',
                desc: 'We\'re not just an educational platform — we\'re a movement building a strong, inclusive community of DevOps practitioners and leaders.',
              ),
              _MissionCard(
                icon: Icons.rocket_launch,
                title: 'Real Outcomes',
                desc: 'Every decision — curriculum, projects, mentorship — is designed with one goal: your first DevOps job offer within 90 days.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _MissionCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              gradient: QVTheme.tealGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: QVTheme.navyDeep, size: 24),
          ),
          const SizedBox(height: 16),
          Text(title, style: QVTheme.h4()),
          const SizedBox(height: 8),
          Text(desc, style: QVTheme.bodySmall()),
        ],
      ),
    );
  }
}

class _TrainersDetailSection extends StatelessWidget {
  const _TrainersDetailSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Column(
      children: [
        const SectionHeader(
          label: 'THE TEAM',
          title: 'Your Expert Mentors',
          center: false,
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(children: QVData.trainers.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _TrainerDetailCard(trainer: t),
              )).toList())
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: QVData.trainers
                    .map((t) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _TrainerDetailCard(trainer: t),
                          ),
                        ))
                    .toList(),
              ),
      ],
    );
  }
}

class _TrainerDetailCard extends StatelessWidget {
  final Trainer trainer;
  const _TrainerDetailCard({required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + name
          Row(children: [
            Container(
              width: 72, height: 72,
              decoration: BoxDecoration(
                gradient: QVTheme.tealGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(trainer.name[0],
                    style: QVTheme.display2().copyWith(fontSize: 30, color: QVTheme.navyDeep)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trainer.name, style: QVTheme.h3().copyWith(fontSize: 24)),
                  Text(trainer.title, style: QVTheme.bodySmall(color: QVTheme.teal)),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: QVTheme.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: QVTheme.orange.withOpacity(0.3)),
                    ),
                    child: Text('${trainer.yearsExp}+ years',
                        style: QVTheme.label(color: QVTheme.orange)),
                  ),
                ],
              ),
            ),
          ]),
          const SizedBox(height: 20),
          Text(trainer.bio, style: QVTheme.body(color: QVTheme.textMuted)),
          const SizedBox(height: 20),
          Text('Expertise', style: QVTheme.label()),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8, runSpacing: 6,
            children: trainer.expertise.map((e) => TechTag(label: e)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TechStackSection extends StatelessWidget {
  const _TechStackSection();

  static const stack = [
    '☸️ Kubernetes', '☁️ AWS EKS', '🐳 Docker', '🔄 GitHub Actions',
    '🏗️ Terraform', '⛵ Helm 3', '🚀 ArgoCD', '📊 Prometheus',
    '📈 Grafana', '🔒 Vault', '🐧 Linux (AL2023)', '🤖 Claude AI',
    '🔗 MCP Protocol', '🐍 Python', '⚙️ Jenkins', '🦊 GitLab CI',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'TECH STACK',
          title: 'Technologies We Teach',
          center: false,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: stack.map((t) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: QVTheme.cardBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: QVTheme.cardBorder),
            ),
            child: Text(t, style: QVTheme.body().copyWith(fontSize: 13)),
          )).toList(),
        ),
      ],
    );
  }
}

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(label: 'BY THE NUMBERS', title: 'Our Impact'),
        const SizedBox(height: 40),
        StatsBar(stats: QVData.stats),
      ],
    );
  }
}

class _OfficeSection extends StatelessWidget {
  const _OfficeSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'LOCATION',
          title: 'Visit Our Office',
          center: false,
        ),
        const SizedBox(height: 32),
        GlassCard(
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactBlock(),
                    const SizedBox(height: 24),
                    _SocialBlock(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactBlock()),
                    const SizedBox(width: 60),
                    Expanded(child: _SocialBlock()),
                  ],
                ),
        ),
      ],
    );
  }
}

class _ContactBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hyderabad Office', style: QVTheme.h4()),
        const SizedBox(height: 12),
        Text(
          'Flat No.403, Nandini Residency\n15/A Addagutta Society – HMT Hills Rd\nnear JNTU, Addagutta Society\nKukatpally, Hyderabad, Telangana 500085',
          style: QVTheme.body(color: QVTheme.textMuted),
        ),
        const SizedBox(height: 16),
        Row(children: [
          const Icon(Icons.email_outlined, color: QVTheme.teal, size: 16),
          const SizedBox(width: 8),
          Text('hr@quantumvector.sh', style: QVTheme.body(color: QVTheme.teal)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          const Icon(Icons.language, color: QVTheme.teal, size: 16),
          const SizedBox(width: 8),
          Text('quantumvector.sh', style: QVTheme.body(color: QVTheme.teal)),
        ]),
      ],
    );
  }
}

class _SocialBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Follow Us', style: QVTheme.h4()),
        const SizedBox(height: 16),
        _SocialTile(
          icon: Icons.camera_alt_outlined,
          platform: 'Instagram',
          handle: '@devops__community',
          color: QVTheme.orange,
        ),
        const SizedBox(height: 12),
        _SocialTile(
          icon: Icons.work_outline,
          platform: 'LinkedIn',
          handle: 'Quantum Vector',
          color: const Color(0xFF0A66C2),
        ),
        const SizedBox(height: 12),
        _SocialTile(
          icon: Icons.play_circle_outline,
          platform: 'YouTube',
          handle: 'TheDevOpsCommunity',
          color: const Color(0xFFFF0000),
        ),
        const SizedBox(height: 24),
        Text('DM us "PROJECT" on Instagram\nto get enrolled in the next cohort.',
            style: QVTheme.body(color: QVTheme.textMuted)),
      ],
    );
  }
}

class _SocialTile extends StatelessWidget {
  final IconData icon;
  final String platform;
  final String handle;
  final Color color;
  const _SocialTile({required this.icon, required this.platform, required this.handle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
      const SizedBox(width: 12),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(platform, style: QVTheme.body().copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
        Text(handle, style: QVTheme.bodySmall()),
      ]),
    ]);
  }
}
