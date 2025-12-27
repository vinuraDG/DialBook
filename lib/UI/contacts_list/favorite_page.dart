// favorite_page.dart
import 'package:DialBook/UI/contacts_list/contact_details_page.dart';
import 'package:DialBook/UI/contacts_list/widget/contact_manager.dart';
import 'package:DialBook/UI/contacts_list/widget/contact_tile.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteContacts = ContactManager().getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: favoriteContacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    size: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No Favorite Contacts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Add contacts to favorites by tapping\nthe star icon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: favoriteContacts.length,
                itemBuilder: (context, index) {
                  final contact = favoriteContacts[index];
                  final actualIndex = ContactManager().contacts.indexOf(contact);

                  return ContactTile(
                    contact: contact,
                    onFavoriteToggle: () async {
                      await ContactManager().toggleFavorite(actualIndex);
                      setState(() {});
                    },
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactDetailsPage(
                            contact: contact,
                            contactIndex: actualIndex,
                          ),
                        ),
                      );
                      setState(() {});
                    },
                  );
                },
              ),
            ),
    );
  }
}