import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsModel {
  final String id;
  final String name;
  final String sku;
  final String iconUrl;
  final String baseUrl;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ItemsModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.iconUrl,
    required this.baseUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ItemsModel.fromFirestore(DocumentSnapshot Doc) {
    final data = Doc.data() as Map<String, dynamic>;
    return ItemsModel(
      id: Doc.id.toString(),
      name: data['name'],
      sku: data['sku'],
      iconUrl: data['icon_url'],
      baseUrl: data['base_url'],
      status: data['status'],
      createdAt: (data['created_at'] as Timestamp).toDate(),
      updatedAt: (data['updated_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sku': sku,
      'icon_url': iconUrl,
      'base_url': baseUrl,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
