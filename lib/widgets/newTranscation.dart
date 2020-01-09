import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/Cupertino.dart';
class NewTranscation extends StatefulWidget {
  final Function addTrascation;

  NewTranscation(this.addTrascation);
  @override
  _NewTranscationState createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  @override
  final titleController = TextEditingController();
  final amountController = TextEditingController();
    DateTime selectDate;


  void submitData(){
    if(amountController.text.isEmpty) {
      return;
    }
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if(enteredtitle.isEmpty || enteredamount <= 0 || selectDate == null) {
      return;
    }
    widget.addTrascation(
      enteredtitle,
        enteredamount,
        selectDate,

    );
  }



  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
          if(pickedDate == null) {
            return;
          }
          setState(() {
            selectDate = pickedDate;
          });

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        selectDate == null
                            ? 'No Date chosen'
                            : DateFormat.yMd().format(selectDate),
                      ),
                    ),
                    Platform.isIOS ?CupertinoButton(
                      color: Colors.teal,

                      onPressed: _presentDatePicker,
                      child: Text(
                        
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ) :FlatButton(
                      
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                       
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                submitData();
                },
                child: Text(
                  'Add Transcation',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class NewTranscation extends StatelessWidget {
//
//  final Function addTrascation;
//
//
//  final titleController = TextEditingController();
//  final amountController = TextEditingController();
//  NewTranscation(this.addTrascation);
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Column(
//        children: <Widget>[
//          TextField(
//            decoration: InputDecoration(
//                labelText: 'Title'),
//            controller: titleController,
//          ),
//          TextField(
//            decoration: InputDecoration(
//              labelText: 'Amount',
//
//            ),
//            keyboardType: TextInputType.number,
//            controller: amountController,
//
//          ),
//          FlatButton(
//            onPressed: (){
//
//           addTrascation(titleController.text, double.parse(amountController.text));
//
//            },
//            child: Text('Add Chart'),
//          ),
//        ],
//      ),
//
//    );
//  }
//}
