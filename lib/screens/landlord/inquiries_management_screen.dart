import 'package:flutter/material.dart';

class InquiriesManagementScreen extends StatefulWidget {
  const InquiriesManagementScreen({super.key});

  @override
  State<InquiriesManagementScreen> createState() => _InquiriesManagementScreenState();
}

class _InquiriesManagementScreenState extends State<InquiriesManagementScreen> {
  final List<Map<String, dynamic>> _inquiries = [
    {
      'id': '1',
      'renterName': 'John Doe',
      'propertyTitle': 'Modern Apartment in Downtown',
      'message': 'Hi, I\'m interested in viewing this property. When would be a good time?',
      'date': '2024-03-10',
      'status': 'pending',
    },
    // Add more sample inquiries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Inquiries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filtering
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search inquiries...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      // TODO: Implement search
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _inquiries.length,
              itemBuilder: (context, index) {
                final inquiry = _inquiries[index];
                return InquiryCard(inquiry: inquiry);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InquiryCard extends StatelessWidget {
  final Map<String, dynamic> inquiry;

  const InquiryCard({
    super.key,
    required this.inquiry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => InquiryDetailsDialog(inquiry: inquiry),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    inquiry['renterName'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  _buildStatusChip(inquiry['status']),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                inquiry['propertyTitle'],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                inquiry['message'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Received: ${inquiry['date']}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String label;

    switch (status.toLowerCase()) {
      case 'pending':
        color = Colors.orange;
        label = 'Pending';
        break;
      case 'responded':
        color = Colors.green;
        label = 'Responded';
        break;
      case 'declined':
        color = Colors.red;
        label = 'Declined';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}

class InquiryDetailsDialog extends StatefulWidget {
  final Map<String, dynamic> inquiry;

  const InquiryDetailsDialog({
    super.key,
    required this.inquiry,
  });

  @override
  State<InquiryDetailsDialog> createState() => _InquiryDetailsDialogState();
}

class _InquiryDetailsDialogState extends State<InquiryDetailsDialog> {
  final TextEditingController _responseController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _responseController.dispose();
    super.dispose();
  }

  void _handleResponse() {
    if (_responseController.text.isEmpty) return;

    setState(() => _isLoading = true);

    // TODO: Implement response handling
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inquiry Details',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Divider(),
            Text(
              'From: ${widget.inquiry['renterName']}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Property: ${widget.inquiry['propertyTitle']}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Message:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Text(widget.inquiry['message']),
            const SizedBox(height: 16),
            TextField(
              controller: _responseController,
              decoration: const InputDecoration(
                labelText: 'Your Response',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleResponse,
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Send Response'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}