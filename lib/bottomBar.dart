import 'package:flutter/material.dart';
import 'package:untitled4/addProduct.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButtonWithText(
            icon: Icons.home,
            label: 'Home',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          IconButtonWithText(
            icon: Icons.list,
            label: 'Products',
            isSelected: currentIndex == 1,
            onTap: () {
              onTap(1);
              Navigator.pushNamed(context, '/productListView');
            },
          ),

          _centerAddButton(context),
          IconButtonWithText(
            icon: Icons.shop,
            label: 'Shops',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          IconButtonWithText(
            icon: Icons.settings,
            label: 'Settings',
            isSelected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }

  Widget _centerAddButton(BuildContext context) {  // Add BuildContext as a parameter
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductPage()),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

}

class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function onTap;

  IconButtonWithText({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.green : Colors.grey),
          Text(label, style: TextStyle(color: isSelected ? Colors.green : Colors.grey))
        ],
      ),
    );
  }
}
