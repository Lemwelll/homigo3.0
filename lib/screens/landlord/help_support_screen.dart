import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final _bugDescriptionController = TextEditingController();

  @override
  void dispose() {
    _bugDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'FAQs for Landlords',
            icon: Icons.help_outline,
            children: [
              _faq('How do I list a property?',
                  'Go to Properties > Add Property, fill in all details including pricing, photos, and availability, then publish.'),
              _faq('How do I manage renter inquiries?',
                  'Check the Inquiries section on your dashboard. You can reply, schedule viewings, or mark as resolved.'),
              _faq('Can I edit pricing later?',
                  'Yes. Open the property, click Edit, adjust the price and save. Tenants following the listing will be notified.'),
              _faq('What documents are required?',
                  'Typically proof of ownership and compliance certificates. Requirements vary by region.'),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Contact Support',
            icon: Icons.support_agent_rounded,
            children: [
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text('Email'),
                subtitle: const Text('support@homigo.com'),
                trailing: TextButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(const ClipboardData(text: 'support@homigo.com'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Support email copied to clipboard')),
                    );
                  },
                  icon: const Icon(Icons.copy_rounded),
                  label: const Text('Copy'),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.forum_outlined),
                title: const Text('Live chat'),
                subtitle: const Text('Chat support coming soon'),
                trailing: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Live chat is not available yet')), 
                    );
                  },
                  child: const Text('Notify me'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Report a Bug',
            icon: Icons.bug_report_outlined,
            children: [
              TextField(
                controller: _bugDescriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Describe the issue',
                  hintText: 'Steps to reproduce, expected behavior, screenshots (optional)'
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _bugDescriptionController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Thanks! Your report has been submitted')),
                    );
                  },
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Submit Report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _faq(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      children: [Text(answer, style: TextStyle(color: Colors.grey[800]))],
    );
  }

  Widget _buildSection({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppTheme.primaryColor, size: 20),
              ),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}