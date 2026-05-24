import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/qv_theme.dart';

// ─── Navbar ───────────────────────────────────────────────────────────────────
class QVNavbar extends StatelessWidget {
  const QVNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 36, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(bottom: BorderSide(color: QVTheme.border, width: 1)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.go('/'),
            child: Row(children: [
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration(
                  color: QVTheme.tealMid,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Center(child: Text('QV',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
              ),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Quantum Vector', style: QVTheme.body(color: QVTheme.txtPrimary)
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14)),
                Text('from TheDevOpsCommunity', style: QVTheme.label(color: QVTheme.teal)
                    .copyWith(fontSize: 9)),
              ]),
            ]),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink(label: 'Home', route: '/'),
            _NavLink(label: 'Courses', route: '/courses'),
            _NavLink(label: 'Webinars', route: '/webinars'),
            _NavLink(label: 'About', route: '/about'),
          ] else
            GestureDetector(
              onTap: () => _showMobileMenu(context),
              child: const Icon(Icons.menu, color: QVTheme.txtPrimary, size: 24),
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _MobileNavItem('Home', '/', context),
          _MobileNavItem('Courses', '/courses', context),
          _MobileNavItem('Webinars', '/webinars', context),
          _MobileNavItem('About', '/about', context),
          const SizedBox(height: 16),
          QVButton(
            label: 'Start Learning →',
            onTap: () { Navigator.pop(context); context.go('/courses'); },
            fullWidth: true,
          ),
        ]),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label, route;
  const _NavLink({required this.label, required this.route});
  @override State<_NavLink> createState() => _NavLinkState();
}
class _NavLinkState extends State<_NavLink> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final current = GoRouterState.of(context).matchedLocation;
    final isActive = current == widget.route || (widget.route != '/' && current.startsWith(widget.route));
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
          decoration: BoxDecoration(
            color: isActive || _hover ? QVTheme.tealBg : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(widget.label,
            style: QVTheme.body(color: isActive || _hover ? QVTheme.teal : QVTheme.txtSecond)
                .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

Widget _MobileNavItem(String label, String route, BuildContext ctx) =>
  ListTile(
    title: Text(label, style: QVTheme.h4()),
    trailing: const Icon(Icons.arrow_forward_ios, color: QVTheme.tealMid, size: 14),
    onTap: () { Navigator.pop(ctx); ctx.go(route); },
  );

// ─── Buttons ──────────────────────────────────────────────────────────────────
enum ButtonVariant { primary, outline, ghost, orange, purple }

class QVButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final ButtonVariant variant;
  final bool small, fullWidth;
  final IconData? icon;
  const QVButton({super.key, required this.label, required this.onTap,
    this.variant = ButtonVariant.primary, this.small = false,
    this.fullWidth = false, this.icon});
  @override State<QVButton> createState() => _QVButtonState();
}
class _QVButtonState extends State<QVButton> {
  bool _hover = false;

  Color get _bg => switch (widget.variant) {
    ButtonVariant.primary => _hover ? QVTheme.teal : QVTheme.tealMid,
    ButtonVariant.orange  => _hover ? const Color(0xFF7a2e15) : QVTheme.orange,
    ButtonVariant.purple  => _hover ? const Color(0xFF3C3489) : QVTheme.purple,
    _                     => _hover ? QVTheme.tealBg : Colors.transparent,
  };

  Color get _fg => switch (widget.variant) {
    ButtonVariant.primary || ButtonVariant.orange || ButtonVariant.purple => Colors.white,
    _ => QVTheme.teal,
  };

  Border? get _border => switch (widget.variant) {
    ButtonVariant.outline => Border.all(color: _hover ? QVTheme.tealMid : QVTheme.tealBorder, width: 1.5),
    _ => null,
  };

  @override
  Widget build(BuildContext context) {
    final px = widget.small ? 16.0 : 22.0;
    final py = widget.small ? 9.0 : 13.0;
    final fs = widget.small ? 12.0 : 13.0;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.fullWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(horizontal: px, vertical: py),
          decoration: BoxDecoration(
            color: _bg,
            borderRadius: BorderRadius.circular(8),
            border: _border,
          ),
          child: Row(
            mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: fs + 2, color: _fg),
                const SizedBox(width: 7),
              ],
              Text(widget.label,
                style: QVTheme.body(color: _fg).copyWith(fontWeight: FontWeight.w700, fontSize: fs)),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Section Header ────────────────────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String label, title;
  final String? subtitle;
  final bool center;
  const SectionHeader({super.key, required this.label, required this.title,
    this.subtitle, this.center = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: QVTheme.tealBg,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: QVTheme.tealBorder),
          ),
          child: Text('// $label', style: QVTheme.label()),
        ),
        const SizedBox(height: 14),
        Text(title, style: QVTheme.h3(),
            textAlign: center ? TextAlign.center : TextAlign.left),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(subtitle!, style: QVTheme.body(color: QVTheme.txtMuted),
              textAlign: center ? TextAlign.center : TextAlign.left),
        ],
      ],
    );
  }
}

// ─── Glass Card ────────────────────────────────────────────────────────────────
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool hoverable;
  final VoidCallback? onTap;
  const GlassCard({super.key, required this.child, this.padding,
    this.hoverable = false, this.onTap});
  @override State<GlassCard> createState() => _GlassCardState();
}
class _GlassCardState extends State<GlassCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) { if (widget.hoverable) setState(() => _hover = true); },
      onExit: (_) { if (widget.hoverable) setState(() => _hover = false); },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hover ? QVTheme.tealBorder : QVTheme.border,
              width: _hover ? 1.5 : 1,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

