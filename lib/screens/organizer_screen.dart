import 'package:flutter/material.dart';

class OrganizerScreen extends StatefulWidget {
  const OrganizerScreen({super.key});

  @override
  State<OrganizerScreen> createState() => _OrganizerScreenState();
}

class _OrganizerScreenState extends State<OrganizerScreen> {
  bool _isFollowing = false;
  int _followersCount = 2368;
  int _selectedTab = 0; // 0: About, 1: Events, 2: Reviews
  bool _isExpanded = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followersCount += _isFollowing ? 1 : -1;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFollowing ? 'You are now following Albert Flores' : 'Unfollowed Albert Flores'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF546BF5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF546BF5), size: 26),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Organizer',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF212121),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: IconButton(
              icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF546BF5), size: 22),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar circle with BoxDecoration as in методичка
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/albert_flores.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Name
              const Text(
                'Albert Flores',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 24),

              // Statistics Row (3 columns separated by vertical dividers)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(
                    (_followersCount / 1000).toStringAsFixed(3),
                    'Followers',
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: const Color(0xFFEEEEEE),
                  ),
                  _buildStatColumn('346', 'Following'),
                  Container(
                    height: 40,
                    width: 1,
                    color: const Color(0xFFEEEEEE),
                  ),
                  _buildStatColumn('13', 'Events'),
                ],
              ),
              const SizedBox(height: 24),

              const Divider(color: Color(0xFFEEEEEE), height: 1, thickness: 1),
              const SizedBox(height: 24),

              // Action Buttons Row (Follow + Messages)
              Row(
                children: [
                  // Follow Button
                  Expanded(
                    child: InkWell(
                      onTap: _toggleFollow,
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: _isFollowing ? Colors.white : const Color(0xFF546BF5),
                          border: _isFollowing
                              ? Border.all(color: const Color(0xFF546BF5), width: 1.5)
                              : null,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: _isFollowing
                              ? null
                              : [
                                  BoxShadow(
                                    color: const Color(0xFF546BF5).withValues(alpha: 0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isFollowing ? Icons.check_rounded : Icons.person_add_alt_1_rounded,
                              color: _isFollowing ? const Color(0xFF546BF5) : Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isFollowing ? 'Following' : 'Follow',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _isFollowing ? const Color(0xFF546BF5) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Messages Button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening chat with Albert Flores...')),
                        );
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF546BF5), width: 1.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Color(0xFF546BF5),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Messages',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF546BF5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Divider(color: Color(0xFFEEEEEE), height: 1, thickness: 1),
              const SizedBox(height: 24),

              // Tabs Row: About, Events, Reviews
              Row(
                children: [
                  _buildTabButton(0, 'About'),
                  const SizedBox(width: 12),
                  _buildTabButton(1, 'Events'),
                  const SizedBox(width: 12),
                  _buildTabButton(2, 'Reviews'),
                ],
              ),
              const SizedBox(height: 28),

              // Tab Content
              if (_selectedTab == 0) _buildAboutSection(),
              if (_selectedTab == 1) _buildEventsSection(),
              if (_selectedTab == 2) _buildReviewsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF212121),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index, String label) {
    final isSelected = _selectedTab == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF546BF5) : Colors.white,
            border: isSelected ? null : Border.all(color: const Color(0xFF546BF5), width: 1.5),
            borderRadius: BorderRadius.circular(100),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF546BF5).withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF546BF5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF212121),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _isExpanded
              ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
              : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xFF616161),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Show less' : 'Read more...',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF546BF5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsSection() {
    return Column(
      children: [
        _buildInfoCard(
          title: 'International Design Summit 2025',
          date: 'Nov 12, 2025 • 10:00 AM',
          location: 'Grand Convention Hall',
          icon: Icons.event_available_rounded,
        ),
        _buildInfoCard(
          title: 'UX Workshop: Micro-interactions',
          date: 'Dec 05, 2025 • 2:00 PM',
          location: 'Online Webinar',
          icon: Icons.laptop_chromebook_rounded,
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      children: [
        _buildInfoCard(
          title: 'Sarah Jenkins',
          date: '⭐⭐⭐⭐⭐ (5.0)',
          location: '“Albert is an outstanding organizer! Everything ran smoothly.”',
          icon: Icons.rate_review_rounded,
        ),
        _buildInfoCard(
          title: 'David Miller',
          date: '⭐⭐⭐⭐⭐ (5.0)',
          location: '“Incredible energy and top-notch event production. Highly recommend!”',
          icon: Icons.rate_review_rounded,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String date,
    required String location,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEBEFFF), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF546BF5).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF546BF5), size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF546BF5),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
