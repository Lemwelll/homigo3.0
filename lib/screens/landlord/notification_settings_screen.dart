import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool emailNotifications = true;
  bool smsNotifications = false;
  bool pushNotifications = true;

  bool inquiryAlerts = true;
  bool rentalStatusUpdates = true;
  bool priceChangeAlerts = false;
  bool dailyDigest = true;

  bool quietHoursEnabled = false;
  String quietStart = '21:00';
  String quietEnd = '07:00';

  final List<String> times = [
    '00:00','01:00','02:00','03:00','04:00','05:00','06:00','07:00','08:00','09:00','10:00','11:00',
    '12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'General Notifications',
            children: [
              SwitchListTile(
                title: const Text('Email notifications'),
                subtitle: const Text('Receive updates via email'),
                value: emailNotifications,
                onChanged: (v) => setState(() => emailNotifications = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('SMS notifications'),
                subtitle: const Text('Get important alerts via SMS'),
                value: smsNotifications,
                onChanged: (v) => setState(() => smsNotifications = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Push notifications'),
                subtitle: const Text('Enable in-app notification banners'),
                value: pushNotifications,
                onChanged: (v) => setState(() => pushNotifications = v),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Property Alerts',
            children: [
              SwitchListTile(
                title: const Text('New inquiry alerts'),
                subtitle: const Text('Notify when renters message or inquire'),
                value: inquiryAlerts,
                onChanged: (v) => setState(() => inquiryAlerts = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Rental status updates'),
                subtitle: const Text('Updates on applications and approvals'),
                value: rentalStatusUpdates,
                onChanged: (v) => setState(() => rentalStatusUpdates = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Price change alerts'),
                subtitle: const Text('Reminders when you update pricing'),
                value: priceChangeAlerts,
                onChanged: (v) => setState(() => priceChangeAlerts = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Daily digest summary'),
                subtitle: const Text('One email per day summarizing activity'),
                value: dailyDigest,
                onChanged: (v) => setState(() => dailyDigest = v),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Quiet Hours',
            children: [
              SwitchListTile(
                title: const Text('Enable quiet hours'),
                subtitle: const Text('Mute push between selected times'),
                value: quietHoursEnabled,
                onChanged: (v) => setState(() => quietHoursEnabled = v),
              ),
              if (quietHoursEnabled) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Start'),
                        value: quietStart,
                        items: times.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                        onChanged: (v) => setState(() => quietStart = v ?? quietStart),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'End'),
                        value: quietEnd,
                        items: times.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                        onChanged: (v) => setState(() => quietEnd = v ?? quietEnd),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save_rounded),
              label: const Text('Save Preferences'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Notification preferences saved'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
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
                child: Icon(Icons.notifications_rounded, color: AppTheme.primaryColor, size: 20),
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