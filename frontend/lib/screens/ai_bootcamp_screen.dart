import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../widgets/shared.dart';

class AIBootcampScreen extends StatelessWidget {
  const AIBootcampScreen({super.key});

  static const List<Map<String, dynamic>> curriculum = [
    {
      'part': 'PART 1',
      'title': 'Foundations',
      'items': [
        'Python from scratch — syntax, data types, OOP, and advanced features',
        'Git & GitHub — branching, merging, collaboration, and professional workflows',
        'Docker — containerization, images, volumes, and deploying applications',
        'Pydantic — type-safe, structured data handling for modern Python apps',
      ],
    },
    {
      'part': 'PART 2',
      'title': 'AI & LLM Fundamentals',
      'items': [
        'What are LLMs and how GPT predicts the next token',
        'Tokenization, embeddings, and the attention mechanism explained simply',
        'Multi-head attention, positional encodings, and the Attention Is All You Need paper',
        'Base models vs instruction-tuned models and when to use each',
      ],
    },
    {
      'part': 'PART 3',
      'title': 'Prompt Engineering',
      'items': [
        'Core strategies: zero-shot, one-shot, few-shot, chain-of-thought, persona-based',
        'Prompt formats: Alpaca, ChatML, LLaMA-2',
        'Designing prompts for structured JSON outputs with Pydantic',
        'Prompt anti-patterns that cause hallucinations and how to fix them',
      ],
    },
    {
      'part': 'PART 4',
      'title': 'Running & Using LLMs',
      'items': [
        'OpenAI & Gemini API setup and integration with Python',
        'Running models locally with Ollama + Docker with zero API cost',
        'Using Hugging Face models and INSTRUCT-tuned variants',
        'Connecting LLMs to FastAPI endpoints for production use',
      ],
    },
    {
      'part': 'PART 5',
      'title': 'Agents & RAG Systems',
      'items': [
        'Build your first AI agent from scratch with the ReAct loop',
        'CLI-based coding agents with Claude',
        'The complete RAG pipeline: indexing → retrieval → answering',
        'LangChain: document loaders, splitters, retrievers, and vector stores',
        'Advanced RAG with Redis or Valkey queues for async processing',
      ],
    },
    {
      'part': 'PART 6',
      'title': 'LangGraph & Memory',
      'items': [
        'LangGraph fundamentals: state, nodes, edges, and graph-based AI workflows',
        'Checkpointing with MongoDB to resume agents across sessions',
        'Memory architecture: short-term, long-term, episodic, and semantic memory',
        'Implementing memory layers with Mem0 and vector databases',
        'Graph memory with Neo4j and Cypher queries',
      ],
    },
    {
      'part': 'PART 7',
      'title': 'Conversational & Multi-Modal AI',
      'items': [
        'Voice-based conversational agents with real-time interaction',
        'Integrating Speech-to-Text and Text-to-Speech',
        'Build your own AI voice assistant with a Cursor IDE style workflow',
        'Multi-modal LLMs that process images and text in one pipeline',
      ],
    },
    {
      'part': 'PART 8',
      'title': 'Model Context Protocol (MCP)',
      'items': [
        'What MCP is and why it is becoming the standard for AI integrations',
        'MCP transports: STDIO and SSE',
        'Build and deploy an MCP server with Python',
      ],
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {'num': '01', 'title': 'Tokenizer from scratch', 'tags': ['Python', 'NLP']},
    {'num': '02', 'title': 'Local Ollama + FastAPI AI app', 'tags': ['Ollama', 'Docker', 'FastAPI']},
    {'num': '03', 'title': 'Python CLI coding assistant', 'tags': ['Agents', 'Claude API']},
    {'num': '04', 'title': 'Document RAG pipeline', 'tags': ['LangChain', 'ChromaDB']},
    {'num': '05', 'title': 'Queue-based scalable RAG', 'tags': ['Redis', 'FastAPI', 'Workers']},
    {'num': '06', 'title': 'AI conversational voice agent', 'tags': ['STT', 'GPT', 'TTS']},
    {'num': '07', 'title': 'Graph memory agent', 'tags': ['Neo4j', 'LangGraph']},
    {'num': '08', 'title': 'MCP-powered AI server', 'tags': ['MCP SDK', 'STDIO', 'SSE']},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          _Hero(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CurriculumSection(isMobile: isMobile),
                const SizedBox(height: 60),
                _ProjectsSection(isMobile: isMobile),
                const SizedBox(height: 60),
                _WhoForSection(isMobile: isMobile),
              ],
            ),
          ),
          const _BootcampCTA(),
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
      padding: EdgeInsets.fromLTRB(isMobile ? 24 : 80, 120, isMobile ? 24 : 80, 60),
      color: const Color(0xFFF5F3FF),
      child: isMobile ? _HeroMobile() : _HeroDesktop(),
    );
  }
}

