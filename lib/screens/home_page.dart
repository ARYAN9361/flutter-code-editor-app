import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<LanguageItem> languages = [
    LanguageItem('Bash', Icons.terminal, const Color(0xFF4CAF50)),
    LanguageItem('C', Icons.code, Colors.white),
    LanguageItem('Python', Icons.code, const Color(0xFFFFEB3B)),
    LanguageItem('JavaScript', Icons.javascript, const Color(0xFFFF9800)),
    LanguageItem('Java', Icons.coffee, const Color(0xFF2196F3)),
    LanguageItem('C++', Icons.code, const Color(0xFF9C27B0)),
    LanguageItem('Swift', Icons.phone_iphone, const Color(0xFF00BCD4)),
    LanguageItem('Kotlin', Icons.android, const Color(0xFF4CAF50)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Code Editor',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white54),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Search for a language',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Popular Languages Section
            const Text(
              'Popular Languages',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Languages Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5,
              ),
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return _buildLanguageCard(languages[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageCard(LanguageItem language) {
    return GestureDetector(
      onTap: () {
        // Navigate to code editor for this language
        _showLanguageDialog(language.name);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: language.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                language.icon,
                color: language.color,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(String languageName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          title: Text(
            'Open $languageName Editor',
            style: const TextStyle(color: Colors.white),
          ),
          content: Text(
            'Would you like to open the $languageName code editor?',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white54),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Here you would navigate to the actual code editor
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Opening $languageName editor...'),
                    backgroundColor: const Color(0xFF4CAF50),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
              ),
              child: const Text(
                'Open',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LanguageItem {
  final String name;
  final IconData icon;
  final Color color;

  LanguageItem(this.name, this.icon, this.color);
}
