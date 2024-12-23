import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../model/property.dart';
import 'dart:async';


class DetailsView extends StatelessWidget {
  final Property property;
  DetailsView({required this.property});

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(property.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        child: IconButton(
                          icon:Image.asset('assets/IC_Back.png'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.4),
                        child: IconButton(
                          icon: const Icon(Icons.bookmark_border,color: Colors.white,),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            property.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            property.address,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.bed, color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(property.bedrooms, style: const TextStyle(color: Colors.white70)),
                              const SizedBox(width: 16),
                              Icon(Icons.bathtub, color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(property.bathrooms, style: const TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "The 3-level house has a modern design, has a large pool and a garage that fits up to four cars. Show More",
                        style: TextStyle(color: Colors.grey, height: 1.5),
                      ),
                      const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile Section
                      Row(
                        children: [
                          // Avatar
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/profile.png'), // Replace with your image path
                          ),
                          const SizedBox(width: 12), // Space between avatar and text
                          // Name and Title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Garry Allen',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Owner',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Action Buttons
                      Row(
                        children: [
                          // Call Button
                          IconButton(
                            onPressed: () {
                              // Add call action
                            },
                            icon: Image.asset('assets/IC_Phone.png'),
                            iconSize: 24,

                          ),
                          const SizedBox(width: 8), // Space between buttons
                          // Message Button
                          IconButton(
                            onPressed: () {
                              // Add message action
                            },
                            icon: Image.asset('assets/IC_Message.png'),
                            iconSize: 24,

                          ),
                        ],
                      ),
                    ],
                  ),
                      const SizedBox(height: 16),
                      const Text(
                        "Gallery",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGalleryImage('assets/houseseven.jpeg'),
                            _buildGalleryImage('assets/housefour.jpg'),
                            _buildGalleryImage('assets/houseone.jpg'),
                            _buildGalleryImage('assets/housetwo.png'),
                            _buildGalleryImage('assets/housesix.jpg'),
                            _buildGalleryImage('assets/housefour.jpg'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Location",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 300.0, // Fixed height
                        child: GoogleMap(
                          onMapCreated: (controller) {
                            try {
                              _onMapCreated(controller);
                              print("Google Map created successfully");
                            } catch (e) {
                              print("Error during Google Map creation: $e");
                            }
                          },
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          ),
                        ),
                      ),

                  const SizedBox(height: 16),
                      Text(
                        'price',
                        style: TextStyle(
                          color: Color.fromRGBO(133, 133, 133, 1), // Using the RGBA color
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                  GestureDetector(
                    onTap: () {
                      // Add your onPressed functionality here
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient:LinearGradient(
                          colors: [
                            Color.fromRGBO(160, 218, 251, 1),
                            Color.fromRGBO(10, 142, 217, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      child: Center(
                        child: Text(
                          "Rent Now",
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
