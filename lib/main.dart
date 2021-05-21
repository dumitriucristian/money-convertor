import 'package:flutter/material.dart';
//todo - create a stand alone widget for random image
void main() {
  runApp(MaterialApp(
    title: "Convert your money",
    home:MyApp(
    )
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _random = 1;
  String _amount = "0";
  Image _image = Image.network('https://picsum.photos/200/300?random=1');

      final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:Text( "Some title"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _image,
              ),
            TextFormField(
              controller: myController,

            ),
            ElevatedButton(
              onPressed: (){
               setState(() {
                 try {
                  _random++;
                   double num = double.parse( myController.text) * 2.99;
                   _amount = num.toStringAsFixed(2);
                   _image = Image.network('https://picsum.photos/500?random=$_random',
                      width: double.infinity,
                      fit: BoxFit.fill
                   );

                 } catch (e, s) {
                   showDialog(context: context,
                       builder: (BuildContext context) => AlertDialog(
                         title: Text('Sorry mate, Only decimals allowed'),
                         content: Text('Please use only nice decimals like 1.1'),
                         actions: [
                           TextButton(
                             onPressed: () => Navigator.pop(context, 'Cancel'),
                             child: Text('Ok - I will use only decimal'),
                           ),
                         ],
                       )
                   );
                 }
               });
              },
              child: Text('submit'),
            ),
            Text(
              "$_amount",
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 35)
            ),
          ],
        ),
      )
    );
  }
}


