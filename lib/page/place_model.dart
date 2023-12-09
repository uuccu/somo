import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel with ClusterItem {
  String id;
  String name;
  final LatLng latLng;

  String price;
  String imageUrl;
  String floor;

  PlaceModel(
      {required this.name,
      required this.latLng,
      required this.id,
      required this.price,
      required this.imageUrl,
      required this.floor});
  @override
  LatLng get location => latLng;
}
