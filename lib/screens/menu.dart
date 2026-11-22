import 'package:flutter/material.dart';
import 'package:myportfolio_mobile/screens/experience_form.dart';
import 'package:myportfolio_mobile/screens/project_form.dart';
import 'package:myportfolio_mobile/widgets/left_drawer.dart';
import 'package:myportfolio_mobile/widgets/project_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final fullName = "Jovan Finesta";
  final npm = "2506599144";
  final pbpClass = "PBP B";

  @override
  Widget build(BuildContext context) {
  final List<ItemHomepage> items = [
    ItemHomepage("View Projects", Icons.folder, null, null),
    ItemHomepage("Add Project", Icons.add_circle, Theme.of(context).colorScheme.primary, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectFormPage(),
        ),
      );
    }),
    ItemHomepage("Add Experience", Icons.add_circle, Theme.of(context).colorScheme.secondary, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExperienceFormPage(),
        ),
      );
    }),
    ItemHomepage("Logout", Icons.logout, Colors.red, null),
  ];
  return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyPortfolio',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Horizontal row showing 3 InfoCards.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: fullName),
                  InfoCard(title: 'Class', content: pbpClass),
                ],
              ),

              const SizedBox(height: 16.0),

              // Greeting and 3-column action grid.
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to MyPortfolio Mobile!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Information card displaying a title and its associated content.
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
