import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'meditate_screen.dart';
import 'wallet_screen.dart';
import 'organizer_screen.dart';

class TemplateCatalogScreen extends StatelessWidget {
  const TemplateCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text(
          'Figma Templates',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E1E1E),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Выберите макет для просмотра:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF616161),
                ),
              ),
            ),

            // Template 1: Task Manager (Page 1, node 1:1229)
            _buildTemplateCard(
              context: context,
              title: '1. Task Manager (Крайний правый, Стр. 1)',
              subtitle: 'Еженедельные и ежедневные задачи с бейджами, аватарами и навигацией',
              nodeId: '1:1229',
              badgeColor: const Color(0xFF577CFF),
              icon: Icons.task_alt_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),

            // Template 2: Mind Deep Relax (Page 1, node 1:523)
            _buildTemplateCard(
              context: context,
              title: '2. Mind Deep Relax (Второй слева, Стр. 1)',
              subtitle: 'Медитация: баннер, автор, кнопка воспроизведения и плейлист сессий',
              nodeId: '1:523',
              badgeColor: const Color(0xFF039EA2),
              icon: Icons.self_improvement_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MeditateScreen()),
                );
              },
            ),

            // Template 3: My E-Wallet (Page 2, node 1507:1100)
            _buildTemplateCard(
              context: context,
              title: '3. My E-Wallet (Третий, Стр. 2)',
              subtitle: 'Карта баланса, пополнение, история транзакций и навигация',
              nodeId: '1507:1100',
              badgeColor: const Color(0xFF212121),
              icon: Icons.account_balance_wallet_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WalletScreen()),
                );
              },
            ),

            // Template 4: Organizer Profile (Page 2, node 1507:1119)
            _buildTemplateCard(
              context: context,
              title: '4. Organizer (Четвёртый, Стр. 2)',
              subtitle: 'Профиль Альберта Флореса, счётчики, кнопки Follow/Messages и вкладки',
              nodeId: '1507:1119',
              badgeColor: const Color(0xFF546BF5),
              icon: Icons.person_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrganizerScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplateCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String nodeId,
    required Color badgeColor,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    // Built using Container + BoxDecoration + padding + margin exactly as in методичка
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
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
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: badgeColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Node: $nodeId',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF616161),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: badgeColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Открыть шаблон',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
