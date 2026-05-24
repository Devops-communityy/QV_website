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
          _CourseCardAWS(isMobile: isMobile),
          _CourseCardAI(isMobile: isMobile),
          _BottomCTA(isMobile: isMobile),
          const QVFooter(),
        ],
      ),
    );
  }
}

// ─── PDF Download Helper ───────────────────────────────────────────────────────
void _downloadPDF(String assetPath, String fileName) {
  html.AnchorElement(href: assetPath)
    ..setAttribute('download', fileName)
    ..click();
}

class _DownloadBtn extends StatefulWidget {
  final String label;
  final String assetPath;
  final String fileName;
  final Color color;
  const _DownloadBtn({
    required this.label,
    required this.assetPath,
    required this.fileName,
    this.color = QVTheme.tealMid,
  });
  @override State<_DownloadBtn> createState() => _DownloadBtnState();
}
class _DownloadBtnState extends State<_DownloadBtn> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => _downloadPDF(widget.assetPath, widget.fileName),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          decoration: BoxDecoration(
            color: _hover ? widget.color.withOpacity(0.12) : widget.color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hover ? widget.color : widget.color.withOpacity(0.35),
              width: _hover ? 1.5 : 1,
            ),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.picture_as_pdf, color: widget.color, size: 16),
            const SizedBox(width: 8),
            Text(widget.label,
                style: QVTheme.body(color: widget.color)
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
            const SizedBox(width: 8),
            Icon(Icons.download_rounded, color: widget.color, size: 15),
          ]),
        ),
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
      padding: EdgeInsets.fromLTRB(isMobile ? 24 : 80, 110, isMobile ? 24 : 80, 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: QVTheme.tealBg,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: QVTheme.tealBorder),
            ),
            child: Text('// JOB-READY PROGRAMS', style: QVTheme.label()),
          ),
          const SizedBox(height: 16),
          Text('Real Training by\nReal DevOps Engineers',
              style: QVTheme.display2(), textAlign: TextAlign.center),
          const SizedBox(height: 14),
          Text(
            "We're a group of working DevOps engineers — not trainers who just read slides.\nEvery concept we teach, we use in production every day.",
            style: QVTheme.body(color: QVTheme.txtMuted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Wrap(alignment: WrapAlignment.center, spacing: 20, runSpacing: 10, children: [
            _Pill(Icons.calendar_today, 'Mon – Fri Classes'),
            _Pill(Icons.access_time, '7:00 AM – 7:30 AM IST'),
            _Pill(Icons.psychology, '10+ Yrs Industry Experience'),
            _Pill(Icons.folder_open, 'Real Production Projects'),
          ]),
        ],
      ),
    );
  }

  Widget _Pill(IconData icon, String label) => Row(mainAxisSize: MainAxisSize.min, children: [
    Icon(icon, color: QVTheme.tealMid, size: 14),
    const SizedBox(width: 6),
    Text(label, style: QVTheme.bodySmall()),
  ]);
}

// ─── AWS DevOps Course ────────────────────────────────────────────────────────
class _CourseCardAWS extends StatelessWidget {
  final bool isMobile;
  const _CourseCardAWS({required this.isMobile});

