import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../theme/qv_theme.dart';
import '../widgets/shared.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          _PageHero(isMobile: isMobile),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40, vertical: 32),
            child: Column(children: [
              _CourseCard(
                isMobile: isMobile,
                tag: 'AWS DEVOPS',
                tagColor: QVTheme.tealMid,
                badge: 'MOST POPULAR',
                badgeColor: QVTheme.orange,
                title: 'Complete AWS DevOps Course',
                level: 'Beginners to Advanced',
                startDate: 'Starting On: 5th June 2026',
                totalClasses: '34 Modules across 9 Parts',
                duration: '2–3 Months',
                classDuration: '1 hour/day',
                schedule: 'Mon – Fri',
                timing: '7:30 PM – 8:30 PM IST',
                mode: 'Online + Offline (Hyderabad)',
                fee: '₹22,000',
                enrollFee: '₹3,000',
                enrollNote: 'Pay ₹3,000 now · ₹19,000 before start',
                dmKeyword: 'DEVOPS',
                pdfAsset: 'assets/docs/QV_AWS_DevOps_Curriculum.pdf',
                pdfName: 'QV_AWS_DevOps_Curriculum.pdf',
                accentColor: QVTheme.tealMid,
                detailsContent: _AWSSDetailContent(),
              ),
              const SizedBox(height: 20),
              _CourseCard(
                isMobile: isMobile,
                tag: 'AI + LLM',
                tagColor: QVTheme.purple,
                badge: 'NEW BATCH',
                badgeColor: QVTheme.blue,
                title: 'Complete AI & LLM Engineering Bootcamp',
                level: 'Beginners to Advanced',
                startDate: 'Batch enrolling now',
                totalClasses: '8 Parts · 8 Portfolio Projects',
                duration: '45 Days',
                classDuration: '1 hour/day',
                schedule: 'Mon – Fri',
                timing: '7:30 PM – 8:30 PM IST',
                mode: 'Live Online',
                fee: '₹29,999',
                enrollFee: '₹4,999',
                enrollNote: 'Pay ₹4,999 now · Was ₹39,999',
                dmKeyword: 'AI',
                pdfAsset: null,
                pdfName: null,
                accentColor: QVTheme.purple,
                detailsContent: _AIDetailContent(),
              ),
            ]),
          ),
          _BottomCTA(isMobile: isMobile),
          const QVFooter(),
        ],
      ),
    );
  }
}

