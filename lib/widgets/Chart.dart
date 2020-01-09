import 'package:flutter/material.dart';

import 'package:expnses_planner/model/Transcation.dart';
import 'package:intl/intl.dart';
import 'package:expnses_planner/widgets/ChartBar.dart';
class Chart extends StatelessWidget {

final List<Transcation> transcations;
Chart(this.transcations);



List<Map<String,Object>> get groupOFTranscation {
  return List.generate(7, (index){
    final weakDay = DateTime.now().subtract(Duration(
      days: index
    ),);
    double totalAmout = 0.0;
    for(int i =0 ; i<transcations.length;i++) {
      if(weakDay.day == transcations[i].date.day
          && weakDay.month == transcations[i].date.month &&
          weakDay.year == transcations[i].date.year){
      totalAmout += transcations[i].amount;
    }
    }

    return {'day':DateFormat.E().format(weakDay).substring(0,1),'amount':totalAmout};
  }).toList();
}
  double get totalAmount {
  return groupOFTranscation.fold(0,(sum,item) => sum+ item['amount']);

  }


  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: groupOFTranscation.map((data){
             return ChartBar(data['day'],data['amount'], totalAmount == 0.0 ? 0 : (data['amount']as double)/totalAmount) ;
          }).toList(),
        ),
      ),
    );
  }
}
