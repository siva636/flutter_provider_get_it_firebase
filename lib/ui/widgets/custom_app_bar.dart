import 'package:flutter/material.dart';
import 'package:provider_get_it/constants.dart';
import 'package:provider_get_it/services/adaptive_breakpoints.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar() : super(key: Key('custom_app_bar'));

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final onGlobalMenuSelected = (GlobalMenu globalMenu) {
      switch (globalMenu) {
        case GlobalMenu.home:
          Navigator.pushNamed(context, '/');
          break;
        case GlobalMenu.help:
          Navigator.pushNamed(context, '/help');
          break;
        case GlobalMenu.search:
          Navigator.pushNamed(context, '/search');
          break;
        case GlobalMenu.account:
          Navigator.pushNamed(context, '/account');
          break;
      }
    };

    final double gutter = getBreakpointsInfo(context).gutter;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gutter),
        child: NavigationToolbar(
          centerMiddle: true,
          leading: Align(
              child: Text('My Company',
                  style: Theme.of(context).textTheme.headline5),
              alignment: Alignment.centerLeft),
          middle: getWindowType(context) >= AdaptiveWindowType.smallPlus
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.home);
                      },
                      icon: Icon(Icons.home_outlined),
                      label: Text('Home'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.help);
                      },
                      icon: Icon(Icons.help_outline),
                      label: Text('Help'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.search);
                      },
                      icon: Icon(Icons.search_outlined),
                      label: Text('Search'),
                    ),
                    SizedBox(width: menuGap),
                    OutlinedButton.icon(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.account);
                      },
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
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.home);
                      },
                      icon: Icon(Icons.home_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.help);
                      },
                      icon: Icon(Icons.help_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.search);
                      },
                      icon: Icon(Icons.search_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        onGlobalMenuSelected(GlobalMenu.account);
                      },
                      icon: Icon(Icons.person_outlined),
                    ),
                  ],
                )
              : getWindowType(context) == AdaptiveWindowType.xsmall
                  ? PopupMenuButton<GlobalMenu>(
                      icon: Icon(Icons.menu),
                      onSelected: (GlobalMenu globalMenu) {
                        onGlobalMenuSelected(globalMenu);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<GlobalMenu>>[
                        const PopupMenuItem<GlobalMenu>(
                          value: GlobalMenu.home,
                          child: ListTile(
                            leading: Icon(Icons.home_outlined),
                            title: Text('Home'),
                          ),
                        ),
                        const PopupMenuItem<GlobalMenu>(
                          value: GlobalMenu.help,
                          child: ListTile(
                            leading: Icon(Icons.help_outline),
                            title: Text('Help'),
                          ),
                        ),
                        const PopupMenuItem<GlobalMenu>(
                          value: GlobalMenu.search,
                          child: ListTile(
                            leading: Icon(Icons.search_outlined),
                            title: Text('Search'),
                          ),
                        ),
                        const PopupMenuItem<GlobalMenu>(
                          value: GlobalMenu.account,
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

enum GlobalMenu { home, help, search, account }
