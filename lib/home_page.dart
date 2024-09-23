import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  Color activeLeftColor = Colors.grey;
  int activeIndex = -1; // To track which pair of containers is active
  late AnimationController _controller;
  late Animation<double> _animation;
  
  // List to store the curves
  List<CurveInfo> curveList = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of the animation
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the UI as the animation progresses
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to update the active left column color and the active index
  void updateActivePair(int index, Color color) {
    setState(() {
      activeLeftColor = color;
      activeIndex = index; // Set the active pair index
      // Add the new curve information to the list
      curveList.add(CurveInfo(index, color));
    });
    _controller.reset(); // Reset the animation before starting
    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curved Connection Example'),
      ),
      body: Stack(
        children: [
          // The CustomPaint widget to draw curves
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: CurvePainter(curveList, _animation.value),
          ),
          // The UI layout
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Left Column
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateActivePair(0, Colors.red); // Set active pair to Red
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeLeftColor == Colors.red
                                    ? Colors.red
                                    : Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: const Center(
                              child: Text(
                                'Red',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(1, Colors.blue); // Set active pair to Blue
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeLeftColor == Colors.blue
                                    ? Colors.blue
                                    : Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: const Center(
                              child: Text(
                                'Blue',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(2, Colors.green); // Set active pair to Green
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeLeftColor == Colors.green
                                    ? Colors.green
                                    : Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: const Center(
                              child: Text(
                                'Green',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(3, Colors.yellow); // Set active pair to Yellow
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeLeftColor == Colors.yellow
                                    ? Colors.yellow
                                    : Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: const Center(
                              child: Text(
                                'Yellow',
                                style: TextStyle(
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Right Column
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateActivePair(3, activeLeftColor); // Set active pair to match
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeIndex == 3 ? activeLeftColor : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Right 1',
                                style: TextStyle(
                                  color: activeIndex == 3 ? activeLeftColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(2, activeLeftColor); // Set active pair to match
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeIndex == 2 ? activeLeftColor : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Right 2',
                                style: TextStyle(
                                  color: activeIndex == 2 ? activeLeftColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(1, activeLeftColor); // Set active pair to match
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeIndex == 1 ? activeLeftColor : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Right 3',
                                style: TextStyle(
                                  color: activeIndex == 1 ? activeLeftColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateActivePair(0, activeLeftColor); // Set active pair to match
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: activeIndex == 0 ? activeLeftColor : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Right 4',
                                style: TextStyle(
                                  color: activeIndex == 0 ? activeLeftColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Class to store the curve information
class CurveInfo {
  final int activeIndex;
  final Color color;

  CurveInfo(this.activeIndex, this.color);
}

class CurvePainter extends CustomPainter {
  final List<CurveInfo> curveList;
  final double progress; // Animation progress (from 0.0 to 1.0)

  CurvePainter(this.curveList, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    if (curveList.isEmpty) return;

    Paint paint = Paint()
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    double startX = 150;
    double endX = size.width - 150;

    for (var curve in curveList) {
      paint.color = curve.color;
      double startY;
      double endY;

      if (curve.activeIndex == 0) {
        startY = 80.0;
        endY = 50.0 + 3 * 120;
      } else if (curve.activeIndex == 1) {
        startY = 50.0 + 1 * 140;
        endY = 100.0 + 2 * 110;
      } else if (curve.activeIndex == 2) {
        startY = 40.0 + 2 * 140;
        endY = 150.0 + 1 * 30;
      } else {
        startY = 10.0 + 3 * 140;
        endY = 60.0;
      }

      Path path = Path();
      path.moveTo(startX, startY);
      path.quadraticBezierTo(
        size.width / 2,
        (startY + endY) / 2 - 100 * progress,
        endX,
        endY,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}