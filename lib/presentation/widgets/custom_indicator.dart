// lib/presentation/widgets/custom_indicator.dart

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomProgressIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double percentage;

  const CustomProgressIndicator({
    super.key,
    this.size = 44.0,
    this.strokeWidth = 2.0,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (percentage / 100.0).clamp(0.0, 1.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _ProgressPainter(
              strokeWidth: strokeWidth,
              progress: progress,
            ),
          ),
          Text(
            "${percentage.toInt()}%",
            style: TextStyle(
              color: const Color(0xFF959595),
              fontSize: size * 0.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double progress;

  _ProgressPainter({
    required this.strokeWidth,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final basePaint = Paint()
      ..color = const Color(0xFF959595)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, basePaint);

    final sweepAngle = 2 * math.pi * progress;
    final startAngle = -math.pi / 2;

    final progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.strokeWidth != strokeWidth;
  }
}
