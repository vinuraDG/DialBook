// contact.dart
class Contact {
  String name;
  String email;
  String phoneNumber;
  bool isFavorite;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.isFavorite = false,
  });

  // Convert Contact to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isFavorite': isFavorite,
    };
  }

  // Create Contact from JSON
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}