const express = require('express');
const router = express.Router();

// ─── Course Data (replace with DB in production) ──────────────────────────────
const courses = [
  {
    id: 'aws-devops',
    title: 'Complete AWS DevOps Course',
    subtitle: 'Zero to Job-Ready in 90 Days',
    description: 'Master DevOps with AWS Cloud from scratch. 2–3 month program covering Linux, Docker, Kubernetes, CI/CD, and AWS services with 4 real production-grade projects.',
    duration: '2-3 Months',
    level: 'Beginner → Advanced',
    price: 29999,
    currency: 'INR',
    badge: '🔥 Most Popular',
    isFeatured: true,
    startDate: '2026-06-01',
    schedule: '7:30 AM – 8:30 AM IST (Mon–Sat)',
    mode: ['Online', 'Offline (Hyderabad)'],
    tags: ['Linux', 'Docker', 'Kubernetes', 'AWS', 'Terraform', 'Jenkins', 'GitHub Actions', 'ArgoCD'],
    curriculum: [
      'Linux Fundamentals & Shell Scripting',
      'Docker & Container Architecture',
      'Kubernetes & Amazon EKS',
      'CI/CD with Jenkins & GitHub Actions',
      'Infrastructure as Code with Terraform',
      'AWS Core Services (EC2, S3, RDS, VPC)',
      'Monitoring with Prometheus & Grafana',
      'ArgoCD & GitOps',
      'Resume & Interview Preparation',
    ],
    projects: [
      'Containerized Microservices on EKS',
      'End-to-end CI/CD Pipeline with GitHub Actions',
      'Infrastructure as Code with Terraform',
      'Observability Stack with Prometheus + Grafana',
    ],
    includes: ['Lifetime access to recordings', 'Resume review', 'Mock interviews', '1:1 mentorship', 'WhatsApp community access'],
    registrationUrl: 'https://quantumvector.sh/courses/aws-devops',
    createdAt: '2026-01-01',
    updatedAt: '2026-05-01',
  },
  {
    id: 'ai-devsecops',
    title: 'AI-Ready DevSecOps',
    subtitle: 'Security + AI in Your DevOps Pipeline',
    description: 'Integrate AI tooling and security practices into modern DevOps pipelines. Learn DevSecOps with AWS EKS, agentic AI, MCP, and production security automation.',
    duration: '6 Weeks',
    level: 'Intermediate',
    price: 14999,
    currency: 'INR',
    badge: '🤖 AI-Powered',
    isFeatured: false,
    startDate: '2026-06-15',
    schedule: '7:30 PM – 9:00 PM IST (Tue, Thu, Sat)',
    mode: ['Online'],
    tags: ['DevSecOps', 'AI/ML', 'AWS EKS', 'MCP', 'Agentic AI', 'Vault', 'SAST', 'DAST'],
    curriculum: [
      'DevSecOps Principles & Culture',
      'SAST / DAST / SCA in CI/CD',
      'Container & Kubernetes Security',
      'AI-Assisted Ops with Claude & MCP',
      'Agentic AI in DevOps Workflows',
      'Secrets Management (Vault, AWS SM)',
      'Compliance as Code',
      'Production Security Playbooks',
    ],
    projects: [
      'Secure CI/CD Pipeline with AI-generated configs',
      'MCP-integrated DevOps automation agent',
    ],
    includes: ['Lifetime access to recordings', 'Security checklist templates', 'AI tools access', 'Community support'],
    registrationUrl: 'https://quantumvector.sh/courses/ai-devsecops',
    createdAt: '2026-02-01',
    updatedAt: '2026-05-01',
  },
  {
    id: 'kubernetes-mastery',
    title: 'Kubernetes Mastery',
    subtitle: 'From kubeadm to Production EKS',
    description: 'Deep-dive Kubernetes from bare-metal cluster setup to enterprise EKS management. Covers advanced networking, RBAC, StatefulSets, Helm, and observability.',
    duration: '4 Weeks',
    level: 'Intermediate → Advanced',
    price: 9999,
    currency: 'INR',
    badge: '☸️ K8s Deep-Dive',
    isFeatured: false,
    startDate: '2026-07-01',
    schedule: '7:30 AM – 8:30 AM IST (Mon–Sat)',
    mode: ['Online'],
    tags: ['Kubernetes', 'EKS', 'Helm', 'Prometheus', 'Grafana', 'RBAC', 'ArgoCD'],
    curriculum: [
      'kubeadm Cluster Setup (AL2023)',
      'Networking: CNI, Services, Ingress',
      'RBAC & Security Contexts',
      'StatefulSets, PV/PVC',
      'Helm 3 Charts & Repositories',
      'Monitoring: Prometheus + Grafana',
      'Amazon EKS Deep-Dive',
      'Production Upgrade Strategies',
    ],
    projects: ['Self-managed K8s cluster', 'EKS production deployment with full observability'],
    includes: ['Lifetime access', 'Cluster setup scripts', 'Helm chart templates'],
    registrationUrl: 'https://quantumvector.sh/courses/kubernetes-mastery',
    createdAt: '2026-03-01',
    updatedAt: '2026-05-01',
  },
];

// ─── GET /api/courses ─────────────────────────────────────────────────────────
router.get('/', (req, res) => {
  const { level, tag, featured } = req.query;
  let result = [...courses];

  if (featured === 'true') result = result.filter(c => c.isFeatured);
  if (level) result = result.filter(c => c.level.toLowerCase().includes(level.toLowerCase()));
  if (tag) result = result.filter(c => c.tags.some(t => t.toLowerCase().includes(tag.toLowerCase())));

  res.json({
    success: true,
    count: result.length,
    data: result,
  });
});

// ─── GET /api/courses/:id ─────────────────────────────────────────────────────
router.get('/:id', (req, res) => {
  const course = courses.find(c => c.id === req.params.id);
  if (!course) return res.status(404).json({ success: false, error: 'Course not found' });
  res.json({ success: true, data: course });
});

module.exports = router;
