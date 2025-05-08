import 'package:flutter/material.dart';
import 'dart:math' as math;

// Custom painter to draw connections between nodes
class ConnectionPainter extends CustomPainter {
  final List<Offset> nodes;
  final Offset center;

  ConnectionPainter(this.nodes, this.center);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw lines from the center to each surrounding node
    for (var node in nodes) {
      canvas.drawLine(center, node, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ChainMapView extends StatelessWidget {
  final List<String> friends; // List of friend image paths

  const ChainMapView({super.key, this.friends = const ["g","h","h","h","h","h","h","h","h","h","h","h","h",]});

  @override
  Widget build(BuildContext context) {
    const double centerX = 200; // Center of the widget (width/2)
    const double centerY = 300; // Center of the widget (height/2)
    const double radius = 120; // Distance from center to surrounding nodes
    const double nodeSize = 60; // Size of each node

    // List to store positions of surrounding nodes
    List<Offset> nodePositions = [];
    Offset centerPosition = const Offset(centerX, centerY);

    // Dynamically calculate positions for surrounding nodes in a circle
    for (int i = 0; i < friends.length; i++) {
      double angle = (2 * math.pi / friends.length) * i; // Distribute evenly in a circle
      double x = centerX + radius * math.cos(angle) - nodeSize / 2;
      double y = centerY + radius * math.sin(angle) - nodeSize / 2;
      nodePositions.add(Offset(x, y));
    }

    return Center(
      child: SizedBox(
        width: 400,
        height: 600,
        child: Stack(
          children: [
            // Draw connections behind the nodes
            CustomPaint(
              size: Size.infinite,
              painter: ConnectionPainter(
                nodePositions,
                centerPosition,
              ),
            ),

            // Center node (your profile)
            Positioned(
              left: centerX - nodeSize / 2,
              top: centerY - nodeSize / 2,
              child: _buildUserNode("assets/images/aliza.png"),
            ),

            // Surrounding nodes (friends)
            ...List.generate(friends.length, (index) {
              return Positioned(
                left: nodePositions[index].dx,
                top: nodePositions[index].dy,
                child: _buildUserNode(friends[index]),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildUserNode(String imagePath, {double size = 60}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: ClipOval(
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildAddNode({double size = 40}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.shade50,
      ),
      child: const Icon(Icons.add, color: Colors.blue),
    );
  }
}