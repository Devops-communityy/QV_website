// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';
import '../widgets/shared.dart';

class WorkshopsScreen extends StatelessWidget {
  const WorkshopsScreen({super.key});

  static const upcoming = [
    _Webinar(
      title: 'AI-Ready DevSecOps Live Project on EKS',
      desc: 'Build a Production-Grade AI-Augmented DevSecOps Pipeline. Real Systems. Real Security. Real Deployment.',
      date: '9 & 10 May 2026',
      time: '7:00 PM – 10:00 PM IST',
      price: '₹2,249',
      oldPrice: '₹2,499',
      offer: 'Offer valid till 28 Apr',
      tags: ['UPCOMING', 'LIMITED SEATS'],
    ),
    _Webinar(
      title: 'Docker, Kubernetes, Observability & Microservices – Beginner\'s Guide',
      desc: '4-day live program across two weekends — Docker, Kubernetes on-prem, Helm, Prometheus, Grafana.',
      date: '25, 26 Apr & 2, 3 May 2026',
      time: '7:00 PM – 9:30 PM IST',
      price: '₹3,499',
      tags: ['UPCOMING', 'LIMITED SEATS'],
    ),
    _Webinar(
      title: 'MCP + AI Platform on Kubernetes (EKS)',
      desc: 'Build a production-grade AI Control Plane on AWS EKS — Model registration, versioning, CI/CD, observability.',
      date: '11 & 12 April 2026',
      time: '7:00 PM – 10:00 PM IST',
      price: '₹2,499',
      tags: ['UPCOMING', 'LIMITED SEATS'],
    ),
  ];

  static const completed = [
    _Webinar(title: 'AWS + Kubernetes + Claude AI – Your First Production DevOps Project', date: '14 & 15 March 2026', time: '7:30 PM – 9:30 PM IST', price: '₹2,500', tags: []),
    _Webinar(title: 'Build & Deploy a Production-Grade Microservices E-Commerce Platform', date: '28 & 29 March 2026', time: '7:00 PM – 10:00 PM IST', price: '₹2,499', tags: []),
    _Webinar(title: 'Docker & Kubernetes Webinar – Live Weekend Program', date: '31 Jan, 1, 7, 8 Feb', time: '7:00 PM – 9:30 PM IST', price: '₹2,999', tags: []),
    _Webinar(title: 'Terraform Webinar – Infrastructure as Code Mastery', date: '28–31 Jan, 1 Feb', time: '8:30 AM – 9:30 AM IST', price: '₹999', tags: []),
    _Webinar(title: 'Python for DevOps 2026 – Live Weekend Webinar', date: '10, 11, 17, 18 (Two Weekends)', time: '6:00 PM – 9:00 PM IST', price: '₹1,999', tags: []),
    _Webinar(title: 'DevOps Roadmap 2026 – Complete Career Guide', date: '28th December 2025', time: '9:00–10:30 AM IST', price: '₹99', tags: []),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: QVTheme.bgSurface,
            padding: EdgeInsets.fromLTRB(
                isMobile ? 24 : 80, 110, isMobile ? 24 : 80, 50),
            child: const SectionHeader(
              label: 'LIVE & INTERACTIVE',
              title: 'Live DevOps Webinars',
              subtitle: 'Learn from industry experts in live, interactive sessions.',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionDivider(label: 'Upcoming Webinars', color: QVTheme.tealMid, live: true),
                const SizedBox(height: 16),
                ...upcoming.map((w) => _WebinarCard(w: w, done: false)),
                const SizedBox(height: 32),
                _SectionDivider(label: 'Completed Webinars', color: QVTheme.txtMuted),
                const SizedBox(height: 16),
                ...completed.map((w) => _WebinarCard(w: w, done: true)),
              ],
            ),
          ),
          const QVFooter(),
        ],
      ),
    );
  }
}

Widget _SectionDivider({required String label, required Color color, bool live = false}) =>
  Row(children: [
    Container(width: 8, height: 8,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    const SizedBox(width: 8),
    Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
  ]);

class _Webinar {
  final String title, date, time, price;
  final String? desc, oldPrice, offer;
  final List<String> tags;
  const _Webinar({
    required this.title, required this.date, required this.time,
    required this.price, required this.tags,
    this.desc, this.oldPrice, this.offer,
  });
}

class _WebinarCard extends StatelessWidget {
  final _Webinar w;
  final bool done;
  const _WebinarCard({required this.w, required this.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.circular(2),
          bottomLeft: Radius.circular(2),
        ),
        border: Border(
          left: BorderSide(
            color: done ? const Color(0xFFCCCCCC) : QVTheme.tealMid,
            width: 3,
          ),
          top: BorderSide(color: QVTheme.border),
          right: BorderSide(color: QVTheme.border),
          bottom: BorderSide(color: QVTheme.border),
        ),
      ),
      child: Opacity(
        opacity: done ? 0.7 : 1.0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!done && w.tags.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: w.tags.map((t) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: TechTag(label: t, color: QVTheme.orange),
                      )).toList()),
                    )
                  else if (done)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: QVTheme.bgSurface,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: QVTheme.border),
                        ),
                        child: Text('COMPLETED', style: QVTheme.label(color: QVTheme.txtMuted)),
                      ),
                    ),
                  Text(w.title, style: QVTheme.body(color: QVTheme.txtPrimary)
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 15)),
                  if (w.desc != null) ...[
                    const SizedBox(height: 6),
                    Text(w.desc!, style: QVTheme.bodySmall()),
                  ],
                  const SizedBox(height: 10),
                  Row(children: [
                    const Icon(Icons.calendar_today, size: 12, color: QVTheme.tealMid),
                    const SizedBox(width: 5),
                    Text(w.date, style: QVTheme.bodySmall()),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 12, color: QVTheme.tealMid),
                    const SizedBox(width: 5),
                    Text(w.time, style: QVTheme.bodySmall()),
                  ]),
                ],
              )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (w.oldPrice != null)
                    Text(w.oldPrice!, style: QVTheme.bodySmall()
                        .copyWith(decoration: TextDecoration.lineThrough)),
                  Text(w.price, style: QVTheme.h4(color: done ? QVTheme.txtMuted : QVTheme.tealMid)
                      .copyWith(fontSize: 20, letterSpacing: -0.5)),
                  if (!done) ...[
                    const SizedBox(height: 10),
                    QVButton(label: 'Learn More →', onTap: () { html.window.open('https://rzp.io/rzp/G8XGnAom', '_blank'); }, small: true),
                    if (w.offer != null) ...[
                      const SizedBox(height: 6),
                      Text(w.offer!, style: QVTheme.bodySmall(color: QVTheme.orange)),
                    ],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
