import 'dart:convert';

import 'package:flutter/foundation.dart';

class Vendor {
  final String id;
  final String name;
  final String description;
  final List<dynamic> vouchers;
  Vendor({
    required this.id,
    required this.name,
    required this.description,
    required this.vouchers,
  });

  Vendor copyWith({
    String? id,
    String? name,
    String? description,
    List<dynamic>? vouchers,
  }) {
    return Vendor(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      vouchers: vouchers ?? this.vouchers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'vouchers': vouchers,
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      vouchers: List<dynamic>.from(map['vouchers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Vendor.fromJson(String source) => Vendor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, description: $description, vouchers: $vouchers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vendor &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        listEquals(other.vouchers, vouchers);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ vouchers.hashCode;
  }
}
