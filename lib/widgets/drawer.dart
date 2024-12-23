import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          buildListTile(
            context,
            title: 'Home',
            assetPath: 'assets/homedrawer.png',
            isSelected: _selectedItem == 'Home',
            onTap: () {
              setState(() {
                _selectedItem = 'Home';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Profile',
            assetPath: 'assets/profiledrawer.png',
            isSelected: _selectedItem == 'Profile',
            onTap: () {
              setState(() {
                _selectedItem = 'Profile';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Nearby',
            assetPath: 'assets/locationdrawer.png',
            isSelected: _selectedItem == 'Nearby',
            onTap: () {
              setState(() {
                _selectedItem = 'Nearby';
              });
            },
          ),
          const Divider(color: Colors.white54),
          buildListTile(
            context,
            title: 'Bookmark',
            assetPath: 'assets/bookmarkdrawer.png',
            isSelected: _selectedItem == 'Bookmark',
            onTap: () {
              setState(() {
                _selectedItem = 'Bookmark';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Notification',
            assetPath: 'assets/logout.png',
            isSelected: _selectedItem == 'Notification',
            onTap: () {
              setState(() {
                _selectedItem = 'Notification';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Message',
            assetPath: 'assets/smsdrawer.png',
            isSelected: _selectedItem == 'Message',
            onTap: () {
              setState(() {
                _selectedItem = 'Message';
              });
            },
          ),
          const Divider(color: Colors.white54),
          buildListTile(
            context,
            title: 'Setting',
            assetPath: 'assets/setting.png',
            isSelected: _selectedItem == 'Setting',
            onTap: () {
              setState(() {
                _selectedItem = 'Setting';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Help',
            assetPath: 'assets/help.png',
            isSelected: _selectedItem == 'Help',
            onTap: () {
              setState(() {
                _selectedItem = 'Help';
              });
            },
          ),
          buildListTile(
            context,
            title: 'Logout',
            assetPath: 'assets/logout.png',
            isSelected: _selectedItem == 'Logout',
            onTap: () {
              setState(() {
                _selectedItem = 'Logout';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      BuildContext context, {
        required String title,
        required String assetPath,
        required bool isSelected,
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.blue,
          borderRadius: isSelected
              ? const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
              : BorderRadius.zero,
        ),
        child: ListTile(
          leading: Image.asset(
            assetPath,
            color: isSelected ? Colors.blue : Colors.white, // Image color
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white, // Text color
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
