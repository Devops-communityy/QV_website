import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../widgets/shared.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  static const List<Map<String, dynamic>> courses = [
    {
      'id': 'aws-devops',
      'tag': 'AWS DEVOPS',
      'tagColor': QVTheme.tealMid,
      'popular': true,
      'title': 'Complete AWS DevOps Course',
      'subtitle': 'Starts Apr 6, 2026 · 7:30 AM – 8:30 AM IST',
      'desc': 'Master DevOps with AWS Cloud from scratch. Complete curriculum covering Linux, Docker, Kubernetes, CI/CD, and AWS services with 4 real-world projects.',
      'duration': '2–3 Months',
      'projects': '4 Projects',
      'mode': 'Online & Hyderabad',
      'price': '₹22,000',
      'enrollPrice': '₹3,000',
      'curriculum': [
        'Linux Fundamentals & Shell Scripting',
        'Git & Version Control',
        'Docker & Container Architecture',
        'Kubernetes & Amazon EKS',
        'Jenkins CI/CD & GitHub Actions',
        'Infrastructure as Code (Terraform)',
        'AWS Core Services — EC2, S3, RDS, VPC',
        'Monitoring: Prometheus + Grafana',
        'Ansible Configuration Management',
        'ArgoCD & GitOps',
        'Maven & Nexus Artifactory',
        'Networking for DevOps',
        'Resume & Interview Preparation',
      ],
      'tags': ['Linux', 'Docker', 'Kubernetes', 'AWS', 'Terraform', 'Jenkins', 'GitHub Actions'],
    },
    {
      'id': 'ai-llm-bootcamp',
      'tag': 'AI + LLM',
      'tagColor': QVTheme.purple,
      'popular': false,
      'title': 'AI & LLM Engineering Bootcamp',
      'subtitle': '45 Days · Mon–Fri · 8:30–9:30 AM IST · Live Online',
      'desc': 'From zero to production-ready AI engineer. Python, LLMs, RAG, agents, LangChain, LangGraph, voice AI, and MCP. 8 capstone projects.',
      'duration': '45 Days',
      'projects': '8 Projects',
      'mode': 'Live Online',
      'price': '₹29,999',
      'enrollPrice': '₹4,999',
      'curriculum': [
        'Python from scratch — OOP, advanced features',
        'Git, Docker & Pydantic foundations',
        'LLM Fundamentals — tokenization, embeddings',
        'Prompt Engineering strategies',
        'OpenAI, Gemini & Ollama (local LLMs)',
        'AI Agents with ReAct loop',
        'RAG Pipeline — indexing, retrieval, answering',
        'LangChain & LangGraph',
        'Memory: short-term, long-term, Neo4j graphs',
        'Voice AI — STT & TTS pipelines',
        'Multi-modal LLMs',
        'Model Context Protocol (MCP)',
      ],
      'tags': ['Python', 'LLMs', 'RAG', 'LangChain', 'LangGraph', 'MCP', 'Voice AI'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          _PageHero(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courses.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: _CourseCard(course: c, isMobile: isMobile),
              )).toList(),
            ),
          ),
          _BottomCTA(),
          const QVFooter(),
        ],
      ),
    );
  }
}

class _PageHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: QVTheme.bgSurface,
      padding: const EdgeInsets.fromLTRB(80, 110, 80, 56),
      child: Column(
        children: [
          const SectionHeader(
            label: 'JOB-READY PROGRAMS',
            title: 'DevOps & AI Courses',
            subtitle: 'Choose a job-ready track. Live classes, mentorship, and portfolio projects.',
          ),
          const SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _Pill(Icons.calendar_today, 'Weekday Live Classes'),
            const SizedBox(width: 24),
            _Pill(Icons.psychology, 'Mentor Support'),
            const SizedBox(width: 24),
            _Pill(Icons.folder_open, 'Project Portfolio'),
          ]),
        ],
      ),
    );
  }

  Widget _Pill(IconData icon, String label) => Row(children: [
    Icon(icon, color: QVTheme.tealMid, size: 14),
    const SizedBox(width: 6),
    Text(label, style: QVTheme.bodySmall()),
  ]);
}

