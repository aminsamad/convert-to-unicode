import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController? _controller;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String result = '';
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _key,
          appBar: AppBar(title: Text("Convert to unicode")),
          body: Column(
            children: [
              Column(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: 1,
                  ),
                  SizedBox(height: 50),
                  CupertinoButton(
                    child: Text("Convert"),
                    onPressed: () {
                      setState(() {
                        result = _controller!.text
                            .replaceAll('ض', 'چ')
                            .replaceAll('ذ', 'ژ')
                            .replaceAll('ط', 'گ')
                            .replaceAll('ث', 'پ')
                            .replaceAll('ظ', 'ڤ')
                            .replaceAll('ؤ', 'ۆ')
                            .replaceAll('ة', 'ە')
                            .replaceAll('ي', 'ی')
                            .replaceAll('رِ', 'ڕ')
                            .replaceAll('لَ', 'ڵ')
                            .replaceAll('يَ', 'ێ')
                            .replaceAll('وَ', 'ۆ')
                            .replaceAll('ىَ', 'ێ')
                            .replaceAll('یَ', 'ێ')
                            .replaceAll('ك', 'ک');
                      });
                    },
                    color: Colors.blue,
                  )
                ],
              ),
              Divider(),
              SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    FlutterClipboard.copy(result);
                    _key.currentState!
                        .showSnackBar(SnackBar(content: Text("كۆپی بوو !")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: SelectableText(
                      result,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
