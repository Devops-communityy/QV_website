// ─── Course Model ────────────────────────────────────────────────────────────
class Course {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String duration;
  final String level;
  final String price;
  final List<String> tags;
  final List<String> curriculum;
  final String badge;
  final bool isFeatured;

  const Course({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.duration,
    required this.level,
    required this.price,
    required this.tags,
    required this.curriculum,
    required this.badge,
    this.isFeatured = false,
  });
}

// ─── Workshop / Webinar Model ─────────────────────────────────────────────────
class Workshop {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String date;
  final String time;
  final String duration;
  final String price;
  final String mode;
  final List<String> topics;
  final bool isUpcoming;
  final String registrationUrl;

  const Workshop({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.date,
    required this.time,
    required this.duration,
    required this.price,
    required this.mode,
    required this.topics,
    required this.registrationUrl,
    this.isUpcoming = true,
  });
}

// ─── Testimonial ──────────────────────────────────────────────────────────────
class Testimonial {
  final String name;
  final String company;
  final String role;
  final String quote;
  final int rating;

  const Testimonial({
    required this.name,
    required this.company,
    required this.role,
    required this.quote,
    this.rating = 5,
  });
}

// ─── Trainer ──────────────────────────────────────────────────────────────────
class Trainer {
  final String name;
  final String title;
  final String bio;
  final int yearsExp;
  final List<String> expertise;
  final String imagePath;

  const Trainer({
    required this.name,
    required this.title,
    required this.bio,
    required this.yearsExp,
    required this.expertise,
    required this.imagePath,
  });
}

// ─── Static Data ──────────────────────────────────────────────────────────────
class QVData {
  static const List<Course> courses = [
    Course(
      id: 'aws-devops',
      title: 'Complete AWS DevOps',
      subtitle: 'Zero to Job-Ready in 90 Days',
      description:
          'Master DevOps with AWS Cloud from scratch. Comprehensive 2–3 month program covering Linux, Docker, Kubernetes, CI/CD, and AWS services with 4 real production-grade projects.',
      duration: '2–3 Months',
      level: 'Beginner → Advanced',
      price: '₹29,999',
      badge: '🔥 Most Popular',
      isFeatured: true,
      tags: ['Linux', 'Docker', 'Kubernetes', 'AWS', 'Terraform', 'Jenkins', 'GitHub Actions'],
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
    ),
    Course(
      id: 'ai-devsecops',
      title: 'AI-Ready DevSecOps',
      subtitle: 'Security + AI in Your DevOps Pipeline',
      description:
          'Integrate AI tooling and security practices into modern DevOps pipelines. Learn DevSecOps with AWS EKS, agentic AI, MCP, and production security automation.',
      duration: '6 Weeks',
      level: 'Intermediate',
      price: '₹14,999',
      badge: '🤖 AI-Powered',
      tags: ['DevSecOps', 'AI/ML', 'AWS EKS', 'MCP', 'Agentic AI', 'Security'],
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
    ),
    Course(
      id: 'kubernetes-advanced',
      title: 'Kubernetes Mastery',
      subtitle: 'From kubeadm to Production EKS',
      description:
          'Deep-dive Kubernetes from bare-metal cluster setup to enterprise EKS management. Covers advanced networking, RBAC, StatefulSets, Helm, and observability.',
      duration: '4 Weeks',
      level: 'Intermediate → Advanced',
      price: '₹9,999',
      badge: '☸️ K8s Deep-Dive',
      tags: ['Kubernetes', 'EKS', 'Helm', 'Prometheus', 'Grafana', 'RBAC'],
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
    ),
  ];

