import 'package:flutter/material.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:provider_get_it/constants.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar() : super(key: Key('custom_app_bar'));

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final onHomePressed = () {};
    final onSearchPressed = () {};
    final onHelpPressed = () {};
    final onAccountPressed = () {};

    final double margin = getBreakpointEntry(context).margin;

    return Container(
      width: null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: margin),
        child: NavigationToolbar(
          centerMiddle: true,
          leading: Align(
              child: Text('My Company',
                  style: Theme.of(context).textTheme.headline5),
              alignment: Alignment.centerLeft),
          middle: getWindowType(context) == AdaptiveWindowType.xlarge ||
                  getWindowType(context) == AdaptiveWindowType.large ||
                  getWindowType(context) == AdaptiveWindowType.medium
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton.icon(
                      onPressed: onHomePressed,
                      icon: Icon(Icons.home_outlined),
                      label: Text('Home'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: onHelpPressed,
                      icon: Icon(Icons.help_outline),
                      label: Text('Help'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: onSearchPressed,
                      icon: Icon(Icons.search_outlined),
                      label: Text('Search'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: onAccountPressed,
                      icon: Icon(Icons.person_outlined),
                      label: Text('Account'),
                    ),
                  ],
                )
              : null,
          trailing: getWindowType(context) == AdaptiveWindowType.small
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onHomePressed,
                      icon: Icon(Icons.home_outlined),
                    ),
                    IconButton(
                      onPressed: onHelpPressed,
                      icon: Icon(Icons.help_outline),
                    ),
                    IconButton(
                      onPressed: onSearchPressed,
                      icon: Icon(Icons.search_outlined),
                    ),
                    IconButton(
                      onPressed: onAccountPressed,
                      icon: Icon(Icons.person_outlined),
                    ),
                  ],
                )
              : getWindowType(context) == AdaptiveWindowType.xsmall
                  ? PopupMenuButton<Menu>(
                      icon: Icon(Icons.menu),
                      onSelected: (Menu selected) {},
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Menu>>[
                        const PopupMenuItem<Menu>(
                          value: Menu.home,
                          child: ListTile(
                            leading: Icon(Icons.home_outlined),
                            title: Text('Home'),
                          ),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.help,
                          child: ListTile(
                            leading: Icon(Icons.help_outline),
                            title: Text('Help'),
                          ),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.search,
                          child: ListTile(
                            leading: Icon(Icons.search_outlined),
                            title: Text('Search'),
                          ),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.account,
                          child: ListTile(
                            leading: Icon(Icons.person_outlined),
                            title: Text('Account'),
                          ),
                        ),
                      ],
                    )
                  : null,
        ),
      ),
    );
  }
}

enum Menu { home, help, search, account }
