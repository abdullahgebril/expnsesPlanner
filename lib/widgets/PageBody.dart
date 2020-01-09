//
//
//import 'package:expnses_planner/widgets/Chart.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//import 'package:expnses_planner/widgets/transcationList.dart';
//import 'dart:io';
//import 'package:flutter/Cupertino.dart';
//import 'package:expnses_planner/model/Transcation.dart';
//import 'package:expnses_planner/widgets/newTranscation.dart';
//class PageBody extends StatefulWidget {
//  @override
//  _PageBodyState createState() => _PageBodyState();
//}
//
//class _PageBodyState extends State<PageBody> {
//  final List<Transcation> _userTranscation = [
////    Transcation(id: 't1', title: 'shoas', amount: 14.2, date: DateTime.now()),
////    Transcation(id: 't1', title: 'shoas', amount: 14.2, date: DateTime.now()),
//  ];
//  List<Transcation> get _getuserTranscation {
//    return _userTranscation.where((transcation) {
//      return transcation.date.isAfter(
//        DateTime.now().subtract(
//          Duration(days: 7),
//        ),
//      );
//    }).toList();
//  }
//
//  void addTranscation(String title, double amount, DateTime choosenDate) {
//    Transcation newTranscation = Transcation(
//        id: DateTime.now().toString(),
//        title: title,
//        amount: amount,
//        date: choosenDate);
//    setState(() {
//      _userTranscation.add(newTranscation);
//      Navigator.of(context).pop();
//    });
//  }
//  void deleteTranscation(String id) {
//    setState(() {
//      _userTranscation.removeWhere((transcation) => transcation.id == id);
//    });
//  }
//  void startTranscation(BuildContext cnt) {
//    showModalBottomSheet(
//        context: cnt,
//        builder: (_) {
//          return GestureDetector(
//            onTap: () {},
//            child: NewTranscation(addTranscation),
//            behavior: HitTestBehavior.opaque,
//          );
//        });
//
//
//  Widget build(BuildContext context) {
//    final checkorientation =
//        MediaQuery.of(context).orientation == Orientation.landscape;
//    bool _switchValue = false;
//    final transcationListContainer = Container(
//        height: (MediaQuery.of(context).size.height -
//            appBar.preferredSize.height -
//            MediaQuery.of(context).padding.top) *
//            0.7,
//        child: TranscationList(_userTranscation, deleteTranscation));
//
//    @override
//    return SafeArea(
//      child: SingleChildScrollView(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            if (checkorientation)
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text('Show chart',style: Theme.of(context).textTheme.title,),
//                  Switch.adaptive(
//                    value: _switchValue,
//                    onChanged: (val) {
//                      setState(() {
//                        _switchValue = val;
//                      });
//                    },
//                  ),
//                ],
//              ),
//            if (!checkorientation)
//              Container(
//                height: (MediaQuery.of(context).size.height -
//                    appBar.preferredSize.height -
//                    MediaQuery.of(context).padding.top) *
//                    0.3,
//                child: Chart(_getuserTranscation),
//              ),
//            if (!checkorientation) transcationListContainer,
//            if (checkorientation)
//              _switchValue
//                  ? Container(
//                height: (MediaQuery.of(context).size.height -
//                    appBar.preferredSize.height -
//                    MediaQuery.of(context).padding.top) *
//                    0.7,
//                child: Chart(_getuserTranscation),
//              )
//                  : transcationListContainer
//          ],
//        ),
//      ),
//    );
//  }
//}
//