// ─── Page Hero ────────────────────────────────────────────────────────────────
class _PageHero extends StatelessWidget {
  final bool isMobile;
  const _PageHero({required this.isMobile});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: QVTheme.bgSurface,
      padding: EdgeInsets.fromLTRB(isMobile ? 24 : 80, 110, isMobile ? 24 : 80, 44),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: QVTheme.tealBg,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: QVTheme.tealBorder),
          ),
          child: Text('// OUR LIVE COURSES', style: QVTheme.label()),
        ),
        const SizedBox(height: 14),
        Text('Real Training by Real DevOps Engineers',
            style: QVTheme.display2(), textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text(
          "We're a group of working DevOps engineers  -not trainers who just read slides.\nEvery concept we teach, we use in production every day.",
          style: QVTheme.body(color: QVTheme.txtMuted),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

// ─── Course Card ──────────────────────────────────────────────────────────────
class _CourseCard extends StatefulWidget {
  final bool isMobile;
  final String tag, title, level, startDate, totalClasses, duration;
  final String classDuration, schedule, timing, mode, fee, enrollFee, enrollNote, dmKeyword;
  final String? pdfAsset, pdfName;
  final Color tagColor, badgeColor, accentColor;
  final String badge;
  final Widget detailsContent;

  const _CourseCard({
    required this.isMobile, required this.tag, required this.tagColor,
    required this.badge, required this.badgeColor, required this.title,
    required this.level, required this.startDate, required this.totalClasses,
    required this.duration, required this.classDuration, required this.schedule,
    required this.timing, required this.mode, required this.fee,
    required this.enrollFee, required this.enrollNote, required this.dmKeyword,
    required this.pdfAsset, required this.pdfName, required this.accentColor,
    required this.detailsContent,
  });

  @override
  State<_CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<_CourseCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.accentColor, width: 1.5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // ── Main card content ──
        Padding(
          padding: const EdgeInsets.all(24),
          child: widget.isMobile
              ? _MobileLayout(card: this)
              : _DesktopLayout(card: this),
        ),

        // ── Expandable details ──
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: _expanded
            ? Column(children: [
                Divider(color: widget.accentColor.withOpacity(0.2), height: 1),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: widget.detailsContent,
                ),
              ])
            : const SizedBox.shrink(),
        ),
      ]),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final _CourseCardState card;
  const _DesktopLayout({required this.card});

  @override
  Widget build(BuildContext context) {
    final w = card.widget;
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          _Tag(w.tag, w.tagColor),
          const SizedBox(width: 8),
          _Tag(w.badge, w.badgeColor),
          const SizedBox(width: 8),
          _Tag(w.level, QVTheme.txtMuted),
        ]),
        const SizedBox(height: 12),
        Text(w.title, style: QVTheme.h3().copyWith(fontSize: 22)),
        const SizedBox(height: 14),
        _InfoGrid(w: w),
        const SizedBox(height: 14),
        Row(children: [
          OutlinedButton.icon(
            onPressed: () => card.setState(() => card._expanded = !card._expanded),
            icon: Icon(
              card._expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 16, color: w.accentColor,
            ),
            label: Text(
              card._expanded ? 'Hide Details' : 'View Details →',
              style: TextStyle(fontSize: 13, color: w.accentColor, fontWeight: FontWeight.w600),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: w.accentColor),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            ),
          ),
          if (w.pdfAsset != null) ...[
            const SizedBox(width: 10),
            _PdfBtn(assetPath: w.pdfAsset!, fileName: w.pdfName!, color: w.accentColor),
          ],
        ]),
      ])),
      const SizedBox(width: 28),
      _FeeBox(w: w),
    ]);
  }
}

class _MobileLayout extends StatelessWidget {
  final _CourseCardState card;
  const _MobileLayout({required this.card});

  @override
  Widget build(BuildContext context) {
    final w = card.widget;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        _Tag(w.tag, w.tagColor),
        const SizedBox(width: 6),
        _Tag(w.badge, w.badgeColor),
      ]),
      const SizedBox(height: 10),
      Text(w.title, style: QVTheme.h4()),
      const SizedBox(height: 4),
      Text(w.level, style: QVTheme.bodySmall()),
      const SizedBox(height: 12),
      _InfoGrid(w: w),
      const SizedBox(height: 12),
      _FeeBox(w: w, mobile: true),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: OutlinedButton(
          onPressed: () => card.setState(() => card._expanded = !card._expanded),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: w.accentColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
          child: Text(
            card._expanded ? 'Hide Details' : 'View Details →',
            style: TextStyle(fontSize: 13, color: w.accentColor, fontWeight: FontWeight.w600),
          ),
        )),
        if (w.pdfAsset != null) ...[
          const SizedBox(width: 8),
          _PdfBtn(assetPath: w.pdfAsset!, fileName: w.pdfName!, color: w.accentColor),
        ],
      ]),
    ]);
  }
}

class _InfoGrid extends StatelessWidget {
  final dynamic w;
  const _InfoGrid({required this.w});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 20, runSpacing: 8, children: [
      _InfoItem(Icons.calendar_today, w.startDate),
      _InfoItem(Icons.class_, w.totalClasses),
      _InfoItem(Icons.timer, w.classDuration),
      _InfoItem(Icons.access_time, w.timing),
      _InfoItem(Icons.date_range, w.schedule),
      _InfoItem(Icons.laptop, w.mode),
    ]);
  }
}

