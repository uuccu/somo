import 'dart:async';
import 'dart:ui';

import 'package:agile_frontend/page/home_information.dart';
import 'package:agile_frontend/page/place_model.dart';
import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/firebase_storage.dart';
import 'package:agile_frontend/util/device/screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.567975, 104.890669),
    zoom: 12.4746,
  );

  double _zoom = 14.4746;
  Set<Marker> markers = <Marker>{};
  bool _showPanel = false;
  Widget _panel = const SizedBox();
// cluster
  late ClusterManager clusterManager;
  List<PlaceModel> placeList = <PlaceModel>[];

  @override
  void initState() {
    super.initState();
    final houseData =
        Provider.of<HouseDataProviderService>(context, listen: false);

    if (placeList.isEmpty) {
      for (var house in houseData.houses) {
        placeList.add(
          PlaceModel(
            id: house.id,
            name: house.name,
            latLng: LatLng(
              house.location.latitude,
              house.location.longitude,
            ),
            price: house.price,
            imageUrl: house.imageUrl,
            floor: house.floor,
          ),
        );
      }
    }

    clusterManager = _initClusterManager();
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      this.markers = markers;
    });
  }

  Future<Marker> Function(Cluster<PlaceModel>) get markerBuilder =>
      (cluster) async {
        int length = cluster.count;
        int size = Screen.designToScreenHeight(context, 50).toInt();
        return Marker(
            markerId: MarkerId(cluster.isMultiple
                ? cluster.getId()
                : cluster.items.single.id.toString()),
            position: cluster.location,
            icon: await getMarkerBitmap(size, size.toDouble(),
                text: length.toString()),
            infoWindow: const InfoWindow(),
            onTap: () {
              _showPanel = true;
              _panel = SlidingUpPanel(
                  minHeight: Screen.designToScreenHeight(context, 100),
                  maxHeight: Screen.designToScreenHeight(context, 600),
                  panelBuilder: (ScrollController sc) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Screen.designToScreenHeight(
                                      context, 10))),
                          Container(
                              width: Screen.designToScreenWidth(context, 81),
                              height: Screen.designToScreenHeight(context, 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Screen.designToScreenHeight(
                                      context, 10))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all<Size>(Size(
                                    Screen.designToScreenWidth(context, 190),
                                    Screen.designToScreenHeight(context, 40),
                                  )),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                          color:
                                              Color.fromRGBO(254, 142, 72, 1))),
                                  alignment: Alignment.center,
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(254, 142, 72, 1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                                ),
                                child: Text("$length rooms are founded"),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: Screen.designToScreenWidth(
                                          context, 11))),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _showPanel = false;
                                  });
                                },
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all<Size>(Size(
                                    Screen.designToScreenWidth(context, 190),
                                    Screen.designToScreenHeight(context, 40),
                                  )),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(color: Colors.grey)),
                                  alignment: Alignment.center,
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                                ),
                                child: const Text("search again"),
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      Screen.designToScreenHeight(context, 9))),
                          Expanded(
                              child: ListView(
                            controller: sc,
                            shrinkWrap: true,
                            children: cluster.items
                                .map((e) => _buildHouseItem(context, e))
                                .toList(),
                          ))
                        ],
                      )));
            });
      };

  Future<BitmapDescriptor> getMarkerBitmap(int size, double size2,
      {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint2 = Paint()
      ..color = const Color.fromRGBO(254, 142, 72, 0.7);

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint2);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<PlaceModel>(placeList, _updateMarkers,
        markerBuilder: markerBuilder);
  }

  Widget _buildHouseItem(BuildContext context, PlaceModel house) {
    return FutureBuilder<String>(
      future: FirebaseStorageUtil().getImageUrl(house.imageUrl),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return _buildHouseInfoBox(context, house, snapshot.data!);
          }
        }
      },
    );
  }

  Widget _buildHouseInfoBox(
      BuildContext context, PlaceModel house, String imageUrl) {
    return GestureDetector(
        onTap: () {
          Provider.of<HouseDataProviderService>(context, listen: false)
              .changeHomeInformationIndex(int.parse(house.id));
          Get.to(() => const HomeInformation());
        },
        child: Container(
          height: Screen.designToScreenHeight(context, 150),
          padding: EdgeInsets.only(
              left: Screen.designToScreenWidth(context, 20),
              bottom: Screen.designToScreenHeight(context, 9)),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imageUrl,
                      width: Screen.designToScreenWidth(context, 148),
                      height: Screen.designToScreenHeight(context, 114),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 27))),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: house.price,
                            style: const TextStyle(fontSize: 25.0)),
                        const TextSpan(
                            text: ' per month',
                            style: TextStyle(fontSize: 16.0)),
                        TextSpan(
                          text:
                              '\n${house.floor} floor, near RUPP, \nlarge hallway',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: Screen.designToScreenWidth(context, 23))),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.designToScreenHeight(context, 9))),
              line(context, 390)
            ],
          ),
        ));
  }

  Widget line(BuildContext context, double widget) => SizedBox(
        width: Screen.designToScreenWidth(context, widget),
        child: const Divider(
          color: Color.fromRGBO(217, 217, 217, 1),
          thickness: 0.5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseDataProviderService>(
      builder: (context, houseData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Google Map"),
          ),
          body: Stack(children: <Widget>[
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                clusterManager.setMapId(controller.mapId);
              },
              markers: markers,
              onTap: (LatLng latLng) {
                setState(() {
                  _showPanel = false;
                });
              },
              onCameraMove: (CameraPosition position) {
                setState(() {
                  _zoom = position.zoom;
                  clusterManager.onCameraMove(position);
                });
              },
              onCameraIdle: clusterManager.updateMap,
            ),
            if (_showPanel) _panel
          ]),
          bottomNavigationBar: BottomBarRoutingPage(),
        );
      },
    );
  }
}
