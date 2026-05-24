// ─── contact.js ───────────────────────────────────────────────────────────────
const express = require('express');
const Joi = require('joi');
const router = express.Router();

const contactSchema = Joi.object({
  name: Joi.string().min(2).max(100).required(),
  email: Joi.string().email().required(),
  phone: Joi.string().pattern(/^[+\d\s-]{7,15}$/).optional(),
  subject: Joi.string().min(5).max(200).required(),
  message: Joi.string().min(10).max(2000).required(),
  source: Joi.string().valid('instagram', 'linkedin', 'google', 'referral', 'other').optional(),
});

router.post('/', async (req, res) => {
  const { error, value } = contactSchema.validate(req.body);
  if (error) return res.status(400).json({ success: false, error: error.details[0].message });

  try {
    // In production: send email via nodemailer to hr@quantumvector.sh
    // For now, log and return success
    console.log('📧 Contact form submission:', {
      name: value.name,
      email: value.email,
      subject: value.subject,
      timestamp: new Date().toISOString(),
    });

    // TODO: Add nodemailer integration
    // await sendContactEmail(value);

    res.json({
      success: true,
      message: 'Thanks! We\'ll get back to you within 24 hours.',
    });
  } catch (err) {
    console.error('Contact email error:', err);
    res.status(500).json({ success: false, error: 'Failed to send message' });
  }
});

module.exports = router;
