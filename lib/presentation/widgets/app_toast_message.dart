import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:suppose_test_task/presentation/enums/app_toast_message.dart';

class AppMessageToast extends StatelessWidget {
  const AppMessageToast({
    super.key,
    required this.appToastMessage,
    required this.controller,
    this.tempMessage,
  });

  static const width = double.infinity;
  static const height = 56.0;

  final AppToastMessage appToastMessage;
  final FlashController controller;
  final String? tempMessage;

  @override
  Widget build(BuildContext context) => Flash(
        controller: controller,
        position: FlashPosition.bottom,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 24,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: appToastMessage.backGroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: const EdgeInsets.only(left: 20), child: appToastMessage.icon),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        (appToastMessage == AppToastMessage.custom &&
                                tempMessage != null &&
                                tempMessage!.isNotEmpty)
                            ? tempMessage!
                            : appToastMessage.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
