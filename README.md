Housecard Widget
The Housecard widget displays property listings in two formats:

Horizontal House Cards: A horizontally scrollable list displaying the property's image, title, address, and distance.
Recommendation Cards: A vertical list of cards with detailed property information such as price, bedrooms, and bathrooms.

Features:
InkWell for tap detection, enabling navigation to a detailed property view (DetailsView).
GetX for simplified navigation using Get.to().
Property data is displayed dynamically (hardcoded for now, can be fetched from an API).
Custom text styling for improved readability.

Enhancements:
Refactor data handling to fetch properties from an API or database.
Replace repetitive property entries with unique data.
Reuse card widgets for consistency in design.
