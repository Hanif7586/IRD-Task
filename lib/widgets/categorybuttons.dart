import 'package:flutter/material.dart';

import 'colors.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({super.key});

  Widget _buildCategoryButton(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        gradient: isActive
            ? LinearGradient(
          colors: CustomColors.blueGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : null,
        color: isActive ? null : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),

      child: Center(
        child: Text(
          title,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryButton('House', true),
          _buildCategoryButton('Apartment', false),
          _buildCategoryButton('Hotel', false),
          _buildCategoryButton('Villa', false),
          _buildCategoryButton('Apartment', false),
          _buildCategoryButton('Hotel', false),
          _buildCategoryButton('Villa', false),
        ],
      ),
    );
  }
}