  static const curriculum = [
    ('PART I', 'DevOps Foundations', [
      'Module 1: DevOps Intro & Culture — SDLC, Waterfall vs Agile, CI/CD concepts',
      'Module 2: Linux Administration — Architecture, permissions, networking, troubleshooting',
      'Module 3: Shell Scripting (Bash) — Variables, loops, cron jobs, real automation scripts',
      'Module 4: Python for DevOps — OOP, file management, automation scripts',
      'Module 5: Networking Fundamentals — OSI model, TCP/IP, IP subnetting, DNS/DHCP',
    ]),
    ('PART II', 'Source Code & Build Management', [
      'Module 6: Git & Version Control — Branching, rebasing, PR workflow, Git hooks',
      'Module 7: Maven Build Automation — pom.xml, build lifecycle, multi-module projects',
      'Module 8: Nexus & JFrog Artifactory — Release vs snapshot, artifact repos with Jenkins',
      'Module 9: SonarQube Code Quality — SAST, PMD, JaCoCo, pipeline integration',
    ]),
    ('PART III', 'CI/CD & Automation', [
      'Module 10: Jenkins — Pipelines (scripted + declarative), multi-branch, shared libraries',
      'Module 11: AWS CodePipeline, CodeBuild & CodeDeploy — end-to-end AWS native CI/CD',
    ]),
    ('PART IV', 'Configuration Management', [
      'Module 12: Ansible — Inventory, playbooks, roles, vault, Jinja2, rolling deployments',
    ]),
    ('PART V', 'Containerization & Orchestration', [
      'Module 13: Docker — Dockerfile, multi-stage builds, networking, volumes, compose, ECR',
      'Module 14: Kubernetes — Pods, deployments, RBAC, HPA, Helm, ArgoCD, Amazon EKS',
    ]),
    ('PART VI', 'Infrastructure as Code', [
      'Module 15: Terraform — HCL, providers (AWS/Docker/K8s), remote state, modules',
      'Module 16: Packer — AMI automation, Ansible provisioners in Packer',
    ]),
    ('PART VII', 'Monitoring & Observability', [
      'Module 17: Prometheus & Grafana — Dashboards, alerting, Kubernetes integration',
      'Module 18: AWS CloudWatch, CloudTrail & Systems Manager',
    ]),
    ('PART VIII', 'AWS Cloud Services', [
      'Module 19–20: Cloud Fundamentals & EC2 — AMIs, pricing models, security groups',
      'Module 21–22: IAM & VPC — Users/roles/policies, MFA, subnets, NAT, VPC peering',
      'Module 23–24: S3 & EBS — Storage classes, lifecycle, static hosting, volume types',
      'Module 25–26: ELB & Auto Scaling — ALB/NLB, target groups, CloudWatch alarms',
      'Module 27–28: RDS, Route 53 & CloudFront — Multi-AZ, read replicas, CDN, DNS',
      'Module 29–31: Lambda, CloudFormation & AWS Bedrock — Serverless, IaC, AI services',
    ]),
    ('PART IX', 'Advanced Topics', [
      'Module 32: DevSecOps — SAST, DAST, container security, shift-left practices',
      'Module 33: Site Reliability Engineering — SLOs, incident response, canary releases',
      'Module 34: AI Tools for DevOps — Code Rabbit, Codeium, MCP, AI pipeline optimization',
    ]),
  ];