Widget _InfoItem(IconData icon, String text) => Row(mainAxisSize: MainAxisSize.min, children: [
  Icon(icon, size: 13, color: QVTheme.tealMid),
  const SizedBox(width: 5),
  Text(text, style: QVTheme.bodySmall(color: QVTheme.txtPrimary)),
]);

Widget _Tag(String label, Color color) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
  decoration: BoxDecoration(
    color: color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: color.withOpacity(0.35)),
  ),
  child: Text(label, style: TextStyle(
    fontSize: 10, color: color,
    fontWeight: FontWeight.w700, letterSpacing: 0.6,
    fontFamily: 'monospace',
  )),
);

class _FeeBox extends StatelessWidget {
  final dynamic w;
  final bool mobile;
  const _FeeBox({required this.w, this.mobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (w.accentColor as Color).withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: (w.accentColor as Color).withOpacity(0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Course Fee', style: QVTheme.bodySmall()),
        Text(w.fee, style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w800,
          color: w.accentColor as Color, letterSpacing: -0.8,
        )),
        const SizedBox(height: 2),
        Text(w.enrollNote, style: QVTheme.bodySmall()),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); },
          style: ElevatedButton.styleFrom(
            backgroundColor: w.accentColor as Color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 11),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          child: Text('Enroll – ${w.enrollFee}'),
        )),
        const SizedBox(height: 6),
        Center(child: Text("DM '${w.dmKeyword}' on Instagram",
            style: QVTheme.bodySmall(color: w.accentColor as Color))),
      ]),
    );
  }
}

class _PdfBtn extends StatelessWidget {
  final String assetPath, fileName;
  final Color color;
  const _PdfBtn({required this.assetPath, required this.fileName, required this.color});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        html.AnchorElement(href: assetPath)
          ..setAttribute('download', fileName)
          ..click();
      },
      icon: Icon(Icons.download_rounded, size: 15, color: color),
      label: Text('Curriculum PDF',
          style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color.withOpacity(0.4)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}

// ─── AWS Details Content ──────────────────────────────────────────────────────
class _AWSSDetailContent extends StatelessWidget {
  const _AWSSDetailContent();

  static const parts = [
    ('PART I', 'DevOps Foundations', ['Module 1: DevOps Intro & Culture  -SDLC, Waterfall vs Agile, CI/CD', 'Module 2: Linux Administration  -Architecture, permissions, networking', 'Module 3: Shell Scripting  -Variables, loops, cron jobs, automation scripts', 'Module 4: Python for DevOps  -OOP, file management, automation', 'Module 5: Networking Fundamentals  -OSI model, TCP/IP, subnetting, DNS']),
    ('PART II', 'Source Code & Build Management', ['Module 6: Git & Version Control  -Branching, rebasing, PR workflow, Git hooks', 'Module 7: Maven Build Automation  -pom.xml, lifecycle, multi-module projects', 'Module 8: Nexus & JFrog Artifactory  -Release vs snapshot, artifact repos', 'Module 9: SonarQube Code Quality  -SAST, PMD, JaCoCo, pipeline integration']),
    ('PART III', 'CI/CD & Automation', ['Module 10: Jenkins  -Pipelines (scripted + declarative), multi-branch, shared libs', 'Module 11: AWS CodePipeline, CodeBuild & CodeDeploy  -end-to-end AWS native CI/CD']),
    ('PART IV', 'Configuration Management', ['Module 12: Ansible  -Inventory, playbooks, roles, vault, Jinja2, rolling deployments']),
    ('PART V', 'Containerization & Orchestration', ['Module 13: Docker  -Dockerfile, multi-stage builds, networking, volumes, ECR', 'Module 14: Kubernetes  -Pods, deployments, RBAC, HPA, Helm, ArgoCD, EKS']),
    ('PART VI', 'Infrastructure as Code', ['Module 15: Terraform  -HCL, providers (AWS/Docker/K8s), remote state, modules', 'Module 16: Packer  -AMI automation, Ansible provisioners']),
    ('PART VII', 'Monitoring & Observability', ['Module 17: Prometheus & Grafana  -Dashboards, alerting, K8s integration', 'Module 18: AWS CloudWatch, CloudTrail & Systems Manager']),
    ('PART VIII', 'AWS Cloud Services', ['Modules 19–20: Cloud Fundamentals & EC2  -AMIs, pricing, security groups', 'Modules 21–22: IAM & VPC  -Users/roles/policies, MFA, subnets, NAT', 'Modules 23–24: S3 & EBS  -Storage classes, lifecycle, static hosting', 'Modules 25–26: ELB & Auto Scaling  -ALB/NLB, target groups, CloudWatch', 'Modules 27–28: RDS, Route 53 & CloudFront  -Multi-AZ, read replicas, CDN', 'Modules 29–31: Lambda, CloudFormation & AWS Bedrock  -Serverless, IaC, AI']),
    ('PART IX', 'Advanced Topics', ['Module 32: DevSecOps  -SAST, DAST, container security, shift-left', 'Module 33: Site Reliability Engineering  -SLOs, incident response, canary', 'Module 34: AI Tools for DevOps  -Code Rabbit, Codeium, MCP']),
  ];

