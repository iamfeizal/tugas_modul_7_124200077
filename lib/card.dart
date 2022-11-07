import 'package:flutter/material.dart';

class coba extends StatefulWidget {
  const coba({Key? key}) : super(key: key);

  @override
  State<coba> createState() => _cobaState();
}

class _cobaState extends State<coba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("coba coba"),
      ),
      body: _coba(),
    );
  }

//imported google's material design library
  Widget _coba() {
    return Center(
      /** Card Widget **/
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.grey[300],
        child: SizedBox(
          width: 200,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'GeeksforGeeks',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ), //Textstyle
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
                const Text(
                  ('(ABC)'),
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontStyle: FontStyle.italic), //Textstyle
                ),
              ],
            ), //Column
          ), //Padding
        ), //SizedBox
      ), //Card
    );
  }
}
