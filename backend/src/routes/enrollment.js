// ─── enrollment.js ────────────────────────────────────────────────────────────
const express = require('express');
const Joi = require('joi');
const router = express.Router();

const enrollmentSchema = Joi.object({
  name: Joi.string().min(2).max(100).required(),
  email: Joi.string().email().required(),
  phone: Joi.string().pattern(/^[+\d\s-]{7,15}$/).required(),
  courseId: Joi.string().required(),
  experience: Joi.string().valid('fresher', '0-1', '1-3', '3-5', '5+').required(),
  currentRole: Joi.string().max(100).optional(),
  referralCode: Joi.string().max(20).optional(),
  message: Joi.string().max(500).optional(),
});

router.post('/', async (req, res) => {
  const { error, value } = enrollmentSchema.validate(req.body);
  if (error) return res.status(400).json({ success: false, error: error.details[0].message });

  try {
    console.log('🎓 New enrollment inquiry:', {
      name: value.name,
      email: value.email,
      courseId: value.courseId,
      timestamp: new Date().toISOString(),
    });

    // TODO: 
    // 1. Send confirmation email to student
    // 2. Notify team via email/Slack/WhatsApp
    // 3. Store in database
    // 4. Redirect to Razorpay payment page

    res.json({
      success: true,
      message: 'Enrollment inquiry received! Our team will WhatsApp you within 2 hours.',
      data: {
        enrollmentId: `QV-${Date.now()}`,
        nextStep: 'Check WhatsApp for payment link',
        supportEmail: 'hr@quantumvector.sh',
      },
    });
  } catch (err) {
    console.error('Enrollment error:', err);
    res.status(500).json({ success: false, error: 'Enrollment failed, please try again' });
  }
});

module.exports = router;