  static const List<Workshop> workshops = [
    Workshop(
      id: 'eks-ai-workshop-2026',
      title: 'AWS + Kubernetes + Claude AI',
      subtitle: 'Your First Production DevOps Project',
      description:
          'Deploy a real microservices blog platform on Amazon EKS — live, hands-on, 2 days. Use Claude AI to write configs, debug errors, and ship faster than ever.',
      date: 'Next Batch — June 2026',
      time: '7:30 PM – 9:30 PM IST',
      duration: '2 Days',
      price: '₹2,500',
      mode: 'Live Online',
      registrationUrl: 'https://rzp.io/rzp/qvproject',
      topics: [
        'Auth + Posts + Comments microservices',
        'EKS · RDS · ALB · Route 53',
        'Claude AI for config generation',
        'Live debugging with AI assistance',
      ],
    ),
    Workshop(
      id: 'docker-k8s-obs',
      title: 'Docker + Kubernetes + Observability',
      subtitle: 'Batch QV105 — Live Cohort',
      description:
          'Intensive hands-on workshop covering Docker fundamentals through Kubernetes on EKS with full observability stack using Prometheus and Grafana.',
      date: 'Ongoing',
      time: '7:30 AM – 8:30 AM IST',
      duration: '4 Weeks',
      price: '₹4,999',
      mode: 'Live Online',
      registrationUrl: 'https://quantumvector.sh/webinars',
      topics: [
        'Docker & Container Networking',
        'kubeadm & Amazon EKS',
        'Helm 3 & GitOps with ArgoCD',
        'Prometheus + Grafana Alerting',
        'GitHub Actions CI/CD',
      ],
    ),
  ];

  static const List<Testimonial> testimonials = [
    Testimonial(
      name: 'Ravi K.',
      company: 'Capgemini',
      role: 'DevOps Engineer',
      quote: 'Switched from QA to DevOps in just a few months. The mentors were always available and the projects were exactly what interviewers asked about.',
    ),
    Testimonial(
      name: 'Priya S.',
      company: 'Infosys',
      role: 'Cloud Engineer',
      quote: 'Real projects made the difference. Landed my first DevOps job at Infosys! The EKS project on my resume got 5 interview calls in 2 weeks.',
    ),
    Testimonial(
      name: 'Sandeep M.',
      company: 'TCS',
      role: 'Site Reliability Engineer',
      quote: 'Resume help was a game changer. Got 3 MNC interviews in a month. The AI + DevOps curriculum is way ahead of what other platforms teach.',
    ),
    Testimonial(
      name: 'Anjali R.',
      company: 'Cognizant',
      role: 'DevOps Consultant',
      quote: 'Mock interviews gave me confidence to ace my Azure DevOps round. The community is incredibly supportive — even after placement.',
    ),
    Testimonial(
      name: 'Karthik V.',
      company: 'Wipro',
      role: 'Platform Engineer',
      quote: 'The Kubernetes content is the best I have found anywhere. Real kubeadm setup, EKS, Helm — not just theory. Got placed within 45 days.',
    ),
  ];

  static const List<Trainer> trainers = [
    Trainer(
      name: 'Manoj',
      title: 'Lead Trainer — DevOps & Cloud',
      bio: 'DevOps practitioner with 10+ years building and scaling cloud-native systems. Has worked with Fortune 500 companies on Kubernetes, AWS, and CI/CD transformations.',
      yearsExp: 10,
      expertise: ['Kubernetes', 'AWS', 'CI/CD', 'Terraform', 'DevSecOps'],
      imagePath: 'assets/images/trainer_manoj.png',
    ),
    Trainer(
      name: 'Sai',
      title: 'Senior Trainer — Cloud & Automation',
      bio: 'Cloud architect with 13+ years of experience across GCP, AWS, and Azure. Specializes in large-scale Kubernetes deployments and DevOps cultural transformation.',
      yearsExp: 13,
      expertise: ['Cloud Architecture', 'Ansible', 'GitOps', 'Observability', 'AI/MLOps'],
      imagePath: 'assets/images/trainer_sai.png',
    ),
  ];

  static const Map<String, String> stats = {
    '2000+': 'Engineers Trained',
    '85%': 'Placement Rate',
    '10+': 'Years Experience',
    '4': 'Real Projects',
    '50+': 'Hiring Partners',
    '98%': 'Student Satisfaction',
  };
}
