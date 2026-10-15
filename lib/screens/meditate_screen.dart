import 'package:flutter/material.dart';
import '../widgets/session_tile.dart';
import 'home_screen.dart';

class SessionItem {
  final String title;
  final String subtitle;
  final String iconPath;

  const SessionItem({
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });
}

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  int? _currentPlayingIndex;
  bool _isPlaying = false;

  final List<SessionItem> _sessions = const [
    SessionItem(
      title: 'Sweet Memories',
      subtitle: 'December 29 Pre-Launch',
      iconPath: 'assets/images/cell_play_1.svg',
    ),
    SessionItem(
      title: 'A Day Dream',
      subtitle: 'December 29 Pre-Launch',
      iconPath: 'assets/images/cell_play_2.svg',
    ),
    SessionItem(
      title: 'Mind Explore',
      subtitle: 'December 29 Pre-Launch',
      iconPath: 'assets/images/cell_play_3.svg',
    ),
  ];

  void _togglePlayNext() {
    setState(() {
      if (_currentPlayingIndex == null) {
        _currentPlayingIndex = 0;
        _isPlaying = true;
      } else {
        _isPlaying = !_isPlaying;
      }
    });

    final currentTitle = _sessions[_currentPlayingIndex ?? 0].title;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isPlaying ? 'Playing: $currentTitle' : 'Paused: $currentTitle'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF039EA2),
      ),
    );
  }

  void _onSessionTap(int index) {
    setState(() {
      if (_currentPlayingIndex == index) {
        _isPlaying = !_isPlaying;
      } else {
        _currentPlayingIndex = index;
        _isPlaying = true;
      }
    });

    final title = _sessions[index].title;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isPlaying ? 'Playing: $title' : 'Paused: $title'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF039EA2),
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
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1E1E1E)),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: [
          IconButton(
            tooltip: 'Switch to Task Manager Template',
            icon: const Icon(Icons.dashboard_outlined, color: Color(0xFF1E1E1E)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner Illustration
              Container(
                width: double.infinity,
                height: 231,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/meditate_banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Author Tag (Peter Mach)
              Text(
                'Peter Mach',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withValues(alpha: 0.5),
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 6),

              // Title (Mind Deep Relax)
              const Text(
                'Mind Deep Relax',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 10),

              // Description
              const Text(
                'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1E1E1E),
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),

              // Action Button: Play Next Session
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _togglePlayNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF039EA2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isPlaying ? 'Pause Session' : 'Play Next Session',
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sessions List (DetailedTableView)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _sessions.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFFEBEBEB),
                ),
                itemBuilder: (context, index) {
                  final session = _sessions[index];
                  final isItemPlaying = _isPlaying && _currentPlayingIndex == index;
                  return SessionTile(
                    title: session.title,
                    subtitle: session.subtitle,
                    iconPath: session.iconPath,
                    isPlaying: isItemPlaying,
                    onTap: () => _onSessionTap(index),
                    onMoreTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Options for "${session.title}"'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
