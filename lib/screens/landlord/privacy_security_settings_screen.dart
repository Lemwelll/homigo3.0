import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PrivacySecuritySettingsScreen extends StatefulWidget {
  const PrivacySecuritySettingsScreen({super.key});

  @override
  State<PrivacySecuritySettingsScreen> createState() => _PrivacySecuritySettingsScreenState();
}

class _PrivacySecuritySettingsScreenState extends State<PrivacySecuritySettingsScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showPasswords = false;
  bool _updating = false;

  bool twoFAEnabled = false;
  String twoFAMethod = 'auth_app'; // 'auth_app' | 'sms'
  bool rememberDevices = true;
  bool shareAnalytics = true;
  bool marketingEmails = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy & Security'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'Change Password',
            icon: Icons.lock_outline,
            children: [
              TextField(
                controller: _oldPasswordController,
                obscureText: !_showPasswords,
                decoration: const InputDecoration(labelText: 'Current password'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _newPasswordController,
                obscureText: !_showPasswords,
                decoration: const InputDecoration(labelText: 'New password (min 8 chars)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_showPasswords,
                decoration: const InputDecoration(labelText: 'Confirm new password'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _showPasswords,
                    onChanged: (v) => setState(() => _showPasswords = v ?? _showPasswords),
                  ),
                  const Text('Show passwords'),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: _updating
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Icon(Icons.save_rounded),
                  label: Text(_updating ? 'Updating...' : 'Update Password'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _updating ? null : _updatePassword,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Two-Factor Authentication (2FA)',
            icon: Icons.verified_user_outlined,
            children: [
              SwitchListTile(
                title: const Text('Enable 2FA'),
                subtitle: const Text('Add an extra layer of security'),
                value: twoFAEnabled,
                onChanged: (v) => setState(() => twoFAEnabled = v),
              ),
              if (twoFAEnabled) ...[
                RadioListTile<String>(
                  title: const Text('Authenticator app'),
                  value: 'auth_app',
                  groupValue: twoFAMethod,
                  onChanged: (v) => setState(() => twoFAMethod = v ?? twoFAMethod),
                ),
                RadioListTile<String>(
                  title: const Text('SMS code'),
                  value: 'sms',
                  groupValue: twoFAMethod,
                  onChanged: (v) => setState(() => twoFAMethod = v ?? twoFAMethod),
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  title: const Text('Remember trusted devices'),
                  value: rememberDevices,
                  onChanged: (v) => setState(() => rememberDevices = v),
                ),
              ],
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Privacy Preferences',
            icon: Icons.privacy_tip_outlined,
            children: [
              SwitchListTile(
                title: const Text('Share anonymous analytics'),
                value: shareAnalytics,
                onChanged: (v) => setState(() => shareAnalytics = v),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('Receive marketing emails'),
                value: marketingEmails,
                onChanged: (v) => setState(() => marketingEmails = v),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Session Management',
            icon: Icons.devices_other_rounded,
            children: [
              ElevatedButton.icon(
                onPressed: _showLogoutAllDialog,
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Log out of all devices'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Save Security Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Security settings saved'),
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

  void _updatePassword() async {
    final newPwd = _newPasswordController.text.trim();
    final confirmPwd = _confirmPasswordController.text.trim();
    if (newPwd.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New password must be at least 8 characters'), backgroundColor: Colors.red),
      );
      return;
    }
    if (newPwd != confirmPwd) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New password and confirmation do not match'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _updating = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _updating = false);

    _oldPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully'), backgroundColor: Colors.green),
    );
  }

  void _showLogoutAllDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log out of all devices'),
        content: const Text('This will sign you out everywhere. Continue?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out of all devices'), backgroundColor: Colors.orange),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Confirm'),
          ),
        ],
      ),
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