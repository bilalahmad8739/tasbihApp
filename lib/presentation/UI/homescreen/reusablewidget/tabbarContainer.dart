import 'package:flutter/material.dart';

class tabbarContainer extends StatefulWidget {
  IconData icon;
  final bool istap;
  
  tabbarContainer({super.key, required this.istap, required this.icon});

  @override
  State<tabbarContainer> createState() => _tabbarContainerState();
}

class _tabbarContainerState extends State<tabbarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.istap ? Colors.yellow : Colors.grey,
      ),
      child: Icon(widget.icon),
    );
  }
}