  static const projects = [
    ('01', 'Static Website Hosting', 'S3 + Route 53 + CloudFront + SSL'),
    ('02', 'EC2 Web Server Setup', 'Apache/Nginx + Auto Scaling + ALB'),
    ('03', 'Multi-Tier App on EKS', 'VPC + ALB + EKS + RDS + ECR + Route53'),
    ('04', 'Full GitOps Pipeline', 'EKS + ArgoCD + Helm + Prometheus + Grafana + Jenkins'),
  ];

  static const included = [
    'Daily 1-hour live sessions  -Mon to Fri, no recordings substitute',
    'Hands-on labs for every single module  -not optional',
    'All recordings  -rewatch as many times as you need',
    'WhatsApp group with us directly  -ask doubts anytime',
    'Resume review + mock interviews before you apply',
    'Interview question bank  -200+ real DevOps questions',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // From the instructors
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF0FFF8),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.tealBorder),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('// FROM US, THE INSTRUCTORS',
              style: QVTheme.label()),
          const SizedBox(height: 8),
          Text(
            "We've been doing DevOps at scale  -multi-region EKS clusters, full CI/CD pipelines, "
            "IaC with Terraform  -for 10+ years. This is literally what we wish existed when we started. "
            "No fluff. Every module has a lab because that's the only way DevOps actually sticks.",
            style: QVTheme.body(),
          ),
        ]),
      ),
      const SizedBox(height: 24),

      // Curriculum
      Text('Complete Curriculum  -34 Modules',
          style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
      const SizedBox(height: 12),
      ...parts.map((p) => _DetailAccordion(
        partNum: p.$1, title: p.$2, items: p.$3,
        color: QVTheme.tealMid, activeBg: const Color(0xFFF0FFF8),
        activeBorder: QVTheme.tealBorder,
      )),
      const SizedBox(height: 24),

      // Projects
      Text('4 Real-World AWS Projects',
          style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
      const SizedBox(height: 4),
      Text("These go straight on your resume.",
          style: QVTheme.bodySmall()),
      const SizedBox(height: 12),
      ...projects.map((p) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: QVTheme.bgSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.border),
        ),
        child: Row(children: [
          Text('PROJECT ${p.$1}',
              style: QVTheme.label(color: QVTheme.tealMid)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(p.$2, style: QVTheme.body(color: QVTheme.txtPrimary)
                .copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
            Text(p.$3, style: QVTheme.bodySmall()),
          ])),
        ]),
      )),
      const SizedBox(height: 24),

      // What's included
      Text("What You're Getting",
          style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
      const SizedBox(height: 10),
      ...included.map((t) => Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.check_circle, color: QVTheme.tealMid, size: 15),
          const SizedBox(width: 8),
          Expanded(child: Text(t, style: QVTheme.bodySmall())),
        ]),
      )),
    ]);
  }
}

