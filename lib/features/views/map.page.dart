import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_map/features/data/models/address_details_models.dart';
import 'package:yandex_map/features/data/repository/addres_details_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../data/models/app_lat_long.dart';
import '../data/service/app_location_services.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  String addressDetail = "Map Page";
  final AddressDetailsRepository repository = AddressDetailsRepository();

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(addressDetail),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchCurrentLocation();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.data_saver_on),
      ),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
            onCameraPositionChanged: (cameraPosition, reason, finished) {
              if (finished) {
                updateAddressDetail(AppLatLong(
                    lat: cameraPosition.target.latitude,
                    long: cameraPosition.target.longitude));
              }
            },
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = UlugnortumaniLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    location = defLocation;
    updateAddressDetail(location);
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }

  Future<void> updateAddressDetail(AppLatLong latLong) async {
    addressDetail = "...loading";
    setState(() {});
    AddressDetailsModel? data = await repository.getAddressDetail(latLong);
    addressDetail = data!.responset!.geoObjectCollection!.featureMember!.isEmpty
        ? "unknown_place"
        : data.responset!.geoObjectCollection!.featureMember![0].geoObject!
            .metaDataProperty!.geocoderMetaData!.address!.formatted
            .toString();
    setState(() {});
    print(addressDetail);
  }
}
