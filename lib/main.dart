import 'package:expnses_planner/widgets/Chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/newTranscation.dart';
import 'model/Transcation.dart';
import 'widgets/transcationList.dart';
import 'dart:io';
import 'package:flutter/Cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.teal,
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                        fontFamily: 'OSwald',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = false;
  final List<Transcation> _userTranscation = [
//    Transcation(id: 't1', title: 'shoas', amount: 14.2, date: DateTime.now()),
//    Transcation(id: 't1', title: 'shoas', amount: 14.2, date: DateTime.now()),
  ];
  List<Transcation> get _getuserTranscation {
    return _userTranscation.where((transcation) {
      return transcation.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addTranscation(String title, double amount, DateTime choosenDate) {
    Transcation newTranscation = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: choosenDate);
    setState(() {
      _userTranscation.add(newTranscation);
      Navigator.of(context).pop();
    });
  }

  void deleteTranscation(String id) {
    setState(() {
      _userTranscation.removeWhere((transcation) => transcation.id == id);
    });
  }

  void startTranscation(BuildContext cnt) {
    showModalBottomSheet(
        context: cnt,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTranscation(addTranscation),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Widget> _buildLandScape(
    final appBar,
    Widget transcationListContainer,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show chart'),
          Switch.adaptive(
            value: _switchValue,
            onChanged: (val) {
              setState(() {
                _switchValue = val;
              });
            },
          ),
        ],
      ),
      _switchValue
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: Chart(_getuserTranscation),
            )
          : transcationListContainer
    ];
  }

  List<Widget> _buildPortrait(final appBar, Widget transcationListContainer) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: Chart(_getuserTranscation),
      ),
      transcationListContainer,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Expenses Planner '),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () => startTranscation(context),
                  child: Icon(CupertinoIcons.add),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Expenses Planner '),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startTranscation(context),
              )
            ],
          );

    final checkorientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final transcationListContainer = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TranscationList(_userTranscation, deleteTranscation));
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (checkorientation)
              ..._buildLandScape(appBar, transcationListContainer),
            if (!checkorientation)
              ..._buildPortrait(appBar, transcationListContainer),

            FloatingActionButton(


      child: Icon(Icons.add),
      onPressed: () => startTranscation(context),
       ),



          ],
        ),

      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,

          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton:
                 FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => startTranscation(context),
                  ),
          );
  }
}