class _HeroDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                _PurpleTag('🤖 AI + LLM BOOTCAMP'),
                const SizedBox(width: 8),
                _PurpleTag('45 DAYS'),
              ]),
              const SizedBox(height: 20),
              const Text('Complete AI & LLM\nEngineering Bootcamp',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800,
                    letterSpacing: -1.5, height: 1.1, color: Color(0xFF1a1a1a))),
              const SizedBox(height: 6),
              const Text('Program',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800,
                    letterSpacing: -1.5, color: Color(0xFF534AB7))),
              const SizedBox(height: 16),
              const Text('From Zero to Production-Ready AI Engineer. Learn Python, Git, Docker, Pydantic, LLMs, agents, RAG, LangChain, LangGraph, voice AI, and MCP in one place.',
                style: TextStyle(fontSize: 15, color: Color(0xFF555), height: 1.65)),
              const SizedBox(height: 24),
              Row(children: [
                const Icon(Icons.calendar_today, color: Color(0xFF534AB7), size: 14),
                const SizedBox(width: 6),
                const Text('45 Days · Mon–Fri', style: TextStyle(fontSize: 12, color: Color(0xFF888))),
                const SizedBox(width: 20),
                const Icon(Icons.access_time, color: Color(0xFF534AB7), size: 14),
                const SizedBox(width: 6),
                const Text('8:30 AM – 9:30 AM IST', style: TextStyle(fontSize: 12, color: Color(0xFF888))),
                const SizedBox(width: 20),
                const Icon(Icons.laptop, color: Color(0xFF534AB7), size: 14),
                const SizedBox(width: 6),
                const Text('Live Online', style: TextStyle(fontSize: 12, color: Color(0xFF888))),
              ]),
              const SizedBox(height: 28),
              Row(children: [
                _PurpleButton('Enroll Now – ₹4,999', () {}),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFAFA9EC)),
                    foregroundColor: const Color(0xFF534AB7),
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('View Curriculum', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                ),
              ]),
            ],
          ),
        ),
        const SizedBox(width: 48),
        _PriceBox(),
      ],
    );
  }
}

class _HeroMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PurpleTag('🤖 AI + LLM BOOTCAMP'),
        const SizedBox(height: 16),
        const Text('Complete AI & LLM\nEngineering Bootcamp',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, letterSpacing: -1, height: 1.1, color: Color(0xFF1a1a1a))),
        const SizedBox(height: 8),
        const Text('From Zero to Production-Ready AI Engineer.',
          style: TextStyle(fontSize: 14, color: Color(0xFF555), height: 1.6)),
        const SizedBox(height: 20),
        _PriceBox(mobile: true),
        const SizedBox(height: 16),
        _PurpleButton('Enroll Now – ₹4,999', () {}, fullWidth: true),
      ],
    );
  }
}

class _PriceBox extends StatelessWidget {
  final bool mobile;
  const _PriceBox({this.mobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? double.infinity : 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFAFA9EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Offer Price', style: TextStyle(fontSize: 11, color: Color(0xFF888))),
          const Text('₹29,999', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF534AB7), letterSpacing: -1)),
          const Text('₹39,999', style: TextStyle(fontSize: 13, color: Color(0xFF888), decoration: TextDecoration.lineThrough)),
          const SizedBox(height: 12),
          _InfoRow(Icons.schedule, '45 Days'),
          _InfoRow(Icons.folder_open, '8 Projects'),
          _InfoRow(Icons.live_tv, 'Mon–Fri Live'),
          const SizedBox(height: 14),
          const Text('Pay ₹4,999 to secure seat', style: TextStyle(fontSize: 11, color: Color(0xFF534AB7))),
        ],
      ),
    );
  }

  Widget _InfoRow(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(children: [
      Icon(icon, size: 13, color: const Color(0xFF534AB7)),
      const SizedBox(width: 6),
      Text(text, style: const TextStyle(fontSize: 12, color: Color(0xFF888))),
    ]),
  );
}

class _CurriculumSection extends StatelessWidget {
  final bool isMobile;
  const _CurriculumSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'COMPLETE CURRICULUM — 8 PARTS',
          title: 'Eight Focused Parts',
          subtitle: 'From engineering foundations to production-grade AI systems.',
          center: false,
        ),
        const SizedBox(height: 24),
        ...AIBootcampScreen.curriculum.map((part) => _PartCard(part: part)).toList(),
      ],
    );
  }
}

