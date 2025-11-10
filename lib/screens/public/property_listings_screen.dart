import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class PropertyListingsScreen extends StatefulWidget {
  const PropertyListingsScreen({super.key});

  @override
  State<PropertyListingsScreen> createState() => _PropertyListingsScreenState();
}

class _PropertyListingsScreenState extends State<PropertyListingsScreen> {
  String selectedPriceFilter = '';
  String selectedLocation = '';
  final TextEditingController _searchController = TextEditingController();
  
  final List<Map<String, dynamic>> _properties = [
    {
      'id': '1',
      'title': 'Bonifacio High Street - BGC',
      'subtitle': 'Explore Shopping Mall',
      'location': 'Taguig',
      'price': '₱15,000',
      'type': 'Condo',
      'imageUrl': 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Aircon', 'Kitchen', 'Parking'],
      'university': 'Near BGC Universities',
    },
    {
      'id': '2', 
      'title': 'Far Eastern University (FEU)',
      'subtitle': 'Explore University',
      'location': 'Manila',
      'price': '₱8,000',
      'type': 'Dorm',
      'imageUrl': 'https://images.unsplash.com/photo-1562774053-701939374585?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Study Hub', 'Cafeteria'],
      'university': 'FEU Campus',
    },
    {
      'id': '3',
      'title': 'De La Salle University Manila',
      'subtitle': 'Explore School',
      'location': 'Manila',
      'price': '₱12,000',
      'type': 'Apartment',
      'imageUrl': 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Aircon', 'Study Hub', 'Elevator'],
      'university': 'DLSU Campus',
    },
    {
      'id': '4',
      'title': 'University of Santo Tomas (UST)',
      'subtitle': 'Explore University',
      'location': 'Manila',
      'price': '₱10,000',
      'type': 'Dorm',
      'imageUrl': 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Study Hub', 'Cafeteria', 'Library'],
      'university': 'UST Campus',
    },
    {
      'id': '5',
      'title': 'University of the Philippines Manila (UPM)',
      'subtitle': 'Explore School',
      'location': 'Manila',
      'price': '₱9,500',
      'type': 'Apartment',
      'imageUrl': 'https://images.unsplash.com/photo-1607237138185-eedd9c632b0b?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Study Hub', 'Kitchen', 'Parking'],
      'university': 'UP Manila',
    },
    {
      'id': '6',
      'title': 'Polytechnic University of the Philippines (PUP)',
      'subtitle': 'Explore School',
      'location': 'Manila',
      'price': '₱7,500',
      'type': 'Dorm',
      'imageUrl': 'https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=400&h=300&fit=crop',
      'features': ['WiFi', 'Study Hub', 'Cafeteria'],
      'university': 'PUP Campus',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Modern Header with Dormy branding
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Homigo',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                        ],
                      ),
                      // Responsive navigation buttons
                      MediaQuery.of(context).size.width > 800 
                        ? Row(
                            children: [
                              TextButton(
                                onPressed: () => context.push('/properties'),
                                child: const Text(
                                  'Find Rentals',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () => context.push('/about'),
                                child: const Text(
                                  'About Us',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () => context.push('/how-it-works'),
                                child: const Text(
                                  'How It Works',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () => context.push('/landlord/signup'),
                                child: const Text(
                                  'Post My Property',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                      onTap: () => _showAccountOptions(context),
                                  child: const Text(
                                    'Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                   ],
                                 ),
                               ),
                             ],
                           )
                         : // Mobile menu button
                           IconButton(
                             onPressed: () => _showMobileMenu(context),
                             icon: const Icon(
                               Icons.menu,
                               color: Color(0xFF6B7280),
                             ),
                           ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Modern Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'Where do you want to stay?',
                              hintStyle: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 16,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF6B7280),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Quick Links
                  Row(
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: Color(0xFF3B82F6),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Trending Rentals',
                        style: TextStyle(
                          color: Color(0xFF3B82F6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.search,
                        color: Color(0xFF6B7280),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Advanced Search',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.map,
                        color: Color(0xFF6B7280),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'View Maps',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.security,
                        color: Color(0xFF6B7280),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Safety Guidelines',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Price Filter Section
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filter by Price Range',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPriceFilter('₱', 'Below ₱5,000', '₱5,000'),
                        _buildPriceFilter('₱₱', '₱5,000-₱10,000', '₱10,000'),
                        _buildPriceFilter('₱₱₱', '₱10,000-₱30,000', '₱30,000'),
                        _buildPriceFilter('₱₱₱₱', 'Above ₱30,000', '₱50,000+'),
                        _buildAmenityFilter('Wifi / Internet', Icons.wifi),
                        _buildAmenityFilter('Aircon', Icons.ac_unit),
                        _buildAmenityFilter('Refrigerator', Icons.kitchen),
                        _buildAmenityFilter('Kitchen', Icons.restaurant),
                        _buildAmenityFilter('Parking', Icons.local_parking),
                        _buildAmenityFilter('Elevator', Icons.elevator),
                        _buildAmenityFilter('Study Hub', Icons.school),
                        _buildAmenityFilter('KTV Room', Icons.mic),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF8F9FA),
                child: AnimationLimiter(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(context),
                      childAspectRatio: _getChildAspectRatio(context),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _properties.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        columnCount: _getCrossAxisCount(context),
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: ModernPropertyCard(property: _properties[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceFilter(String symbol, String label, String value) {
    final isSelected = selectedPriceFilter == value;
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPriceFilter = isSelected ? '' : value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
            border: Border.all(
              color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFFE5E7EB),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                symbol,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmenityFilter(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          // TODO: Implement amenity filtering
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: const Color(0xFF6B7280),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Responsive helper methods
  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return 4;
    if (screenWidth > 800) return 3;
    if (screenWidth > 600) return 2;
    return 1;
  }

  double _getChildAspectRatio(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 800) return 0.85;
    if (screenWidth > 600) return 0.9;
    return 1.1;
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.search, color: Color(0xFF3B82F6)),
                title: const Text('Find Rentals'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/properties');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF3B82F6)),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Color(0xFF3B82F6)),
                title: const Text('How It Works'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/how-it-works');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_home, color: Color(0xFF3B82F6)),
                title: const Text('Post My Property'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/landlord/signup');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showAccountOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Choose Account Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF3B82F6)),
                title: const Text('Renter Account'),
                subtitle: const Text('Looking for a place to rent'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/renter/login');
                },
              ),
              ListTile(
                leading: const Icon(Icons.business, color: Color(0xFF059669)),
                title: const Text('Landlord Account'),
                subtitle: const Text('I have properties to rent'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/landlord/login');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class ModernPropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const ModernPropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => PropertyDetailsDialog(property: property),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFF3B82F6).withOpacity(0.8),
                            const Color(0xFF1E40AF).withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Image.network(
                        property['imageUrl'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            child: const Icon(
                              Icons.home,
                              size: 48,
                              color: Color(0xFF3B82F6),
                            ),
                          );
                        },
                      ),
                    ),
                    // Overlay with university info
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          property['type'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ),
                    ),
                    // Price overlay
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF059669),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          property['price'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Property Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      property['subtitle'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            property['location'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Features
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: (property['features'] as List<String>)
                          .take(3)
                          .map((feature) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  feature,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF3B82F6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Color(0xFF3B82F6)),
                title: const Text('Find Rentals'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/properties');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF3B82F6)),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Color(0xFF3B82F6)),
                title: const Text('How It Works'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/how-it-works');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_home, color: Color(0xFF3B82F6)),
                title: const Text('Post My Property'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/landlord/signup');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF3B82F6)),
                title: const Text('Account'),
                onTap: () {
                  Navigator.pop(context);
                  _showAccountOptions(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showAccountOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Choose Account Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.search, color: Color(0xFF10B981)),
                ),
                title: const Text('I\'m looking for a place'),
                subtitle: const Text('Sign in as a renter'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/renter/login');
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.business, color: Color(0xFF3B82F6)),
                ),
                title: const Text('I have a property to rent'),
                subtitle: const Text('Sign in as a landlord'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/landlord/login');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class PropertyDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyDetailsDialog({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Header with Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      property['imageUrl'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFF3B82F6).withOpacity(0.8),
                                const Color(0xFF1E40AF).withOpacity(0.8),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.home,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Close button
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                // Property type badge
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      property['type'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ),
                ),
                // Price badge
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF059669),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      property['price'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Property Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property['title'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      property['subtitle'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                          color: Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          property['location'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.school,
                          size: 20,
                          color: Color(0xFF3B82F6),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          property['university'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B82F6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Amenities & Features',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (property['features'] as List<String>)
                          .map((feature) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFF3B82F6).withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  feature,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF3B82F6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const Spacer(),
                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: Color(0xFF3B82F6)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'View More Details',
                              style: TextStyle(
                                color: Color(0xFF3B82F6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.push('/renter/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3B82F6),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Contact Owner',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}