import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../services/helper.dart';
import '../widgets/button.dart';

class SeeQR extends StatelessWidget {
	final String data;
  const SeeQR(this.data,{super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    	appBar: AppBar(
    		title: const Text('QR viewer'),
    	),
      body: Padding(
      	padding: const EdgeInsets.all(16),
      	child: Column(
      		children: [
      			Expanded(
      				child: Center(
      					child: PrettyQrView.data(data: data),
      				),
      			),
      			Container(
      				color: Colors.black,
      				width: double.infinity,
      				height: 72,
      				child: Padding(
      					padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      					child: Text(
      						data,
      						style: TextStyle(
      							color: Colors.white,
      							fontWeight: FontWeight.bold,
      							fontSize: 18,
      						),
      					),
      				),
      			),
      		],
      	),
      ),
    );
  }
}