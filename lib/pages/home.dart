import 'package:flutter/material.dart';
import '../services/helper.dart';
import 'database.dart';
import 'scan_qr.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('My Scanner'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          FeatureCard(
            icon: Icons.qr_code_scanner,
            title: 'Scan a QR',
            onTap: ()=>Navigator.push(
              context,
              MaterialPageRoute(builder:(_)=>const ScanQR()),
            ),
          ),
          const SizedBox(height: 36),
          FeatureCard(
            icon: Icons.data_object,
            title: 'Scanned data',
            onTap: ()=>Navigator.push(
              context,
              MaterialPageRoute(builder:(_)=>const Database()),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const FeatureCard({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context){
    final double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: width*0.7,
          height: width*0.7,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(2,2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 100),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}