// ─── Tech Tag ──────────────────────────────────────────────────────────────────
class TechTag extends StatelessWidget {
  final String label;
  final Color? color;
  const TechTag({super.key, required this.label, this.color});
  @override
  Widget build(BuildContext context) {
    final c = color ?? QVTheme.tealMid;
    Color bg; Color bd;
    if (c == QVTheme.tealMid || c == QVTheme.teal) { bg = QVTheme.tealBg; bd = QVTheme.tealBorder; }
    else if (c == QVTheme.orange) { bg = QVTheme.orangeBg; bd = QVTheme.orangeBorder; }
    else if (c == QVTheme.blue) { bg = QVTheme.blueBg; bd = QVTheme.blueBorder; }
    else if (c == QVTheme.purple) { bg = QVTheme.purpleBg; bd = QVTheme.purpleBorder; }
    else { bg = QVTheme.tealBg; bd = QVTheme.tealBorder; }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: bd),
      ),
      child: Text(label, style: QVTheme.label(color: c)),
    );
  }
}

// ─── Stats Bar ─────────────────────────────────────────────────────────────────
class StatsBar extends StatelessWidget {
  final Map<String, String> stats;
  const StatsBar({super.key, required this.stats});
  @override
  Widget build(BuildContext context) {
    final entries = stats.entries.toList();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(horizontal: BorderSide(color: QVTheme.border)),
      ),
      child: Row(
        children: entries.map((e) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              border: entries.indexOf(e) < entries.length - 1
                  ? const Border(right: BorderSide(color: QVTheme.border))
                  : null,
            ),
            child: Column(children: [
              Text(e.key, style: QVTheme.h3(color: QVTheme.tealMid)
                  .copyWith(fontSize: 28, letterSpacing: -1)),
              const SizedBox(height: 4),
              Text(e.value, style: QVTheme.bodySmall()),
            ]),
          ),
        )).toList(),
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────
class QVFooter extends StatelessWidget {
  const QVFooter({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 36, vertical: 36),
      decoration: const BoxDecoration(
        color: QVTheme.bgSurface,
        border: Border(top: BorderSide(color: QVTheme.border)),
      ),
      child: Column(children: [
        if (!isMobile)
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(flex: 2, child: _FooterBrand()),
            const SizedBox(width: 40),
            Expanded(child: _FooterCol('Learn', [
              ('Courses', '/courses'), ('Webinars', '/webinars'),
              ('AWS DevOps', '/courses/aws-devops'), ('AI LLM Bootcamp', '/courses/ai-llm-bootcamp'),
            ])),
            Expanded(child: _FooterCol('Company', [
              ('About Us', '/about'), ('FAQ', '/about'),
              ('Contact', '/contact'),
            ])),
            Expanded(child: _FooterConnect()),
          ])
        else
          Column(children: [_FooterBrand(), const SizedBox(height: 28), _FooterConnect()]),
        const SizedBox(height: 24),
        const Divider(color: QVTheme.border),
        const SizedBox(height: 14),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('© 2026 Quantum Vector from TheDevOpsCommunity', style: QVTheme.bodySmall()),
          Text('Privacy · Terms', style: QVTheme.bodySmall()),
        ]),
      ]),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(width: 32, height: 32,
          decoration: BoxDecoration(color: QVTheme.tealMid, borderRadius: BorderRadius.circular(7)),
          child: const Center(child: Text('QV', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)))),
        const SizedBox(width: 8),
        Text('Quantum Vector', style: QVTheme.body(color: QVTheme.txtPrimary).copyWith(fontWeight: FontWeight.w700)),
      ]),
      const SizedBox(height: 12),
      Text('Empowering engineers to master AI & DevOps\nfor the modern cloud era.',
          style: QVTheme.bodySmall()),
      const SizedBox(height: 10),
      Text('📍 Kukatpally, Hyderabad', style: QVTheme.bodySmall()),
      const SizedBox(height: 4),
      Text('✉️ hr@quantumvector.sh', style: QVTheme.bodySmall(color: QVTheme.tealMid)),
    ]);
  }
}

class _FooterCol extends StatelessWidget {
  final String title;
  final List<(String, String)> links;
  const _FooterCol(this.title, this.links);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: QVTheme.body(color: QVTheme.txtPrimary).copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
      const SizedBox(height: 12),
      ...links.map((l) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          onTap: () => context.go(l.$2),
          child: Text(l.$1, style: QVTheme.bodySmall()),
        ),
      )),
    ]);
  }
}

class _FooterConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Connect', style: QVTheme.body(color: QVTheme.txtPrimary).copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
      const SizedBox(height: 12),
      Text('📸 @devops__community', style: QVTheme.bodySmall()),
      const SizedBox(height: 8),
      Text('💼 LinkedIn', style: QVTheme.bodySmall()),
      const SizedBox(height: 8),
      Text('▶️ YouTube', style: QVTheme.bodySmall()),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: QVTheme.tealBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: QVTheme.tealBorder),
        ),
        child: Text('DM "PROJECT" on Instagram\nto enroll in next cohort.',
            style: QVTheme.bodySmall(color: QVTheme.tealMid)),
      ),
    ]);
  }
}
