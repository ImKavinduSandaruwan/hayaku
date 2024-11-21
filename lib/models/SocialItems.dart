import 'package:cloud_firestore/cloud_firestore.dart';

class SocialItemModel {
  final String id;
  final String name;
  final String sku;
  final String iconUrl;
  final String baseUrl;
  final bool status;

  SocialItemModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.iconUrl,
    required this.baseUrl,
    required this.status,
  });

  factory SocialItemModel.fromFirestore(DocumentSnapshot Doc) {
    final data = Doc.data() as Map<String, dynamic>;
    return SocialItemModel(
      id: data['id'].toString(),
      name: data['name'].toString(),
      sku: data['sku'].toString(),
      iconUrl: data['icon_url'].toString(),
      baseUrl: data['base_url'].toString(),
      status: data['status'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'icon_url': iconUrl,
      'base_url': baseUrl,
      'status': status,
    };
  }
}
