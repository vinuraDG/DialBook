// contact_manager.dart
import 'dart:convert';
import 'package:DialBook/data/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactManager {
  static final ContactManager _instance = ContactManager._internal();
  factory ContactManager() => _instance;
  ContactManager._internal();

  List<Contact> contacts = [];
  static const String _storageKey = 'contacts_list';

  // Load contacts from SharedPreferences
  Future<void> loadContacts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? contactsJson = prefs.getString(_storageKey);
      
      if (contactsJson != null) {
        final List<dynamic> decoded = json.decode(contactsJson);
        contacts = decoded.map((item) => Contact.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading contacts: $e');
    }
  }

  // Save contacts to SharedPreferences
  Future<void> saveContacts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded = json.encode(
        contacts.map((contact) => contact.toJson()).toList(),
      );
      await prefs.setString(_storageKey, encoded);
    } catch (e) {
      print('Error saving contacts: $e');
    }
  }

  // Add a new contact
  Future<void> addContact(Contact contact) async {
    contacts.add(contact);
    await saveContacts();
  }

  // Update an existing contact
  Future<void> updateContact(int index, Contact contact) async {
    if (index >= 0 && index < contacts.length) {
      contacts[index] = contact;
      await saveContacts();
    }
  }

  // Delete a contact
  Future<void> deleteContact(int index) async {
    if (index >= 0 && index < contacts.length) {
      contacts.removeAt(index);
      await saveContacts();
    }
  }

  // Toggle favorite status
  Future<void> toggleFavorite(int index) async {
    if (index >= 0 && index < contacts.length) {
      contacts[index].isFavorite = !contacts[index].isFavorite;
      await saveContacts();
    }
  }

  // Get favorite contacts
  List<Contact> getFavorites() {
    return contacts.where((contact) => contact.isFavorite).toList();
  }
}