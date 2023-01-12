part of '../utils.dart';

class PodiRoutes {
  PodiRoutes._();

  static const Duration _transitionDuration = Duration(milliseconds: 200);
  static const TransitionType _transitionType = TransitionType.noTransition;

  static ModuleRoute module(
    String name, {
    required Module module,
    List<RouteGuard> guards = const [],
  }) =>
      ModuleRoute(
        name,
        module: module,
        transition: _transitionType,
        duration: _transitionDuration,
        guards: guards,
      );

  static ChildRoute page(
    String name, {
    required Widget Function(BuildContext, ModularArguments) child,
    List<RouteGuard> guards = const [],
  }) =>
      ChildRoute(
        name,
        child: child,
        transition: _transitionType,
        duration: _transitionDuration,
      );
}
