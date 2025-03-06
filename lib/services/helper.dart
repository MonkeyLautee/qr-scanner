import 'package:flutter/material.dart';

Future<void> alert(BuildContext context, String message)async{
  await showDialog(
    context:context,
    barrierDismissible: false,
    builder:(context){
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(message,style:TextStyle(fontSize:17,color:Theme.of(context).colorScheme.onSurface),textAlign:TextAlign.center),
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed:()=>Navigator.pop(context),
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                ),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal:32),
                  child: Text('Ok',style:TextStyle(color:Theme.of(context).colorScheme.onPrimary)),
                ),
              ),
            ],
          ),
        ],
      );
    }
  );
}

Future<bool?> confirm(BuildContext context, String question)async{
  bool? answer;
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(question,style:TextStyle(fontSize:17,color:Theme.of(context).colorScheme.onSurface)),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:23),
                  child: Text('Yes',style:TextStyle(fontSize:17,color:Theme.of(context).colorScheme.onPrimary)),
                ),
                onPressed: (){
                  answer = true;
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height:12),
              ElevatedButton(
                style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:23),
                  child: Text('No',style:TextStyle(fontSize:17,color:Theme.of(context).colorScheme.onPrimary)),
                ),
                onPressed: (){
                  answer = false;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
  return answer;
}