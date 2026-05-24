import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../widgets/shared.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          _Hero(),
          _MissionSection(isMobile: isMobile),
          _TrainersSection(isMobile: isMobile),
          _TechStackSection(isMobile: isMobile),
          _OfficeSection(isMobile: isMobile),
          const QVFooter(),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: QVTheme.bgSurface,
      padding: EdgeInsets.fromLTRB(
          isMobile ? 24 : 80, 110, isMobile ? 24 : 80, 60),
      child: Column(
        children: [
          const SectionHeader(
            label: 'ABOUT QUANTUM VECTOR',
            title: 'Where Engineers Grow,\nInnovate & Lead',
            subtitle: 'We believe DevOps isn\'t just a skill — it\'s a mindset. Our mission is to empower individuals from all backgrounds to master the tools, practices, and culture that drive world-class software delivery.',
          ),
        ],
      ),
    );
  }
}

class _MissionSection extends StatelessWidget {
  final bool isMobile;
  const _MissionSection({required this.isMobile});

  static const cards = [
    (Icons.precision_manufacturing_outlined, 'Industry-Aligned',
     'The tech industry evolves fast. Traditional degrees don\'t cut it. We fill the gap with industry-aligned, project-based training crafted by real engineers.'),
    (Icons.groups_outlined, 'Community First',
     'We\'re not just an educational platform — we\'re a movement building a strong, inclusive community of DevOps enthusiasts, practitioners, and leaders.'),
    (Icons.rocket_launch_outlined, 'Real Outcomes',
     'Every decision — curriculum, projects, mentorship — is designed with one goal: your first DevOps or AI engineering job offer within 90 days.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(label: 'OUR MISSION', title: 'Why We Exist'),
          const SizedBox(height: 36),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: isMobile ? 2.5 : 1.4,
            children: cards.map((c) => GlassCard(
              hoverable: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42, height: 42,
                    decoration: BoxDecoration(
                      color: QVTheme.tealBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(c.$1, color: QVTheme.tealMid, size: 22),
                  ),
                  const SizedBox(height: 14),
                  Text(c.$2, style: QVTheme.h4().copyWith(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(c.$3, style: QVTheme.bodySmall()),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _TrainersSection extends StatelessWidget {
  final bool isMobile;
  const _TrainersSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: QVTheme.bgSurface,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(label: 'THE TEAM', title: 'Your Expert Mentors'),
          const SizedBox(height: 36),
          isMobile
              ? Column(children: [
                  _TrainerCard(name: 'Manoj', title: 'Lead Trainer — DevOps & Cloud',
                    years: 10, bio: 'DevOps practitioner with 10+ years building and scaling cloud-native systems. Has worked with Fortune 500 companies on Kubernetes, AWS, and CI/CD transformations.',
                    tags: ['Kubernetes', 'AWS', 'CI/CD', 'Terraform', 'DevSecOps']),
                  const SizedBox(height: 16),
                  _TrainerCard(name: 'Sai', title: 'Senior Trainer — Cloud & Automation',
                    years: 13, bio: 'Cloud architect with 13+ years across GCP, AWS, and Azure. Specializes in large-scale Kubernetes deployments and DevOps cultural transformation.',
                    tags: ['Cloud Arch', 'Ansible', 'GitOps', 'Observability', 'AI/MLOps']),
                ])
              : Row(children: [
                  Expanded(child: _TrainerCard(name: 'Manoj', title: 'Lead Trainer — DevOps & Cloud',
                    years: 10, bio: 'DevOps practitioner with 10+ years building and scaling cloud-native systems. Has worked with Fortune 500 companies on Kubernetes, AWS, and CI/CD transformations.',
                    tags: ['Kubernetes', 'AWS', 'CI/CD', 'Terraform', 'DevSecOps'])),
                  const SizedBox(width: 20),
                  Expanded(child: _TrainerCard(name: 'Sai', title: 'Senior Trainer — Cloud & Automation',
                    years: 13, bio: 'Cloud architect with 13+ years across GCP, AWS, and Azure. Specializes in large-scale Kubernetes deployments and DevOps cultural transformation.',
                    tags: ['Cloud Arch', 'Ansible', 'GitOps', 'Observability', 'AI/MLOps'])),
                ]),
        ],
      ),
    );
  }
}

class _TrainerCard extends StatelessWidget {
  final String name, title, bio;
  final int years;
  final List<String> tags;
  const _TrainerCard({required this.name, required this.title, required this.years,
    required this.bio, required this.tags});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverable: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 60, height: 60,
            decoration: const BoxDecoration(color: QVTheme.tealBg, shape: BoxShape.circle),
            child: Center(child: Text(name[0], style: QVTheme.h3(color: QVTheme.tealMid)
                .copyWith(fontSize: 24))),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: QVTheme.h4()),
              Text(title, style: QVTheme.bodySmall(color: QVTheme.tealMid)),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: QVTheme.orangeBg,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: QVTheme.orangeBorder),
                ),
                child: Text('$years+ YEARS EXP',
                    style: QVTheme.label(color: QVTheme.orange)),
              ),
            ],
          )),
        ]),
        const SizedBox(height: 16),
        Text(bio, style: QVTheme.body()),
        const SizedBox(height: 14),
        Wrap(spacing: 6, runSpacing: 6,
            children: tags.map((t) => TechTag(label: t)).toList()),
      ]),
    );
  }
}

