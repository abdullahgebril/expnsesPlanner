import 'package:flutter/material.dart';
import 'package:expnses_planner/model/Transcation.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTranscation;

  TranscationList(this.transcations,this.deleteTranscation);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
          ? LayoutBuilder(builder: (cnx,constains) {
             return Column(
               children: <Widget>[
                 Text(
                   'No transctions added yet!',
                   style: Theme.of(context).textTheme.title,
                 ),
                 Container(
                   height: constains.maxHeight *0.6,
                   child: Image.asset(
                     'assets/images/waiting.jpg',
                     fit: BoxFit.cover,
                   ),
                 ),
               ],
             );
    })

          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transcations[index].amount}',style: TextStyle(fontSize: 18,color: Colors.white),)),
                      ),
                    ),
                    title: Text(transcations[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transcations[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 400 ? FlatButton.icon(onPressed:()=> deleteTranscation(transcations[index].id) ,
                        icon: Icon(Icons.delete), label: Text('delete'), textColor: Theme.of(context).errorColor)
                        : IconButton(
                      onPressed: ()=> deleteTranscation(transcations[index].id) ,
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,

                    ),
                  ),
                );
              },
              itemCount: transcations.length);
  }
}
