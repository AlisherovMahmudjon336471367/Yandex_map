// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddressDetailsModel {
  Responset? responset;

  AddressDetailsModel({required this.responset});

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      AddressDetailsModel(
        responset: Responset.fromJson(json["response"]),
      );
}

class Responset {
  GeoObjectCollection? geoObjectCollection;

  Responset({required this.geoObjectCollection});

  factory Responset.fromJson(Map<String, dynamic> json) => Responset(
        geoObjectCollection: GeoObjectCollection.fromJson(json["response"]),
      );
}

class GeoObjectCollection {
  GeoObjectCollectionMetaDataProperty? metaDataProperty;
  List<FeatureMember>? featureMember;

  GeoObjectCollection({
    required this.metaDataProperty,
    required this.featureMember,
  });

  factory GeoObjectCollection.fromJson(Map<String, dynamic> json) =>
      GeoObjectCollection(
          metaDataProperty: json["metaDataProperty"] == null
              ? null
              : GeoObjectCollectionMetaDataProperty.fromJson(
                  json["metaDataProperty"]),
          featureMember: List<FeatureMember>.from(
            json["featureMember"].map((x) => FeatureMember.fromJson(x)),
          ));
}

class FeatureMember {
  GeoObject? geoObject;

  FeatureMember({
    required this.geoObject,
  });

  factory FeatureMember.fromJson(Map<String, dynamic> json) => FeatureMember(
        geoObject: json["GeoObject"] == null
            ? null
            : GeoObject.fromJson(json["metaDataProperty"]),
      );
}

class GeoObject {
  GeoObjectMetaDataProperty? metaDataProperty;
  String name;
  String description;
  BoundedBy boundedBy;
  String uri;
  PointModel pointModel;

  GeoObject({
    required this.metaDataProperty,
    required this.name,
    required this.boundedBy,
    required this.uri,
    required this.pointModel,
    required this.description,
  });

  factory GeoObject.fromJson(Map<String, dynamic> json) => GeoObject(
        metaDataProperty: json["GeoObject"] == null
            ? null
            : GeoObjectMetaDataProperty.fromJson(json["metaDataProperty"]),
        name: json['name'] ?? "",
        description: json['description'] ?? "",
        boundedBy: json["boundedBy"] == null
            ? BoundedBy(envelope: null)
            : BoundedBy.fromJson(json["boundedBy"]),
        uri: json["uri"] ?? "",
        pointModel: json["Point"] == null
            ? PointModel(pos: "")
            : PointModel.fromJson(json["Point"]),
      );
}

class BoundedBy {
  Envelope? envelope;

  BoundedBy({
    required this.envelope,
  });

  factory BoundedBy.fromJson(Map<String, dynamic> json) => BoundedBy(
        envelope: json["Envelope"] == null
            ? Envelope(lowerCorner: '', upperCorner: '')
            : Envelope.fromJson(json["Envelope"]),
      );
}

class Envelope {
  String lowerCorner;
  String upperCorner;

  Envelope({
    required this.lowerCorner,
    required this.upperCorner,
  });

  factory Envelope.fromJson(Map<String, dynamic> json) => Envelope(
        lowerCorner: json["lowerCorner"] ?? "",
        upperCorner: json["upperCorner"] ?? "",
      );
}

class GeoObjectMetaDataProperty {
  GeoCoderMetaData? geocoderMetaData;

  GeoObjectMetaDataProperty({
    required this.geocoderMetaData,
  });

  factory GeoObjectMetaDataProperty.fromJson(Map<String, dynamic> json) =>
      GeoObjectMetaDataProperty(
        geocoderMetaData: json["GeocoderMetaData"] == null
            ? GeoCoderMetaData(
                precision: '',
                text: '',
                addressDetails: null,
                kind: 'null',
                address: null)
            : GeoCoderMetaData.fromJson(json["GeoCoderMetaData"]),
      );
}

class GeoCoderMetaData {
  String precision;
  String text;
  String kind;
  Address? address;
  AddressDetails? addressDetails;

  GeoCoderMetaData({
    required this.precision,
    required this.text,
    required this.kind,
    required this.address,
    required this.addressDetails,
  });

  factory GeoCoderMetaData.fromJson(Map<String, dynamic> json) =>
      GeoCoderMetaData(
        precision: json["precision"] ?? "",
        text: json["text"] ?? "",
        kind: json["kind"] ?? "",
        address: json["Address"] == null
            ? Address(countryCode: '', formatted: '', component: [])
            : Address.fromJson(json["Address"]),
        addressDetails: json["AddressDetails"] == null
            ? AddressDetails(country: null)
            : AddressDetails.fromJson(json[AddressDetails]),
      );
}

