import 'package:flutter/material.dart';

class LoomiPageRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  final bool opaque;
  final bool fullscreenDialog;

  LoomiPageRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.fullscreenDialog = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          opaque: opaque,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
