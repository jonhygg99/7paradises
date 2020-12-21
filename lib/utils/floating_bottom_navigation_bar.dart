import 'package:flutter/material.dart';
import 'package:seven_paradises/constants/colors.dart';
import 'package:seven_paradises/constants/enum.dart';
import 'package:seven_paradises/constants/icons.dart';

class FloatingBottomNavigationBar extends StatelessWidget {
  FloatingBottomNavigationBar(
      {@required this.state, @required this.onItemTapped});

  final int state;
  final Function onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 260.0,
            height: 60.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                _navBarItem(kHomeIconData, NavigationBarState.Home),
                _navBarItem(kFavouriteIconData, NavigationBarState.Favourite),
                _navBarItem(kProfileIconData, NavigationBarState.Profile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navBarItem(IconData icon, int itemState) {
    return InkWell(
      onTap: () => onItemTapped(itemState),
      borderRadius: BorderRadius.circular(8),
      child: Icon(
        icon,
        color: state == itemState ? kActiveColorIcon : kInactiveColorIcon,
      ),
    );
  }
}
