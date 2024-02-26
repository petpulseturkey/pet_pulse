import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  final void Function()? onTap;
  final IconData icon;
  final String text;
  const MyListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: widget.onTap,
        title: Text(
          widget.text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
