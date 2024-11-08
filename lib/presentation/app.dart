import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_event_for_toast.dart';
import 'package:suppose_test_task/presentation/event_bus/events/app_progress_event_for_toast.dart';
import 'package:suppose_test_task/presentation/logic/event_bus/event_bus_provider.dart';
import 'package:suppose_test_task/presentation/router/app_router.dart';
import 'package:suppose_test_task/presentation/widgets/app_toast_message.dart';
import 'package:suppose_test_task/presentation/widgets/custom_progrss_indicator.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AppProgressEventForToast>>(
      appProgressEventProvider,
      (previous, next) {
        next.whenData((message) {
          final navigatorContext = AppRouter.router.routerDelegate.navigatorKey.currentContext;
          if (navigatorContext == null) return;
          if (message.status) {
            LoadingIndicatorDialog().show(navigatorContext);
          } else {
            LoadingIndicatorDialog().dismiss();
          }
        });
      },
    );

    ref.listen<AsyncValue<AppEventForToast>>(
      appEventForToastProvider,
      (previous, next) {
        next.whenData((event) {
          final navigatorContext = AppRouter.router.routerDelegate.navigatorKey.currentContext;
          if (navigatorContext == null) return;
          showFlash(
            context: navigatorContext,
            duration: const Duration(seconds: 3),
            builder: (context, controller) => AppMessageToast(
              appToastMessage: event.appToastMessage,
              controller: controller,
              tempMessage: event.tempMessage,
            ),
          );
        });
      },
    );

    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: ThemeData(fontFamily: 'Lato'),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
        child: child!,
      ),
    );
  }
}
