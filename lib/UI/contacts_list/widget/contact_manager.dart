import 'package:contacts_app/data/contact.dart';

class ContactManager {
  static final ContactManager _instance = ContactManager._internal();
  
  factory ContactManager() {
    return _instance;
  }
  
  ContactManager._internal();
  
  List<Contact> contacts = [];
}