class _TechStackSection extends StatelessWidget {
  final bool isMobile;
  const _TechStackSection({required this.isMobile});

  static const stack = [
    '☸️ Kubernetes', '☁️ AWS EKS', '🐳 Docker', '🔄 GitHub Actions',
    '🏗️ Terraform', '⛵ Helm 3', '🚀 ArgoCD', '📊 Prometheus',
    '📈 Grafana', '🔒 Vault', '🐧 Linux (AL2023)', '🤖 Claude AI',
    '🔗 MCP Protocol', '🐍 Python', '⚙️ Jenkins', '🦊 GitLab CI',
    '🧠 LangChain', '📐 LangGraph', '🔍 RAG', '🗣️ Voice AI',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'TECH STACK',
            title: 'Technologies We Teach',
            center: false,
          ),
          const SizedBox(height: 28),
          Wrap(spacing: 10, runSpacing: 10,
            children: stack.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: QVTheme.border),
              ),
              child: Text(t, style: QVTheme.body().copyWith(fontSize: 13)),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _OfficeSection extends StatelessWidget {
  final bool isMobile;
  const _OfficeSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: QVTheme.bgSurface,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'LOCATION & CONTACT',
            title: 'Visit Our Office',
            center: false,
          ),
          const SizedBox(height: 28),
          GlassCard(
            child: isMobile
                ? Column(children: [_ContactInfo(), const SizedBox(height: 24), _SocialInfo()])
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ContactInfo()),
                      const SizedBox(width: 40),
                      Expanded(child: _SocialInfo()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Hyderabad Office', style: QVTheme.h4().copyWith(fontSize: 16)),
      const SizedBox(height: 12),
      Text('Flat No.403, Nandini Residency\n15/A Addagutta Society – HMT Hills Rd\nnear JNTU, Kukatpally\nHyderabad, Telangana 500085',
          style: QVTheme.body()),
      const SizedBox(height: 14),
      Row(children: [
        const Icon(Icons.email_outlined, color: QVTheme.tealMid, size: 15),
        const SizedBox(width: 7),
        Text('hr@quantumvector.sh', style: QVTheme.body(color: QVTheme.tealMid)),
      ]),
      const SizedBox(height: 6),
      Row(children: [
        const Icon(Icons.language, color: QVTheme.tealMid, size: 15),
        const SizedBox(width: 7),
        Text('quantumvector.sh', style: QVTheme.body(color: QVTheme.tealMid)),
      ]),
    ]);
  }
}

class _SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Connect With Us', style: QVTheme.h4().copyWith(fontSize: 16)),
      const SizedBox(height: 14),
      _SocialRow(Icons.camera_alt_outlined, '@devops__community'),
      const SizedBox(height: 8),
      _SocialRow(Icons.play_circle_outline, 'TheDevOpsCommunity'),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: QVTheme.tealBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.tealBorder),
        ),
        child: RichText(text: TextSpan(
          style: QVTheme.bodySmall(color: QVTheme.tealMid),
          children: const [
            TextSpan(text: 'DM '),
            TextSpan(text: '"PROJECT"',
                style: TextStyle(fontWeight: FontWeight.w700, color: QVTheme.tealMid)),
            TextSpan(text: ' on Instagram to enroll in the next cohort.'),
          ],
        )),
      ),
    ]);
  }

  Widget _SocialRow(IconData icon, String label) => Row(children: [
    Icon(icon, color: QVTheme.tealMid, size: 16),
    const SizedBox(width: 8),
    Text(label, style: QVTheme.body()),
  ]);
}
