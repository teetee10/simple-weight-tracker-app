import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'vendor.dart';

class Incentive {
  final String id;
  final String name;
  final String description;
  final List<dynamic> vouchers;
  final Vendor vendor;
  Incentive({
    required this.id,
    required this.name,
    required this.description,
    required this.vouchers,
    required this.vendor,
  });

  Incentive copyWith({
    String? id,
    String? name,
    String? description,
    List<dynamic>? vouchers,
    Vendor? vendor,
  }) {
    return Incentive(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      vouchers: vouchers ?? this.vouchers,
      vendor: vendor ?? this.vendor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'vouchers': vouchers,
      'vendor': vendor.toMap(),
    };
  }

  factory Incentive.fromMap(Map<String, dynamic> map) {
    return Incentive(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      vouchers: List<dynamic>.from(map['vouchers']),
      vendor: Vendor.fromMap(map['vendor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Incentive.fromJson(String source) => Incentive.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Incentive(id: $id, name: $name, description: $description, vouchers: $vouchers, vendor: $vendor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Incentive &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        listEquals(other.vouchers, vouchers) &&
        other.vendor == vendor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        vouchers.hashCode ^
        vendor.hashCode;
  }
}
