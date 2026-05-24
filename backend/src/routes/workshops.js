// ─── workshops.js ─────────────────────────────────────────────────────────────
const express = require('express');
const router = express.Router();

const workshops = [
  {
    id: 'eks-ai-workshop-2026',
    title: 'AWS + Kubernetes + Claude AI',
    subtitle: 'Your First Production DevOps Project',
    description: 'Deploy a real microservices blog platform on Amazon EKS — live, hands-on, 2 days.',
    date: 'Next Batch — June 2026',
    startDate: '2026-06-14',
    endDate: '2026-06-15',
    time: '7:30 PM – 9:30 PM IST',
    duration: '2 Days',
    price: 2500,
    currency: 'INR',
    mode: 'Live Online',
    maxSeats: 40,
    seatsLeft: 12,
    isUpcoming: true,
    registrationUrl: 'https://rzp.io/rzp/qvproject',
    topics: [
      'Auth + Posts + Comments microservices',
      'EKS · RDS · ALB · Route 53',
      'Claude AI for config generation',
      'Live debugging with AI assistance',
    ],
    prerequisites: ['Basic Linux knowledge', 'AWS account (free tier OK)'],
  },
  {
    id: 'docker-k8s-obs-qv105',
    title: 'Docker + Kubernetes + Observability',
    subtitle: 'Batch QV105 — Live Cohort',
    description: 'Intensive hands-on workshop: Docker through EKS with full observability stack.',
    date: 'Ongoing',
    time: '7:30 AM – 8:30 AM IST',
    duration: '4 Weeks',
    price: 4999,
    currency: 'INR',
    mode: 'Live Online',
    maxSeats: 60,
    seatsLeft: 8,
    isUpcoming: true,
    registrationUrl: 'https://quantumvector.sh/webinars',
    topics: [
      'Docker & Container Networking',
      'kubeadm & Amazon EKS',
      'Helm 3 & GitOps with ArgoCD',
      'Prometheus + Grafana Alerting',
      'GitHub Actions CI/CD',
    ],
    prerequisites: ['Basic Linux', 'Basic Docker knowledge helpful'],
  },
];

router.get('/', (req, res) => {
  const { upcoming } = req.query;
  let result = [...workshops];
  if (upcoming === 'true') result = result.filter(w => w.isUpcoming);
  res.json({ success: true, count: result.length, data: result });
});

router.get('/:id', (req, res) => {
  const ws = workshops.find(w => w.id === req.params.id);
  if (!ws) return res.status(404).json({ success: false, error: 'Workshop not found' });
  res.json({ success: true, data: ws });
});

module.exports = router;
