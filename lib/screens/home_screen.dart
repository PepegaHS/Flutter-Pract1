import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/user_header.dart';
import '../widgets/section_header.dart';
import '../widgets/weekly_task_card.dart';
import '../widgets/today_task_card.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class TaskItem {
  final String title;
  final String subtitle;
  final String date;
  final List<String> avatars;
  final String extraCount;
  bool isCompleted;

  TaskItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.avatars,
    required this.extraCount,
    this.isCompleted = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<TaskItem> _todayTasks = [
    TaskItem(
      title: 'Design 2 App Screens',
      subtitle: 'Crypto Wallet App',
      date: 'Mon, 10 July 2022',
      avatars: [
        'assets/images/avatar5.png',
        'assets/images/avatar6.png',
      ],
      extraCount: '1+',
      isCompleted: true,
    ),
    TaskItem(
      title: 'Design Homepage',
      subtitle: 'Water Company Website',
      date: 'Mon, 10 July 2022',
      avatars: [
        'assets/images/avatar2.png',
        'assets/images/avatar7.png',
      ],
      extraCount: '1+',
      isCompleted: false,
    ),
  ];

  void _toggleTask(int index) {
    setState(() {
      _todayTasks[index].isCompleted = !_todayTasks[index].isCompleted;
    });
  }

  void _onNavTapped(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: Navigator.canPop(context)
          ? AppBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile header
              UserHeader(
                onSearchTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search tapped')),
                  );
                },
                onNotificationTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications tapped')),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Section: My Weekly Tasks
              SectionHeader(
                title: 'My Weekly Tasks',
                subtitle: '18 Tasks Pending',
                onFilterTap: () {},
                onPlusTap: () {},
              ),
              const SizedBox(height: 16),

              // Horizontal list of Weekly Tasks
              SizedBox(
                height: 235,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  children: [
                    WeeklyTaskCard(
                      tagTitle: 'UI/UX Design',
                      tagTextColor: AppColors.tagPurpleText,
                      tagBgColor: AppColors.tagPurpleBg,
                      priorityTitle: 'High',
                      priorityTextColor: AppColors.priorityHighText,
                      priorityBgColor: AppColors.priorityHighBg,
                      taskTitle: 'Create a Landing Page',
                      avatars: const [
                        'assets/images/avatar1.png',
                        'assets/images/avatar2.png',
                      ],
                      extraCount: '3+',
                      dateText: 'Mon, 12 July 2022',
                      onTap: () {},
                    ),
                    WeeklyTaskCard(
                      tagTitle: 'Development',
                      tagTextColor: AppColors.tagOrangeText,
                      tagBgColor: AppColors.tagOrangeBg,
                      priorityTitle: 'Low',
                      priorityTextColor: AppColors.priorityLowText,
                      priorityBgColor: AppColors.priorityLowBg,
                      taskTitle: 'Develop a Website',
                      avatars: const [
                        'assets/images/avatar3.png',
                        'assets/images/avatar4.png',
                      ],
                      extraCount: '2+',
                      dateText: 'Mon, 30 July 2022',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Section: Today's Tasks
              SectionHeader(
                title: 'Today’s Tasks',
                subtitle: '18 Tasks Pending',
                onFilterTap: () {},
                onPlusTap: () {},
              ),
              const SizedBox(height: 16),

              // List of Today's Tasks
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _todayTasks.length,
                itemBuilder: (context, index) {
                  final task = _todayTasks[index];
                  return TodayTaskCard(
                    title: task.title,
                    category: task.subtitle,
                    dateText: task.date,
                    isCompleted: task.isCompleted,
                    avatars: task.avatars,
                    extraCount: task.extraCount,
                    onToggleCompleted: () => _toggleTask(index),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentNavIndex,
        onItemSelected: _onNavTapped,
      ),
    );
  }
}
