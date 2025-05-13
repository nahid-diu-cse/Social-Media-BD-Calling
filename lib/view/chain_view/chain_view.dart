import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:social_media/res/appImage/App_images.dart';
import 'package:social_media/res/commonWidget/custom_app_bar.dart';

class ChainView extends StatefulWidget {
  @override
  _ChainViewState createState() => _ChainViewState();
}

class _ChainViewState extends State<ChainView> {
  var json = {
    "edges": [
      {"from": "A", "to": "B"},
      {"from": "C", "to": "B"},
      {"from": "D", "to": "E"},
      {"from": "F", "to": "D"},
      {"from": "B", "to": "D"},
      {"from": "B", "to": "G"},
      {"from": "B", "to": "H"},
      {"from": "I", "to": "J"},
      {"from": "I", "to": "K"},
      {"from": "E", "to": "L"},
      {"from": "D", "to": "I"},
      {"from": "F", "to": "M"},
      {"from": "F", "to": "N"},
      {"from": "F", "to": "O"},
      {"from": "P", "to": "C"},
      {"from": "Q", "to": "C"},
      {"from": "R", "to": "P"},
      {"from": "S", "to": "Q"},
      {"from": "A", "to": "F"},
      {"from": "G", "to": "D"},
      {"from": "H", "to": "I"},
      {"from": "J", "to": "K"},
      {"from": "L", "to": "M"},
      {"from": "N", "to": "O"},
      {"from": "Q", "to": "R"},
      {"from": "S", "to": "T"},
      {"from": "T", "to": "U"},
      {"from": "V", "to": "W"},
      {"from": "W", "to": "X"},
      {"from": "X", "to": "Y"}
    ]

  };

  final Graph graph = Graph()..isTree = true;
  final String primaryNodeId = "E";  // Set primary node ID

  @override
  void initState() {
    super.initState();
    _buildGraph();
  }

  void _buildGraph() {
    var edges = json['edges'];
    for (var element in edges!) {
      var fromNodeId = element['from'];
      var toNodeId = element['to'];
      // Add the edge from 'from' to 'to'
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
    }

    builder
      ..nodeSeparation = 15
      ..levelSeparation = 15
      ..orientation = SugiyamaConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Graph View",
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.01,
              maxScale: 5.6,
              child: GraphView(
                graph: graph,
                algorithm: SugiyamaAlgorithm(builder),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  var a = node.key!.value;
                  return rectangleWidget(a, node);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Update this widget to display an image and make primary node centered
  Widget rectangleWidget(String? a, Node node) {
    bool isPrimaryNode = a == primaryNodeId;

    return Container(
      color: isPrimaryNode ? Colors.blue : Colors.amber,  // Primary node gets a distinct color
      child: InkWell(
        onTap: () {
          print('clicked');
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
            ],
          ),
          child: Column(
            children: [
              Image.asset(AppImages.hanna), // Image for all nodes
              SizedBox(height: 8),
              Text('$a'),  // Node ID displayed here
            ],
          ),
        ),
      ),
    );
  }

  final SugiyamaConfiguration builder = SugiyamaConfiguration();
}