class _PartCard extends StatefulWidget {
  final Map<String, dynamic> part;
  const _PartCard({required this.part});

  @override
  State<_PartCard> createState() => _PartCardState();
}

class _PartCardState extends State<_PartCard> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _open = !_open),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _open ? const Color(0xFFAFA9EC) : const Color(0xFFE8E8E8),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEDFE),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xFFAFA9EC)),
                    ),
                    child: Text(widget.part['part'],
                      style: const TextStyle(fontSize: 10, color: Color(0xFF534AB7),
                          fontFamily: 'monospace', letterSpacing: 0.8)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(widget.part['title'],
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1a1a1a)))),
                  AnimatedRotation(
                    turns: _open ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF534AB7), size: 18),
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _open
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (widget.part['items'] as List<String>).map((item) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Icon(Icons.circle, size: 5, color: Color(0xFF534AB7)),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(item,
                                style: const TextStyle(fontSize: 12.5, color: Color(0xFF555), height: 1.6))),
                            ]),
                          )
                        ).toList(),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final bool isMobile;
  const _ProjectsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: '8 PORTFOLIO PROJECTS',
          title: 'Production-Grade Builds',
          subtitle: 'Eight projects that prove your skills to any employer.',
          center: false,
        ),
        const SizedBox(height: 24),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: isMobile ? 3 : 3.5,
          children: AIBootcampScreen.projects.map((p) => _ProjectCard(proj: p)).toList(),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> proj;
  const _ProjectCard({required this.proj});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Row(
        children: [
          Text('PROJECT ${proj['num']}',
            style: const TextStyle(fontSize: 10, color: Color(0xFF534AB7),
                fontFamily: 'monospace', letterSpacing: 0.8, fontWeight: FontWeight.w600)),
          const SizedBox(width: 14),
          Expanded(child: Text(proj['title'],
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1a1a1a)))),
          Wrap(
            spacing: 4,
            children: (proj['tags'] as List<String>).map((t) =>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEDFE),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFAFA9EC)),
                ),
                child: Text(t, style: const TextStyle(fontSize: 9, color: Color(0xFF534AB7), fontFamily: 'monospace')),
              )
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _WhoForSection extends StatelessWidget {
  final bool isMobile;
  const _WhoForSection({required this.isMobile});

  static const audiences = [
    (Icons.person_outline, 'Complete Beginners', 'Step-by-step path from Python basics to production AI.'),
    (Icons.storage, 'Backend Engineers', 'Drop-in AI skills with agents, RAG, and LLMs in existing stacks.'),
    (Icons.api, 'API Developers', 'Go deeper on queues, scaling, memory, and graph agents.'),
    (Icons.school_outlined, 'Students & Professionals', 'Job-ready portfolio with eight real projects for interviews.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'WHO IS THIS FOR',
          title: 'Built for Every Background',
          center: false,
        ),
        const SizedBox(height: 24),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: isMobile ? 3 : 2.5,
          children: audiences.map((a) => Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            child: Row(children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEDFE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(a.$1, color: const Color(0xFF534AB7), size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(a.$2, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(a.$3, style: const TextStyle(fontSize: 12, color: Color(0xFF888), height: 1.5)),
                ],
              )),
            ]),
          )).toList(),
        ),
      ],
    );
  }
}

class _BootcampCTA extends StatelessWidget {
  const _BootcampCTA();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(80, 0, 80, 40),
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEDFE),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFAFA9EC)),
      ),
      child: Column(
        children: [
          const Text('Ready to Become a Production-Ready AI Engineer?',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700,
                letterSpacing: -0.8, color: Color(0xFF1a1a1a)),
            textAlign: TextAlign.center),
          const SizedBox(height: 10),
          const Text('Complete curriculum from Python foundations to agents, RAG, and MCP.\nLive weekday sessions with eight real-world AI projects.',
            style: TextStyle(fontSize: 14, color: Color(0xFF555), height: 1.6),
            textAlign: TextAlign.center),
          const SizedBox(height: 28),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _PurpleButton('Enroll Now – ₹4,999', () {}),
          ]),
        ],
      ),
    );
  }
}

Widget _PurpleTag(String label) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  decoration: BoxDecoration(
    color: const Color(0xFFEEEDFE),
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: const Color(0xFFAFA9EC)),
  ),
  child: Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF534AB7),
      fontFamily: 'monospace', letterSpacing: 0.8)),
);

Widget _PurpleButton(String label, VoidCallback onTap, {bool fullWidth = false}) =>
  SizedBox(
    width: fullWidth ? double.infinity : null,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF534AB7),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      ),
      child: Text(label),
    ),
  );
