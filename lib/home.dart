import 'package:flutter/material.dart';
import 'colors.dart';
import 'models/data.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _keyword = '';
  String _selectedCategory = 'Semua';
  final Set<int> _favoriteIds = {};

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', ...menus.map((m) => m.category).toSet()];

    final filteredMenus = menus.where((menu) {
      final matchKeyword = menu.name.toLowerCase().contains(_keyword.toLowerCase());
      final matchCategory = _selectedCategory == 'Semua' || menu.category == _selectedCategory;
      return matchKeyword && matchCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Gacoan')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari menu...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => _keyword = value);
              },
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: categories.map((category) {
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? kNavy : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: kYellow,
                    backgroundColor: Colors.white,
                    onSelected: (_) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: filteredMenus.isEmpty
                ? const Center(child: Text('Menu tidak ditemukan'))
                : ListView.builder(
                    itemCount: filteredMenus.length,
                    itemBuilder: (context, index) {
                      final menu = filteredMenus[index];
                      final isFavorite = _favoriteIds.contains(menu.id);
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Hero(
                              tag: 'menu-${menu.id}',
                              child: Image.network(
                                menu.image,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(menu.name),
                          subtitle: Text('${menu.category} • ${menu.price}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.black45,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      _favoriteIds.remove(menu.id);
                                    } else {
                                      _favoriteIds.add(menu.id);
                                    }
                                  });
                                },
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(menu: menu),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
