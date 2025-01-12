import 'package:flutter/material.dart';

class DrawerNavigationWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget nextPage;

  const DrawerNavigationWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Row(
        children: [
          Icon(icon),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
