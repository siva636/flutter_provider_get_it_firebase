import 'package:flutter/material.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: NavigationToolbar(
          centerMiddle: true,
          leading: Align(
              child: Text('My Company',
                  style: Theme.of(context).textTheme.headline5),
              alignment: Alignment.centerLeft),
          middle: getWindowType(context) == AdaptiveWindowType.xsmall ||
                  getWindowType(context) == AdaptiveWindowType.small
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton.icon(
                      onPressed: onHomePressed,
                      icon: Icon(Icons.home_outlined),
                      label: Text('Home'),
                    ),
                    SizedBox(width: 4),
                    OutlinedButton.icon(
                      onPressed: onHelpPressed,
                      icon: Icon(Icons.help_outline),
                      label: Text('Help'),
                    ),
                    SizedBox(width: 4),
                    OutlinedButton.icon(
                      onPressed: onSearchPressed,
                      icon: Icon(Icons.search_outlined),
                      label: Text('Search'),
                    ),
                    SizedBox(width: 4),
                    OutlinedButton.icon(
                      onPressed: onAccountPressed,
                      icon: Icon(Icons.person_outlined),
                      label: Text('Account'),
                    ),
                  ],
                ),
          trailing: getWindowType(context) == AdaptiveWindowType.xsmall ||
                  getWindowType(context) == AdaptiveWindowType.small
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
              : null),
    );
  }
}
