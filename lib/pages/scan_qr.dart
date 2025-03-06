import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/helper.dart';
import '../services/sqlite.dart';
import '../widgets/button.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});
  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

	late final MobileScannerController _controller;

	@override
	void initState(){
		super.initState();
		_controller = MobileScannerController(
			detectionSpeed: DetectionSpeed.noDuplicates,
		);
	}

	@override
	void dispose(){
		_controller.dispose();
		super.dispose();
	}

	void _process(String data)async{
		bool? answer = await confirm(context,'Save QR data?\n$data');
		if(answer==true){
			try {
				print('Saving this: $data');
				await SQLite.createData(data);
				await alert(context,'Saved data');
			} catch(e) {
				await alert(context,'An error happened');
			}
		}
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      	child: Expanded(
      		child: Center(
      			child: MobileScanner(
							  controller: _controller,
							  onDetect: (BarcodeCapture capture){
							    String? data = capture.barcodes.first.rawValue;
							    if(data==null)return;
							    _process(data);
							  },
							),
		      	),
      		),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
	const MyBottomNavigationBar({super.key});
	@override
	Widget build(BuildContext context)=>Container(
		height: 72,
		width: MediaQuery.of(context).size.width,
		color: Colors.black,
		child: Padding(
			padding: const EdgeInsets.symmetric(
				horizontal: 16,
				vertical: 7,
			),
			child: const Text(
				'Focus now the QR',
				style: TextStyle(
					fontWeight: FontWeight.bold,
					fontSize: 18,
					color: Colors.white,
				),
				textAlign: TextAlign.center,
			)
		),
	);
}