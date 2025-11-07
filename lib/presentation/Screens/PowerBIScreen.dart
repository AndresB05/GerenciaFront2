import 'package:flutter/material.dart';
import 'package:greenflow/presentation/Widgets/PowerBIViewer.dart';

class PowerBIScreen extends StatelessWidget {
  const PowerBIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Power BI report URL
    final String powerBiUrl = 
        'https://app.powerbi.com/view?r=eyJrIjoiY2YxM2U3ZDktYzcwNC00MmQ3LTg1NjUtODUyNDg4MzAzMjllIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Power BI Reports',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[900]!, Colors.blue[500]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Intelligence Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Interactive Power BI reports with real-time data visualization',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          
          // Power BI Viewer
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: PowerBIViewer(url: powerBiUrl),
            ),
          ),
          
          // Footer information
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Reports update automatically with new data',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}