  static const projects = [
    ('01', 'Static Website Hosting', 'Host on S3 with Route 53, CloudFront, SSL', ['S3', 'Route 53', 'CloudFront']),
    ('02', 'EC2 Web Server Setup', 'Apache/Nginx on EC2 with Auto Scaling and ALB', ['EC2', 'Apache', 'Nginx', 'ALB']),
    ('03', 'Multi-Tier App on EKS', 'E-Commerce app — VPC, ALB, EKS, RDS, ECR, Route53', ['VPC', 'ALB', 'EKS', 'RDS', 'ECR']),
    ('04', 'Full GitOps Pipeline', 'EKS + ArgoCD + Helm + Prometheus + Grafana + Jenkins', ['ArgoCD', 'Helm', 'Prometheus', 'EKS']),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 16 : 40, 40, isMobile ? 16 : 40, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: QVTheme.tealMid, width: 2),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header
        Container(
          padding: EdgeInsets.all(isMobile ? 20 : 32),
          decoration: const BoxDecoration(
            color: QVTheme.tealBg,
            borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              TechTag(label: 'AWS DEVOPS'),
              const SizedBox(width: 8),
              TechTag(label: 'MOST POPULAR', color: QVTheme.orange),
            ]),
            const SizedBox(height: 14),
            isMobile
              ? Text('Complete AWS DevOps Course', style: QVTheme.h3())
              : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Text('Complete AWS DevOps Course',
                      style: QVTheme.display2().copyWith(fontSize: 30))),
                  const SizedBox(width: 32),
                  _PricePanel(),
                ]),
            const SizedBox(height: 8),
            Text("Zero to Job-Ready — taught by engineers, not just teachers.",
                style: QVTheme.body(color: QVTheme.tealMid)),
            const SizedBox(height: 12),
            Wrap(spacing: 16, runSpacing: 8, children: [
              _M(Icons.calendar_today, 'Starts 5th June 2026'),
              _M(Icons.access_time, '7:00–7:30 AM IST · Mon–Fri'),
              _M(Icons.schedule, '2–3 Months'),
              _M(Icons.laptop, 'Online + Offline (Hyderabad)'),
            ]),
            const SizedBox(height: 16),
            Wrap(spacing: 6, runSpacing: 6, children: [
              'Linux','Bash','Git','Maven','Jenkins','Ansible',
              'Docker','Kubernetes','AWS','Terraform','Prometheus',
              'Grafana','ArgoCD','DevSecOps','SRE',
            ].map((t) => TechTag(label: t)).toList()),
            const SizedBox(height: 16),
            // ── PDF DOWNLOAD BUTTON ──
            _DownloadBtn(
              label: 'Download Full Curriculum PDF',
              assetPath: 'assets/docs/QV_AWS_DevOps_Curriculum.pdf',
              fileName: 'QV_AWS_DevOps_Curriculum.pdf',
              color: QVTheme.tealMid,
            ),
            if (isMobile) ...[const SizedBox(height: 16), _PricePanel(mobile: true)],
          ]),
        ),

        // Quote from instructors
        _InstructorQuote(
          color: QVTheme.tealMid,
          bg: const Color(0xFFF0FFF8),
          border: QVTheme.tealBorder,
          label: 'FROM US, THE INSTRUCTORS',
          quote: "We've been doing DevOps at scale — multi-region EKS clusters, full CI/CD pipelines, "
              "IaC with Terraform — for 10+ years. This course is literally what we wish existed when we started. "
              "No fluff, no slides-only sessions. Every module has a lab because that's the only way DevOps actually sticks.",
          schedule: 'Batch starts 5th June · Mon–Fri · 7:00–7:30 AM IST · Online + Hyderabad',
          padding: EdgeInsets.all(isMobile ? 20 : 32),
        ),

        // Curriculum
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Complete Curriculum — 34 Modules', style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
            const SizedBox(height: 4),
            Text('9 Parts · everything from Linux basics to AI tools for DevOps', style: QVTheme.bodySmall()),
            const SizedBox(height: 16),
            ...curriculum.map((p) => _Accordion(
              partNum: p.$1, title: p.$2, items: p.$3, color: QVTheme.tealMid,
              activeBg: const Color(0xFFF0FFF8), activeBorder: QVTheme.tealBorder,
            )),
          ]),
        ),

        const SizedBox(height: 32),

        // Projects
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('4 Real-World AWS Projects', style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
            const SizedBox(height: 4),
            Text("These go straight on your resume. We've seen these exact projects get candidates interviews at TCS, Infosys, Wipro.",
                style: QVTheme.bodySmall()),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isMobile ? 1 : 2,
              mainAxisSpacing: 12, crossAxisSpacing: 12,
              childAspectRatio: isMobile ? 2.5 : 2.8,
              children: projects.map((p) => _ProjectCard(
                num: p.$1, title: p.$2, desc: p.$3, tags: p.$4,
                color: QVTheme.tealMid,
              )).toList(),
            ),
          ]),
        ),

        const SizedBox(height: 32),

        // What's included
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("What You're Getting", style: QVTheme.h4().copyWith(color: QVTheme.tealMid)),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isMobile ? 1 : 2,
              mainAxisSpacing: 8, crossAxisSpacing: 8,
              childAspectRatio: isMobile ? 7 : 9,
              children: [
                'Daily 30-min live sessions — tight, focused, no time-wasting',
                'Hands-on labs for every single module — not optional',
                'All recordings — rewatch as many times as you need',
                'WhatsApp group with us directly — ask doubts anytime',
                '4 production-grade AWS projects for your resume',
                'Resume review + mock interviews before you apply',
                'Interview question bank — 200+ real DevOps questions',
                'Referrals to our hiring network — 50+ companies',
              ].map((t) => Row(children: [
                const Icon(Icons.check_circle, color: QVTheme.tealMid, size: 16),
                const SizedBox(width: 10),
                Expanded(child: Text(t, style: QVTheme.bodySmall())),
              ])).toList(),
            ),
          ]),
        ),

        const SizedBox(height: 32),

        // Enroll CTA
        Container(
          margin: EdgeInsets.all(isMobile ? 20 : 32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: QVTheme.tealBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: QVTheme.tealBorder),
          ),
          child: isMobile
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Ready to join the 5th June batch?', style: QVTheme.h4()),
                const SizedBox(height: 8),
                Text('Seats limited to 30. DM us before it fills up.', style: QVTheme.body()),
                const SizedBox(height: 14),
                SizedBox(width: double.infinity, child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: QVTheme.tealMid, foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Secure Your Seat – ₹3,000'),
                )),
              ])
            : Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Ready to join the 5th June batch?', style: QVTheme.h4()),
                  const SizedBox(height: 6),
                  Text("Seats are limited to 30 per batch. We keep it small so everyone gets personal attention.",
                      style: QVTheme.body()),
                ])),
                const SizedBox(width: 32),
                Column(children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: QVTheme.tealMid, foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Secure Your Seat – ₹3,000'),
                  ),
                  const SizedBox(height: 8),
                  Text("or DM 'DEVOPS' on Instagram",
                      style: QVTheme.bodySmall(color: QVTheme.tealMid)),
                ]),
              ]),
        ),
        const SizedBox(height: 16),
      ]),
    );
  }

  Widget _M(IconData icon, String text) => Row(mainAxisSize: MainAxisSize.min, children: [
    Icon(icon, color: QVTheme.tealMid, size: 13),
    const SizedBox(width: 5),
    Text(text, style: QVTheme.bodySmall(color: QVTheme.txtPrimary)),
  ]);
}

