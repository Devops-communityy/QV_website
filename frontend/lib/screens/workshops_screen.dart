import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/qv_theme.dart';
import '../models/data.dart';
import '../widgets/shared.dart';

class WorkshopsScreen extends StatelessWidget {
  const WorkshopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
                isMobile ? 24 : 80, 120, isMobile ? 24 : 80, 60),
            decoration: const BoxDecoration(gradient: QVTheme.heroGradient),
            child: const SectionHeader(
              label: 'LIVE WORKSHOPS',
              title: 'Hands-On. Live. \nIntensive.',
              subtitle:
                  '2-day and 4-week bootcamps to get you building real projects fast.',
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upcoming label
                Row(children: [
                  Container(
                    width: 8, height: 8,
                    decoration: const BoxDecoration(
                        color: QVTheme.orange, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  Text('Upcoming Workshops',
                      style: QVTheme.h4(color: QVTheme.orange)),
                ]),
                const SizedBox(height: 24),
                ...QVData.workshops.map((w) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _WorkshopCard(workshop: w),
                )),
                const SizedBox(height: 40),
                const _WorkshopWhatYouLearn(),
                const SizedBox(height: 60),
                const _PastBatchesSection(),
              ],
            ),
          ),
          const QVFooter(),
        ],
      ),
    );
  }
}

class _WorkshopCard extends StatelessWidget {
  final Workshop workshop;
  const _WorkshopCard({required this.workshop});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return GlassCard(
      hoverable: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      TechTag(label: '⚡ LIVE ONLINE', color: QVTheme.orange),
                      const SizedBox(width: 8),
                      TechTag(label: workshop.duration, color: QVTheme.teal),
                    ]),
                    const SizedBox(height: 14),
                    Text(workshop.title, style: QVTheme.display2().copyWith(fontSize: 30)),
                    Text(workshop.subtitle, style: QVTheme.body(color: QVTheme.orange)),
                    const SizedBox(height: 10),
                    Text(workshop.description, style: QVTheme.body(color: QVTheme.textMuted)),
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 40),
                _WorkshopPricePanel(workshop: workshop),
              ],
            ],
          ),
          const SizedBox(height: 24),
          // Schedule
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: QVTheme.navyDeep,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: QVTheme.cardBorder),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 8,
              children: [
                _ScheduleItem(icon: Icons.calendar_today, label: workshop.date),
                _ScheduleItem(icon: Icons.access_time, label: workshop.time),
                _ScheduleItem(icon: Icons.laptop, label: workshop.mode),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Topics
          Text('What You\'ll Build:', style: QVTheme.h4().copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          ...workshop.topics.map((t) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(children: [
              const Icon(Icons.chevron_right, color: QVTheme.teal, size: 16),
              const SizedBox(width: 8),
              Text(t, style: QVTheme.bodySmall()),
            ]),
          )),
          if (isMobile) ...[
            const SizedBox(height: 20),
            _WorkshopPricePanel(workshop: workshop, mobile: true),
          ],
        ],
      ),
    );
  }
}

class _WorkshopPricePanel extends StatelessWidget {
  final Workshop workshop;
  final bool mobile;
  const _WorkshopPricePanel({required this.workshop, this.mobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [QVTheme.orange.withOpacity(0.15), QVTheme.navyDeep],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.orange.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(workshop.price,
              style: QVTheme.display2().copyWith(fontSize: 34, color: QVTheme.orange)),
          Text('One-Time Fee', style: QVTheme.bodySmall()),
          const SizedBox(height: 20),
          QVButton(
            label: 'Register Now →',
            onTap: () async {
              final uri = Uri.parse(workshop.registrationUrl);
              if (await canLaunchUrl(uri)) launchUrl(uri);
            },
            variant: ButtonVariant.orange,
            fullWidth: true,
          ),
          const SizedBox(height: 8),
          Text('⚡ Limited seats', style: QVTheme.bodySmall(color: QVTheme.orange)),
        ],
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ScheduleItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: QVTheme.teal, size: 14),
        const SizedBox(width: 6),
        Text(label, style: QVTheme.bodySmall(color: QVTheme.offWhite)),
      ],
    );
  }
}

class _WorkshopWhatYouLearn extends StatelessWidget {
  const _WorkshopWhatYouLearn();

  static const curriculum = [
    ('Docker & Containers', 'Images, Volumes, Networks, Docker Compose, Registry push', '🐳'),
    ('Kubernetes (kubeadm)', 'Cluster setup on AL2023, Calico CNI, Deployments, Services', '☸️'),
    ('Amazon EKS', 'Provisioning with eksctl, node groups, IAM IRSA, ALB Ingress', '☁️'),
    ('CI/CD Pipelines', 'GitHub Actions workflows, Docker build & push, EKS deploy', '🔄'),
    ('Observability', 'Prometheus + Grafana setup, Dashboards, Slack Alerting', '📊'),
    ('Helm 3', 'Chart creation, values files, repository management', '⛵'),
    ('ArgoCD & GitOps', 'App of Apps pattern, sync policies, rollback', '🚀'),
    ('AI in DevOps', 'Claude AI for configs, debugging, and MCP integration', '🤖'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'CURRICULUM',
          title: 'Full Workshop Curriculum',
          center: false,
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: isMobile ? 3 : 3.5,
          children: curriculum.map((c) => GlassCard(
            hoverable: true,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(c.$3, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(c.$1, style: QVTheme.h4().copyWith(fontSize: 15)),
                      Text(c.$2, style: QVTheme.bodySmall(), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }
}

class _PastBatchesSection extends StatelessWidget {
  const _PastBatchesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'PAST BATCHES',
          title: 'Trusted by Engineers\nAcross India',
          center: false,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _BatchBadge('QV101', 'AWS DevOps', true),
            _BatchBadge('QV102', 'Docker + K8s', true),
            _BatchBadge('QV103', 'EKS + Observability', true),
            _BatchBadge('QV104', 'AI DevSecOps', true),
            _BatchBadge('QV105', 'Docker + K8s + Obs', false),
          ],
        ),
      ],
    );
  }
}

class _BatchBadge extends StatelessWidget {
  final String batch;
  final String title;
  final bool completed;
  const _BatchBadge(this.batch, this.title, this.completed);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: completed ? QVTheme.cardBg : QVTheme.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: completed ? QVTheme.cardBorder : QVTheme.teal.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(batch, style: QVTheme.label(color: completed ? QVTheme.textMuted : QVTheme.teal)),
          Text(title, style: QVTheme.bodySmall(color: completed ? QVTheme.offWhite : QVTheme.teal)),
          if (!completed) Text('● Ongoing', style: QVTheme.label(color: QVTheme.teal).copyWith(fontSize: 10)),
        ],
      ),
    );
  }
}
