import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List demo',
      home: ListDemo(),
    );
  }
}
class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Demo'),

      ),
      body: MyList()
    );
  }
}


class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding:  const EdgeInsets.all(4.0),
      itemBuilder: (context,i){
        return ListTile(
          title: Text('some random name of user',style: TextStyle(fontSize: 20.0,color: Colors.green),),
          subtitle: Text('online',style: TextStyle(fontSize: 10.0,color: Colors.black),),
          leading: Icon(Icons.face),
          trailing: RaisedButton(
            child: Text('Remove'),
            onPressed: (){
              deletedialog(context).then((value){
                print('Value is $value');
              });
            },
          ),
        );
      },

    );
  }
}


Future<bool>deletedialog(BuildContext context){
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Are You Sure?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );

  });
}