// ─── AI Details Content ───────────────────────────────────────────────────────
class _AIDetailContent extends StatelessWidget {
  const _AIDetailContent();

  static const parts = [
    ('PART 1', 'Foundations', ['Python from scratch  -syntax, OOP, advanced features', 'Git & GitHub  -branching, merging, professional workflows', 'Docker  -images, volumes, deploying AI apps', 'Pydantic  -type-safe structured data for Python apps']),
    ('PART 2', 'AI & LLM Fundamentals', ['How LLMs work  -tokenization, embeddings, attention mechanism', 'GPT, base models vs instruction-tuned models', 'Multi-head attention & the Attention Is All You Need paper']),
    ('PART 3', 'Prompt Engineering', ['Zero-shot, few-shot, chain-of-thought, persona-based', 'Prompt formats: Alpaca, ChatML, LLaMA-2', 'Structured JSON outputs with Pydantic, fixing hallucinations']),
    ('PART 4', 'Running LLMs', ['OpenAI & Gemini API with Python', 'Ollama + Docker  -local models, zero API cost', 'FastAPI endpoints for production LLM use']),
    ('PART 5', 'Agents & RAG', ['Build your first AI agent with the ReAct loop', 'CLI coding agent with Claude API', 'Full RAG pipeline: indexing → retrieval → answering', 'LangChain loaders, splitters, vector stores', 'Async RAG with Redis queues and background workers']),
    ('PART 6', 'LangGraph & Memory', ['LangGraph: state, nodes, edges, graph-based workflows', 'MongoDB checkpointing to resume agents across sessions', 'Short-term, long-term, episodic & semantic memory', 'Graph memory with Neo4j and Cypher queries']),
    ('PART 7', 'Voice & Multi-Modal AI', ['Voice agents with real-time STT + TTS', 'Build your own AI coding assistant (Cursor-style)', 'Multi-modal LLMs  -images + text in one pipeline']),
    ('PART 8', 'Model Context Protocol (MCP)', ["What MCP is and why it's becoming the standard", 'MCP transports: STDIO and SSE', 'Build and deploy a real MCP server with Python']),
  ];

  static const projects = [
    ('01', 'Tokenizer from Scratch', 'Python · NLP'),
    ('02', 'Local Ollama + FastAPI AI App', 'Ollama · Docker · FastAPI'),
    ('03', 'Python CLI Coding Assistant', 'Agents · Claude API'),
    ('04', 'Document RAG Pipeline', 'LangChain · ChromaDB'),
    ('05', 'Scalable Queue-based RAG', 'Redis · FastAPI · Workers'),
    ('06', 'AI Conversational Voice Agent', 'STT · GPT · TTS'),
    ('07', 'Graph Memory Agent', 'Neo4j · LangGraph'),
    ('08', 'MCP-Powered AI Server', 'MCP SDK · STDIO · SSE'),
  ];