// ─── AI LLM Course Card ───────────────────────────────────────────────────────
class _CourseCardAI extends StatelessWidget {
  final bool isMobile;
  const _CourseCardAI({required this.isMobile});

  static const curriculum = [
    ('PART 1', 'Foundations', ['Python from scratch — syntax, OOP, advanced features', 'Git & GitHub — branching, merging, professional workflows', 'Docker — images, volumes, deploying AI apps', 'Pydantic — type-safe structured data for Python apps']),
    ('PART 2', 'AI & LLM Fundamentals', ['How LLMs work — tokenization, embeddings, attention mechanism', 'GPT, base models vs instruction-tuned — when to use what', 'Multi-head attention & the Attention Is All You Need paper']),
    ('PART 3', 'Prompt Engineering', ['Zero-shot, few-shot, chain-of-thought, persona-based strategies', 'Prompt formats: Alpaca, ChatML, LLaMA-2', 'Structured JSON outputs with Pydantic, fixing hallucinations']),
    ('PART 4', 'Running LLMs', ['OpenAI & Gemini API with Python', 'Ollama + Docker — run models locally zero API cost', 'FastAPI endpoints for production LLM use']),
    ('PART 5', 'Agents & RAG', ['Build your first AI agent with the ReAct loop from scratch', 'CLI coding agent with Claude API', 'Full RAG pipeline: indexing → retrieval → answering', 'LangChain loaders, splitters, vector stores', 'Async RAG with Redis queues and background workers']),
    ('PART 6', 'LangGraph & Memory', ['LangGraph: state, nodes, edges, graph-based AI workflows', 'MongoDB checkpointing to resume agents across sessions', 'Short-term, long-term, episodic & semantic memory', 'Graph memory with Neo4j and Cypher queries']),
    ('PART 7', 'Voice & Multi-Modal AI', ['Voice agents with real-time STT + TTS', 'Build your own AI coding assistant (Cursor-style)', 'Multi-modal LLMs — images + text in one pipeline']),
    ('PART 8', 'Model Context Protocol (MCP)', ["What MCP is and why it's becoming the standard", 'MCP transports: STDIO and SSE', 'Build and deploy a real MCP server with Python']),
  ];

