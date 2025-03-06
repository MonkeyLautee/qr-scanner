import 'package:flutter/material.dart';
import '../services/sqlite.dart';
import '../services/helper.dart';
import '../widgets/button.dart';
import 'see_qr.dart';

class Database extends StatefulWidget {
  const Database({super.key});
  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

	List<Map<String,dynamic>>? _data;

	@override
	void initState(){
		super.initState();
		WidgetsBinding.instance.addPostFrameCallback((_)async{
			List<Map<String,dynamic>>? data = await SQLite.getAllData();
			setState(()=>_data = data);
		});
	}

	Widget _buildDataList(List<Map<String,dynamic>> data){
		return Column(
			children: data.map<Widget>((Map<String,dynamic> qrData){
				final String title = qrData['string'];
				final DateTime date = DateTime.fromMillisecondsSinceEpoch(qrData['lastModified']);
				final String lastModifiedString = '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute}:${date.second}';
				return Card(
					elevation: 4.7,
					child: ListTile(
						title: Text(title),
						subtitle: Text(lastModifiedString),
						trailing: IconButton(
							icon: Icon(Icons.qr_code),
							onPressed: ()=>Navigator.push(
	              context,
	              MaterialPageRoute(builder:(_)=>SeeQR(title)),
	            ),
						),
					),
				);
			}).toList()
		);
	}

  Widget build(BuildContext context) {
    return Scaffold(
    	appBar: AppBar(
    		title: const Text('Base de datos'),
    	),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 12),
          _data==null?Center(
          	child: CircularProgressIndicator(color: Colors.blue),
          ):_buildDataList(_data!),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}