  static const included = [
    'Daily 1-hour live sessions  -Mon to Fri',
    'Hands-on labs for every module  -mandatory, not optional',
    'All recordings  -rewatch as many times as you need',
    'WhatsApp group with us directly  -ask doubts anytime',
    'Resume review + mock interviews before you apply',
    'Interview question bank  -100+ real AI engineering questions',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F3FF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.purpleBorder),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('// FROM US, THE INSTRUCTORS',
              style: QVTheme.label(color: QVTheme.purple)),
          const SizedBox(height: 8),
          Text(
            "AI engineering isn't just calling OpenAI's API. We built this because we kept seeing engineers "
            "who could make a chatbot demo but had no idea how to handle memory, scale RAG, or wire up real agents. "
            "This takes you from 'I called an API once' to 'I built a production AI system.'",
            style: QVTheme.body(),
          ),
        ]),
      ),
      const SizedBox(height: 24),

      Text('Complete Curriculum  -8 Parts',
          style: QVTheme.h4().copyWith(color: QVTheme.purple)),
      const SizedBox(height: 12),
      ...parts.map((p) => _DetailAccordion(
        partNum: p.$1, title: p.$2, items: p.$3,
        color: QVTheme.purple, activeBg: const Color(0xFFF5F3FF),
        activeBorder: QVTheme.purpleBorder,
      )),
      const SizedBox(height: 24),

      Text('8 Portfolio Projects',
          style: QVTheme.h4().copyWith(color: QVTheme.purple)),
      const SizedBox(height: 12),
      ...projects.map((p) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: QVTheme.bgSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.border),
        ),
        child: Row(children: [
          Text('PROJECT ${p.$1}',
              style: QVTheme.label(color: QVTheme.purple)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(p.$2, style: QVTheme.body(color: QVTheme.txtPrimary)
                .copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
            Text(p.$3, style: QVTheme.bodySmall()),
          ])),
        ]),
      )),
      const SizedBox(height: 24),

      Text("What You're Getting",
          style: QVTheme.h4().copyWith(color: QVTheme.purple)),
      const SizedBox(height: 10),
      ...included.map((t) => Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.check_circle, color: QVTheme.purple, size: 15),
          const SizedBox(width: 8),
          Expanded(child: Text(t, style: QVTheme.bodySmall())),
        ]),
      )),
    ]);
  }
}

// ─── Detail Accordion ─────────────────────────────────────────────────────────
class _DetailAccordion extends StatefulWidget {
  final String partNum, title;
  final List<String> items;
  final Color color, activeBg, activeBorder;
  const _DetailAccordion({
    required this.partNum, required this.title, required this.items,
    required this.color, required this.activeBg, required this.activeBorder,
  });
  @override State<_DetailAccordion> createState() => _DetailAccordionState();
}
class _DetailAccordionState extends State<_DetailAccordion> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: _open ? widget.activeBg : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _open ? widget.activeBorder : QVTheme.border),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(widget.partNum,
                    style: TextStyle(fontSize: 10, color: widget.color,
                        fontWeight: FontWeight.w700, fontFamily: 'monospace')),
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(widget.title,
                  style: QVTheme.body(color: QVTheme.txtPrimary)
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 13))),
              Text('${widget.items.length}', style: QVTheme.bodySmall()),
              const SizedBox(width: 6),
              AnimatedRotation(
                turns: _open ? 0.5 : 0,
                duration: const Duration(milliseconds: 180),
                child: Icon(Icons.keyboard_arrow_down, color: widget.color, size: 16),
              ),
            ]),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: _open
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(padding: const EdgeInsets.only(top: 4),
                          child: Icon(Icons.check_circle_outline,
                              color: widget.color, size: 13)),
                        const SizedBox(width: 7),
                        Expanded(child: Text(item,
                            style: QVTheme.bodySmall())),
                      ]),
                    )).toList()),
                )
              : const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }
}

// ─── Bottom CTA ───────────────────────────────────────────────────────────────
class _BottomCTA extends StatelessWidget {
  final bool isMobile;
  const _BottomCTA({required this.isMobile});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 16 : 40, 0, isMobile ? 16 : 40, 32),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: QVTheme.tealBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.tealBorder),
      ),
      child: Column(children: [
        Text('Not sure which to pick?', style: QVTheme.h4()),
        const SizedBox(height: 6),
        Text(
          "DM us on Instagram  -tell us where you are right now and we'll tell you honestly which one makes sense.",
          style: QVTheme.body(color: QVTheme.txtMuted),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        QVButton(label: "DM 'HELP' on Instagram", onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); }),
      ]),
    );
  }
}
