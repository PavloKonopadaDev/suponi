// lib/presentation/widgets/photo_info_container.dart

import 'dart:ui';
import 'package:flutter/material.dart';

class PhotoInfoContainer extends StatelessWidget {
  const PhotoInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> infoItems = [
      {
        'text': 'Make sure that your image',
        'style': 'headline',
      },
      {
        'text': 'Shows your face clearly',
        'style': 'body',
      },
      {
        'text': 'Yourself only, no group pic',
        'style': 'body',
      },
      {
        'text': 'No fake pic, object or someone else',
        'style': 'body',
      },
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: 343,
          height: 186,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            border: Border.all(
              color: const Color(0xFF959595),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: infoItems.map((item) {
              if (item['style'] == 'headline') {
                return Text(
                  item['text']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check,
                        color: Color(0xFF959595),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['text']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF959595),
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
