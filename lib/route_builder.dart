import 'package:flutter/material.dart';

class Routing<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Widget childCurrent;
  Routing(
      {Key key,
      @required this.child,
      @required this.childCurrent,
      @required RouteSettings settings})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
            childCurrent,
            settings: settings,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Stack(
                children: <Widget>[
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(-1.0, 0.0),
                    ).animate(animation),
                    child: child,
                  ),
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: childCurrent,
                  )
                ],
              );
            });
}