  static const projects = [
    ('01', 'Tokenizer from Scratch', ['Python', 'NLP']),
    ('02', 'Local Ollama + FastAPI AI App', ['Ollama', 'Docker', 'FastAPI']),
    ('03', 'Python CLI Coding Assistant', ['Agents', 'Claude API']),
    ('04', 'Document RAG Pipeline', ['LangChain', 'ChromaDB']),
    ('05', 'Scalable Queue-based RAG', ['Redis', 'FastAPI', 'Workers']),
    ('06', 'AI Conversational Voice Agent', ['STT', 'GPT', 'TTS']),
    ('07', 'Graph Memory Agent', ['Neo4j', 'LangGraph']),
    ('08', 'MCP-Powered AI Server', ['MCP SDK', 'STDIO', 'SSE']),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(isMobile ? 16 : 40, 32, isMobile ? 16 : 40, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: QVTheme.purple, width: 2),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 20 : 32),
          decoration: BoxDecoration(
            color: QVTheme.purpleBg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              TechTag(label: 'AI + LLM', color: QVTheme.purple),
              const SizedBox(width: 8),
              TechTag(label: 'NEW BATCH', color: QVTheme.blue),
            ]),
            const SizedBox(height: 14),
            isMobile
              ? Text('AI & LLM Engineering Bootcamp', style: QVTheme.h3())
              : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Text('Complete AI & LLM Engineering Bootcamp',
                      style: QVTheme.display2().copyWith(fontSize: 28))),
                  const SizedBox(width: 32),
                  _AIPricePanel(),
                ]),
            const SizedBox(height: 8),
            Text('From zero API calls to production AI systems.',
                style: QVTheme.body(color: QVTheme.purple)),
            const SizedBox(height: 12),
            Wrap(spacing: 16, runSpacing: 8, children: [
              _M(Icons.schedule, '45 Days'),
              _M(Icons.access_time, '8:30–9:30 AM IST · Mon–Fri'),
              _M(Icons.laptop, 'Live Online'),
              _M(Icons.folder_open, '8 Projects'),
            ]),
            const SizedBox(height: 16),
            Wrap(spacing: 6, runSpacing: 6, children: [
              'Python','LLMs','RAG','LangChain','LangGraph',
              'Agents','MCP','Voice AI','Neo4j','FastAPI',
            ].map((t) => TechTag(label: t, color: QVTheme.purple)).toList()),
            // NOTE: Add AI curriculum PDF download button here when PDF is available
            // const SizedBox(height: 16),
            // _DownloadBtn(label: 'Download AI Curriculum PDF', ...),
            if (isMobile) ...[const SizedBox(height: 16), _AIPricePanel(mobile: true)],
          ]),
        ),

        _InstructorQuote(
          color: QVTheme.purple,
          bg: const Color(0xFFF5F3FF),
          border: QVTheme.purpleBorder,
          label: 'FROM US, THE INSTRUCTORS',
          quote: "AI engineering isn't just calling OpenAI's API. We built this bootcamp because we "
              "kept seeing engineers who could make a chatbot demo but had no idea how to handle "
              "memory, scale RAG, or wire up real agents. This is the course that takes you from "
              "'I called an API once' to 'I built a production AI system.'",
          schedule: '45 Days · Mon–Fri · 8:30–9:30 AM IST · Live Online',
          padding: EdgeInsets.all(isMobile ? 20 : 32),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Complete Curriculum — 8 Parts', style: QVTheme.h4().copyWith(color: QVTheme.purple)),
            const SizedBox(height: 4),
            Text('From Python zero to production AI systems', style: QVTheme.bodySmall()),
            const SizedBox(height: 16),
            ...curriculum.map((p) => _Accordion(
              partNum: p.$1, title: p.$2, items: p.$3, color: QVTheme.purple,
              activeBg: const Color(0xFFF5F3FF), activeBorder: QVTheme.purpleBorder,
            )),
          ]),
        ),

        const SizedBox(height: 32),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('8 Portfolio Projects', style: QVTheme.h4().copyWith(color: QVTheme.purple)),
            const SizedBox(height: 4),
            Text("Every project is something you'd actually show in an interview.", style: QVTheme.bodySmall()),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isMobile ? 1 : 2,
              mainAxisSpacing: 10, crossAxisSpacing: 10,
              childAspectRatio: isMobile ? 2.8 : 3.2,
              children: projects.map((p) => _ProjectCard(
                num: p.$1, title: p.$2, desc: '', tags: p.$3,
                color: QVTheme.purple,
              )).toList(),
            ),
          ]),
        ),

        const SizedBox(height: 32),

        Container(
          margin: EdgeInsets.all(isMobile ? 20 : 32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: QVTheme.purpleBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: QVTheme.purpleBorder),
          ),
          child: Column(children: [
            Text('Ready to become a production AI engineer?', style: QVTheme.h4()),
            const SizedBox(height: 8),
            Text('Offer price ₹29,999 (was ₹39,999). Pay ₹4,999 to lock your seat.',
                style: QVTheme.body(color: QVTheme.txtMuted), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: QVTheme.purple, foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              child: const Text('Enroll Now – ₹4,999'),
            )),
            const SizedBox(height: 8),
            Text("or DM 'AI' on Instagram", style: QVTheme.bodySmall(color: QVTheme.purple)),
          ]),
        ),
        const SizedBox(height: 16),
      ]),
    );
  }

  Widget _M(IconData icon, String text) => Row(mainAxisSize: MainAxisSize.min, children: [
    Icon(icon, color: QVTheme.purple, size: 13),
    const SizedBox(width: 5),
    Text(text, style: QVTheme.bodySmall(color: QVTheme.txtPrimary)),
  ]);
}

