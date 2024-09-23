import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final int leftIndex;
  final int rightIndex;
  final double boxHeight;
  final double boxWidth;

  CurvePainter({
    required this.leftIndex,
    required this.rightIndex,
    required this.boxHeight,
    required this.boxWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue // Ubah warna kurva menjadi sesuai gambar
      ..strokeWidth = 4 // Sesuaikan ketebalan kurva
      ..style = PaintingStyle.stroke;

    final startX = 20 + boxWidth;
    final startY = 20 + leftIndex * (boxHeight + 10) + boxHeight / 2;
    final endX = size.width - 20 - boxWidth;
    final endY = 20 + rightIndex * (boxHeight + 10) + boxHeight / 2;

    // Gunakan quadratic bezier dengan titik kontrol yang lebih melengkung
    Path path = Path();
    path.moveTo(startX, startY);
    path.quadraticBezierTo(
      size.width / 2, // Kontrol di tengah-tengah sumbu X
      (startY + endY) / 2 - 100, // Sesuaikan kontrol Y untuk melengkung seperti gambar
      endX,
      endY,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
