import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:zlatan_quote/quote.dart';
import 'package:zlatan_quote/randomization.dart';
import 'howto.dart';
import 'about.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<ZQuote> zlatanQuotes = await loadZlatanQuote();
  runApp(MyApp(zlatanQuotes));
}

Future<List<ZQuote>> loadZlatanQuote() async {
  return await rootBundle
      .loadString('data/quotes.json')
      .then((String raw) => json.decode(raw) as List)
      .then((List list) {
    List<ZQuote> temporaryQuotes = [];
    list.forEach((element) {
      temporaryQuotes.add(ZQuote.getZQuoteFromJSON(element));
    });
    return temporaryQuotes;
  });
}

class MyApp extends StatelessWidget {
  List<ZQuote> zlatanQuotes;
  MyApp(this.zlatanQuotes);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zlatan Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(zlatanQuotes: zlatanQuotes),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<ZQuote> zlatanQuotes;
  MyHomePage({Key key, @required this.zlatanQuotes}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _imageSource;
  ZQuote _currentQuote;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _randomizeAndGetImage() {
    int imagePointer = getRandomNumberFromListSize(7) + 1;
    setState(() {
      _imageSource = 'images/' + imagePointer.toString() + '.jpg';
    });
    return _imageSource;
  }

  ZQuote _randomizeAndGetQuote() {
    int quotePointer = getRandomNumberFromListSize(widget.zlatanQuotes.length);
    setState(() {
      _currentQuote = widget.zlatanQuotes[quotePointer];
    });
    return _currentQuote;
  }

  bool isEventAvailable() {
    return _currentQuote.event.length > 0;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageSource == null) {
      _randomizeAndGetImage();
      _randomizeAndGetQuote();
    }
    print('====================');
    print(_imageSource);
    print('====================');
    print(_currentQuote.quote);
    print('====================');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            _imageSource,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.fill,
          ),
          Container(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              _currentQuote.event,
              style: TextStyle(fontSize: 16.0),
              softWrap: true,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              _currentQuote.quote,
              style: TextStyle(
                fontSize: 24.0,
                decoration: TextDecoration.none,
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
            ),
          ),
          Container(
            height: 45.0,
          ),
          ButtonTheme(
              minWidth: 175.0,
              height: 50.0,
              child: RaisedButton(
                color: Colors.blue,
                shape: StadiumBorder(),
                onPressed: () {
                  _randomizeAndGetQuote();
                  _randomizeAndGetImage();
                },
                child: Text("Refresh",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              )),
        ],
      ),
      floatingActionButton: SpeedDial(
        marginRight: 20,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 20.0),
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayOpacity: 0.5,
        onOpen: () => _incrementCounter(),
        tooltip: 'Menu',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 10.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.help),
            label: 'How to use',
            labelStyle: TextStyle(fontSize: 15.0),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HowToPage()))
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.lightbulb_outline),
            label: 'About',
            labelStyle: TextStyle(fontSize: 15.0),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutPage()))
            },
          ),
        ],
      ),
    );
  }
}