class _CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;
  final bool isMobile;
  const _CourseCard({required this.course, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final Color accent = course['tagColor'] as Color;
    return GlassCard(
      hoverable: true,
      onTap: () => context.go('/courses/${course['id']}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile ? _TopMobile(course: course, accent: accent)
                   : _TopDesktop(course: course, accent: accent),
          const SizedBox(height: 20),
          Wrap(spacing: 6, runSpacing: 6,
            children: (course['tags'] as List<String>)
                .map((t) => TechTag(label: t, color: accent)).toList()),
          const SizedBox(height: 20),
          Text('Curriculum', style: QVTheme.bodySmall(color: accent)
              .copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.8)),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 12,
            childAspectRatio: isMobile ? 10 : 12,
            children: (course['curriculum'] as List<String>).map((item) =>
              Row(children: [
                Icon(Icons.check_circle_outline, color: accent, size: 14),
                const SizedBox(width: 7),
                Expanded(child: Text(item, style: QVTheme.bodySmall())),
              ]),
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _TopDesktop extends StatelessWidget {
  final Map<String, dynamic> course;
  final Color accent;
  const _TopDesktop({required this.course, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              TechTag(label: course['tag'], color: accent),
              if (course['popular'] == true) ...[
                const SizedBox(width: 8),
                TechTag(label: 'MOST POPULAR', color: QVTheme.orange),
              ],
            ]),
            const SizedBox(height: 14),
            Text(course['title'], style: QVTheme.h3()),
            const SizedBox(height: 4),
            Text(course['subtitle'], style: QVTheme.bodySmall(color: accent)),
            const SizedBox(height: 10),
            Text(course['desc'], style: QVTheme.body()),
          ],
        )),
        const SizedBox(width: 32),
        _PricePanel(course: course, accent: accent),
      ],
    );
  }
}

class _TopMobile extends StatelessWidget {
  final Map<String, dynamic> course;
  final Color accent;
  const _TopMobile({required this.course, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechTag(label: course['tag'], color: accent),
        const SizedBox(height: 12),
        Text(course['title'], style: QVTheme.h4()),
        Text(course['subtitle'], style: QVTheme.bodySmall(color: accent)),
        const SizedBox(height: 8),
        Text(course['desc'], style: QVTheme.body()),
        const SizedBox(height: 16),
        _PricePanel(course: course, accent: accent, mobile: true),
      ],
    );
  }
}

class _PricePanel extends StatelessWidget {
  final Map<String, dynamic> course;
  final Color accent;
  final bool mobile;
  const _PricePanel({required this.course, required this.accent, this.mobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 200,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: QVTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: QVTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Course Fee', style: QVTheme.bodySmall()),
          Text(course['price'], style: QVTheme.h3(color: accent).copyWith(fontSize: 24)),
          const SizedBox(height: 4),
          Text('Pay ${course['enrollPrice']} to enroll', style: QVTheme.bodySmall()),
          const SizedBox(height: 6),
          Text('⏱ ${course['duration']}', style: QVTheme.bodySmall()),
          Text('📁 ${course['projects']}', style: QVTheme.bodySmall()),
          Text('📍 ${course['mode']}', style: QVTheme.bodySmall()),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 11),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              child: Text('Enroll – ${course['enrollPrice']}'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(80, 0, 80, 40),
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: QVTheme.tealBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: QVTheme.tealBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Not sure which course to pick?', style: QVTheme.h4()),
            Text('DM us on Instagram and we\'ll help you choose.',
                style: QVTheme.body()),
          ]),
          QVButton(label: 'DM PROJECT on Instagram', onTap: () {}),
        ],
      ),
    );
  }
}
