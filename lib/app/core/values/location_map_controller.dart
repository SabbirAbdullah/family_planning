import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var address = ''.obs; // Observable to hold the address text
  var isLoading = false.obs;
  var latitude = ''.obs;
  var longitude = ''.obs;
  var showPermissionError = false.obs; // Flag to show permission error UI

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      isLoading.value = true;
      showPermissionError.value = false; // Reset error flag

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        address.value = "Permission Denied";
        showPermissionError.value = true; // Show UI to request permission
        isLoading.value = false;
        return;
      }

      // Try to get current location with timeout
      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10), // Timeout after 10s
        );
      } catch (e) {
        // If timeout occurs, show permission UI
        address.value = "Error: Location fetch timeout";
        showPermissionError.value = true;
        isLoading.value = false;
        return;
      }

      // If position is still null, try to get the last known location
      position ??= await Geolocator.getLastKnownPosition();
      if (position == null) {
        address.value = "Unable to fetch location";
        showPermissionError.value = true;
        isLoading.value = false;
        return;
      }

      latitude.value = "${position.latitude}";
      longitude.value = "${position.longitude}";

      // Reverse geocoding to get the address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value =
        "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      } else {
        address.value = "Unable to fetch address.";
      }
    } catch (e) {
      address.value = "Error: $e";
      showPermissionError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}


// class LocationController extends GetxController {
//   var address = ''.obs; // Holds the address text
//   var isLoading = true.obs;
//
//   Stream<Position>? positionStream;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getLocationStream();
//   }
//
//   void getLocationStream() async {
//     try {
//       isLoading.value = true;
//
//       // Request permission
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         address.value = "Permission Denied";
//         return;
//       }
//
//       // Set up location stream to listen for updates
//       positionStream = Geolocator.getPositionStream(
//         locationSettings: const LocationSettings(
//           accuracy: LocationAccuracy.bestForNavigation,
//           distanceFilter: 5, // Fetch new location when the device moves 5 meters
//         ),
//       );
//
//       positionStream!.listen((Position position) async {
//         // Debug location (optional)
//         print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
//
//         // Fetch and update address
//         List<Placemark> placemarks = await placemarkFromCoordinates(
//           position.latitude,
//           position.longitude,
//         );
//
//         if (placemarks.isNotEmpty) {
//           Placemark place = placemarks[0];
//           address.value =
//           "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//         }
//       });
//     } catch (e) {
//       address.value = "Error: $e";
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

//
// Obx(
//       () => locationController.isLoading.value
//       ? const Center(child: CircularProgressIndicator())
//       : TextField(
//     readOnly: true,
//     controller: TextEditingController(
//         text: locationController.address.value),
//     decoration: const InputDecoration(
//       border: OutlineInputBorder(),
//       suffixIcon: Icon(Icons.copy),
//     ),
//   ),
// ),