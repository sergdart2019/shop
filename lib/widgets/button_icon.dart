import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final Function onPressed;
  final bool badge;

  ButtonIcon({
    this.icon,
    this.color,
    this.iconColor,
    this.onPressed,
    this.badge = false,
  });

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context); // only the button rebuilds this way
    return Stack(
      children: [
        Container(
          width: 55,
          height: 55,
          child: FlatButton(
            shape: CircleBorder(),
            onPressed: onPressed,
            color: color,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
        badge
            ? Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(0.9),
                  ),
                  alignment: Alignment.center,
                  width: 20,
                  height: 20,
                  child: Text(
                    cart.itemCount == null ? Text('0') : cart.itemCount.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : Positioned(
                child: Container(
                  height: 0,
                  width: 0,
                ),
              ),
      ],
    );
  }
}
