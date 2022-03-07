import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/maps/maps_controller.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MapPage extends StatefulWidget {
  @override
  mapState createState() => mapState();
}

class mapState extends State<MapPage> {
  //fixme : google api key
  String googleApikey = "place_api_key_here";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  //monas : -6.1753871,106.8249641
  LatLng startLocation = LatLng(-6.1753871,106.8249641);
  String location = "Location Name:";
  Placemark p = new Placemark();
  double zoom = 14.0;

  maps_controller _controller = Get.put(maps_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: startLocation, //initial position
          zoom: zoom, //initial zoom level
        ),
        mapType: MapType.normal, //map type
        onCameraMove: (CameraPosition cameraPositiona) {
          cameraPosition = cameraPositiona; //when map is dragging
        },
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
        onCameraIdle: () async {
          //when map drag stops
          List<Placemark> placemarks = await placemarkFromCoordinates(
              cameraPosition!.target.latitude,
              cameraPosition!.target.longitude);
          setState(() {
            //get place name from lat and lang
            p = placemarks.first;
            location = placemarks.first.administrativeArea.toString() +
                ", " +
                placemarks.first.street.toString();
          });
        },
      ),
       Center(
            //picker image on google map
            child: Image.asset(
              "assets/images/placeholder.png",
              width: 36,
            ),
          ),

      //search autoconplete input
      Positioned(
          //search input bar
          top: 24,
          child: InkWell(
              onTap: () async {
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    region: 'id',
                    components: [Component(Component.country, "id")],
                    decoration: InputDecoration(
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //google_map_webservice package
                    onError: (err) {
                      print(err);
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                  });

                  //form google_maps_webservice package
                  final plist = GoogleMapsPlaces(
                    apiKey: googleApikey,
                    apiHeaders: await GoogleApiHeaders().getHeaders(),
                    //from google_api_headers package
                  );
                  String placeid = place.placeId ?? "0";
                  final detail = await plist.getDetailsByPlaceId(placeid);
                  final geometry = detail.result.geometry!;
                  final lat = geometry.location.lat;
                  final lang = geometry.location.lng;
                  var newlatlang = LatLng(lat, lang);

                  //move map camera to selected place with animation
                  mapController?.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(target: newlatlang, zoom: zoom)));
                }
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width - 40,
                      child: ListTile(
                        title: Text(
                          location,
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Icon(Icons.search),
                        dense: true,
                      )),
                ),
              ))),
      Positioned(
          bottom: 24,
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width - 8,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("Batal"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { Get.back(); },
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextButton(
                    child: Text("Konfirmasi"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                       _controller.setPickedPlace(p, cameraPosition!);
                       Get.back();
                    },
                  ),
                )
              ],
            ),
          )),
    ]));
  }
}