class Address {
  String countryCode;
  String formatted;
  List<Component>? component;

  Address({
    required this.countryCode,
    required this.formatted,
    required this.component,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        countryCode: json["countryCode"] ?? "",
        formatted: json["formatted"] ?? "",
        component: json["component"] == null
            ? []
            : List<Component>.from(
                json["Component"].map((x) => Component.fromJson(x))),
      );
}

class Component {
  String kind;
  String name;

  Component({
    required this.kind,
    required this.name,
  });

  factory Component.fromJson(Map<String, dynamic> json) => Component(
        kind: json["kind"] ?? "",
        name: json["name"] ?? "",
      );
}

class AddressDetails {
  Country? country;

  AddressDetails({
    required this.country,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) => AddressDetails(
        country:
            json["Country"] == null ? null : Country.fromJson(json["Country"]),
      );
}

class Country {
  String addressLine;
  String countryNameCode;
  String countryName;
  AdministrativeArea? administrativeArea;

  Country({
    required this.addressLine,
    required this.countryNameCode,
    required this.countryName,
    required this.administrativeArea,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        addressLine: json["addressLine"] ?? '',
        countryNameCode: json["addressLine"] ?? '',
        countryName: json["addressLine"] ?? '',
        administrativeArea: json["addressLine"] == null
            ? AdministrativeArea(
                AdministrativeAreaName: '',
                locality: Locality(
                    localityName: "",
                    thoroughfare: Thoroughfare(
                        thoroughfareName: "",
                        permise: Permise(permiseNumber: ""))))
            : AdministrativeArea.fromJson(json["AdministrativeArea"]),
      );
}

class AdministrativeArea {
  String AdministrativeAreaName;
  Locality? locality;

  AdministrativeArea({
    required this.AdministrativeAreaName,
    required this.locality,
  });

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      AdministrativeArea(
        AdministrativeAreaName: json["AdministrativeAreaName"] ?? '',
        locality: json["locality"] == null
            ? Locality(localityName: "", thoroughfare: null)
            : Locality.fromJson(json["Locality"]),
      );
}

class Locality {
  String localityName;
  Thoroughfare? thoroughfare;

  Locality({
    required this.localityName,
    required this.thoroughfare,
  });

  factory Locality.fromJson(Map<String, dynamic> json) => Locality(
        localityName: json["localityNeme"] ?? '',
        thoroughfare: json["thoroughfareName"] == null
            ? Thoroughfare(
                permise: Permise(permiseNumber: ""), thoroughfareName: "")
            : Thoroughfare.fromJson(json["Thoroughfare"]),
      );
}

class Thoroughfare {
  String thoroughfareName;
  Permise? permise;

  Thoroughfare({
    required this.thoroughfareName,
    required this.permise,
  });

  factory Thoroughfare.fromJson(Map<String, dynamic> json) => Thoroughfare(
        thoroughfareName: json["thoroughfareName"] ?? '',
        permise: json["permise"] == null
            ? Permise(permiseNumber: "")
            : Permise.fromJson(json["Permise"]),
      );
}

class Permise {
  String permiseNumber;

  Permise({
    required this.permiseNumber,
  });

  factory Permise.fromJson(Map<String, dynamic> json) =>
      Permise(permiseNumber: json["permiseNumber"]);
}

class PointModel {
  String pos;

  PointModel({
    required this.pos,
  });

  factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
        pos: json["permiseNumber"] ?? "",
      );
}

class GeoObjectCollectionMetaDataProperty {
  GeoCoderResponseMetaData? geoCoderResponseMetaData;

  GeoObjectCollectionMetaDataProperty({
    required this.geoCoderResponseMetaData,
  });

  factory GeoObjectCollectionMetaDataProperty.fromJson(
          Map<String, dynamic> json) =>
      GeoObjectCollectionMetaDataProperty(
          geoCoderResponseMetaData: json["geoCoderResponseMetaData"] == null
              ? GeoCoderResponseMetaData(
                  point: null, request: "", result: "", found: "")
              : GeoCoderResponseMetaData.fromJson(
                  json["GeoCoderResponseMetaData"]));
}

class GeoCoderResponseMetaData {
  PointModel? point;
  String request;
  String result;
  String found;

  GeoCoderResponseMetaData({
    this.point,
    required this.request,
    required this.result,
    required this.found,
  });

  factory GeoCoderResponseMetaData.fromJson(Map<String, dynamic> json) =>
      GeoCoderResponseMetaData(
        point:
            json["Point"] == null ? null : PointModel.fromJson(json["Point"]),
        request: json["request"] ?? "",
        result: json["result"] ?? "",
        found: json["found"] ?? "",
      );
}