class _AIPricePanel extends StatelessWidget {
  final bool mobile;
  const _AIPricePanel({this.mobile = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.purpleBorder),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Offer Price', style: QVTheme.bodySmall()),
        Text('₹29,999', style: QVTheme.h3(color: QVTheme.purple).copyWith(fontSize: 26, letterSpacing: -1)),
        Text('was ₹39,999', style: QVTheme.bodySmall().copyWith(decoration: TextDecoration.lineThrough)),
        const SizedBox(height: 6),
        Text('Pay ₹4,999 to secure seat', style: QVTheme.bodySmall()),
        const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: QVTheme.purple, foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 11),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Enroll – ₹4,999', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        )),
        const SizedBox(height: 8),
        Center(child: Text("DM 'AI' on Instagram",
            style: QVTheme.bodySmall(color: QVTheme.purple))),
      ]),
    );
  }
}

// ─── Shared Widgets ───────────────────────────────────────────────────────────
class _PricePanel extends StatelessWidget {
  final bool mobile;
  const _PricePanel({this.mobile = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: QVTheme.tealBorder),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Total Course Fee', style: QVTheme.bodySmall()),
        Text('₹22,000', style: QVTheme.h3(color: QVTheme.tealMid).copyWith(fontSize: 26, letterSpacing: -1)),
        const SizedBox(height: 4),
        Text('Pay ₹3,000 now to lock your seat', style: QVTheme.bodySmall()),
        Text('Remaining ₹19,000 before course starts', style: QVTheme.bodySmall()),
        const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: QVTheme.tealMid, foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          child: const Text('Enroll Now – ₹3,000'),
        )),
        const SizedBox(height: 8),
        Center(child: Text("DM 'DEVOPS' on Instagram",
            style: QVTheme.bodySmall(color: QVTheme.tealMid))),
      ]),
    );
  }
}

