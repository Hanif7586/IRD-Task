import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_task/view/detailsview/detailsview.dart';
import '../model/property.dart';

class Housecard extends StatelessWidget {
  const Housecard({super.key});
  Widget _buildHouseCard(Property property, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(property: property),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(property.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    property.address,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16, // Aligns the child to the right of the parent
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/IC_Location.png', height: 16, width: 16), // Adjust size as needed
                    const SizedBox(width: 4), // Space between image and text
                    Text(
                      property.distance ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(Property property) {
    return InkWell(
      onTap: () {
        Get.to(DetailsView(property: property));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(property.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(property.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(property.price, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.bed, color: Colors.grey[600], size: 16),
                  const SizedBox(width: 4),
                  Text(property.bedrooms, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(width: 16),
                  Icon(Icons.bathtub, color: Colors.grey[600], size: 16),
                  const SizedBox(width: 4),
                  Text(property.bathrooms, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final properties = [
      Property(
        title: 'Dreamsville House',
        price: 'Rp. 2,500,000 / Year',
        address: 'Jl Sultan Iskandar Muda',
        bedrooms: '3 Bedrooms',
        bathrooms: '2 Bathrooms',
        image: 'assets/houseone.jpg',
        distance: '18 km',
      ),
      Property(
        title: 'Ascot House',
        price: 'Rp. 2,800,000 / Year',
        address: 'Jl Cilandak Tengah',
        bedrooms: '4 Bedrooms',
        bathrooms: '3 Bathrooms',
        image: 'assets/housesix.jpg',
        distance: '22 km',
      ),
      Property(
        title: 'Sunny Villa',
        price: 'Rp. 3,000,000 / Year',
        address: 'Jl Sunset Road',
        bedrooms: '5 Bedrooms',
        bathrooms: '4 Bathrooms',
        image: 'assets/housethree.jpg',
        distance: '15 km',
      ),
      Property(
        title: 'Dreamsville House',
        price: 'Rp. 2,500,000 / Year',
        address: 'Jl Sultan Iskandar Muda',
        bedrooms: '3 Bedrooms',
        bathrooms: '2 Bathrooms',
        image: 'assets/housetwo.png',
        distance: '18 km',
      ),
      Property(
        title: 'Ascot House',
        price: 'Rp. 2,800,000 / Year',
        address: 'Jl Cilandak Tengah',
        bedrooms: '4 Bedrooms',
        bathrooms: '3 Bathrooms',
        image: 'assets/housefour.jpg',
        distance: '22 km',
      ),
      Property(
        title: 'Sunny Villa',
        price: 'Rp. 3,000,000 / Year',
        address: 'Jl Sunset Road',
        bedrooms: '5 Bedrooms',
        bathrooms: '4 Bathrooms',
        image: 'assets/housefive.jpg',
        distance: '15 km',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Near from you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: properties.length,
              itemBuilder: (context, index) => _buildHouseCard(properties[index], context),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Best for you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: properties.map((property) => _buildRecommendationCard(property)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}