class _InstructorQuote extends StatelessWidget {
  final Color color, bg, border;
  final String label, quote, schedule;
  final EdgeInsets padding;
  const _InstructorQuote({
    required this.color, required this.bg, required this.border,
    required this.label, required this.quote, required this.schedule,
    required this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.format_quote, color: color, size: 20),
            const SizedBox(width: 8),
            Text(label, style: QVTheme.label(color: color)),
          ]),
          const SizedBox(height: 10),
          Text(quote, style: QVTheme.body()),
          const SizedBox(height: 10),
          Text(schedule, style: QVTheme.bodySmall(color: color).copyWith(fontWeight: FontWeight.w700)),
        ]),
      ),
    );
  }
}

class _Accordion extends StatefulWidget {
  final String partNum, title;
  final List<String> items;
  final Color color, activeBg, activeBorder;
  const _Accordion({
    required this.partNum, required this.title, required this.items,
    required this.color, required this.activeBg, required this.activeBorder,
  });
  @override State<_Accordion> createState() => _AccordionState();
}
class _AccordionState extends State<_Accordion> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: _open ? widget.activeBg : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _open ? widget.activeBorder : QVTheme.border),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: widget.color.withOpacity(0.3)),
                ),
                child: Text(widget.partNum, style: QVTheme.label(color: widget.color)),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(widget.title,
                  style: QVTheme.body(color: QVTheme.txtPrimary).copyWith(fontWeight: FontWeight.w600))),
              Text('${widget.items.length} modules', style: QVTheme.bodySmall()),
              const SizedBox(width: 8),
              AnimatedRotation(
                turns: _open ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(Icons.keyboard_arrow_down, color: widget.color, size: 18),
              ),
            ]),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: _open
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(padding: const EdgeInsets.only(top: 5),
                          child: Icon(Icons.check_circle_outline, color: widget.color, size: 14)),
                        const SizedBox(width: 8),
                        Expanded(child: Text(item, style: QVTheme.bodySmall())),
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

class _ProjectCard extends StatelessWidget {
  final String num, title, desc;
  final List<String> tags;
  final Color color;
  const _ProjectCard({
    required this.num, required this.title, required this.desc,
    required this.tags, required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('PROJECT $num', style: QVTheme.label(color: color)),
          const SizedBox(height: 4),
          Text(title, style: QVTheme.body(color: QVTheme.txtPrimary)
              .copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
          if (desc.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(desc, style: QVTheme.bodySmall(), maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: 8),
          Wrap(spacing: 5, runSpacing: 4,
            children: tags.map((t) => TechTag(label: t, color: color)).toList()),
        ],
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
      margin: EdgeInsets.fromLTRB(isMobile ? 16 : 40, 32, isMobile ? 16 : 40, 40),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: QVTheme.tealBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: QVTheme.tealBorder),
      ),
      child: Column(children: [
        Text('Not sure which to pick?', style: QVTheme.h4()),
        const SizedBox(height: 8),
        Text(
          "DM us on Instagram and tell us where you are right now — "
          "we'll tell you honestly which course makes more sense for you.",
          style: QVTheme.body(color: QVTheme.txtMuted),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        QVButton(label: "DM 'HELP' on Instagram", onTap: () {}),
      ]),
    );
  }
}
