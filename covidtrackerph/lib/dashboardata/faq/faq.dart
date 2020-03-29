import 'faqdata.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:   Scaffold(
      appBar: AppBar(
        
         
        bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.w600,),
          indicatorColor: Colors.white,
         indicatorWeight: 5,
          tabs: [
          
            Tab(
              text: "QUESTIONS",

            ),
            Tab(
              text: "FACTS/MYTH BUSTERS",
            )
          ],
        ),
       
          title: Text(
            "ABOUT COVID-19",
            style: TextStyle(fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            questTiles(),
            mythTiles()
            
          ],
        ),
      ),
    );
  }
}

Widget questTiles(){
  return   ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return StuffInTilesQuestion(questionsEntry: questionsList[index]);
                },
                itemCount: questionsList.length,
            );
}

Widget mythTiles(){
  return   ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return StuffInTilesMyth(mythsEntry: mythsList[index]);
                },
                itemCount: mythsList.length,
            );
}
class StuffInTilesMyth extends StatelessWidget {
  final MythsEntry mythsEntry;

  const StuffInTilesMyth({Key key, this.mythsEntry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildTiles(mythsEntry);
  }

  Widget _buildTiles(MythsEntry q){
    if(q.children.isEmpty){
      return ListTile(title: Text(q.title),);
    }
    return ExpansionTile(
      
      key: PageStorageKey<MythsEntry>(q),
      title: Text(q.title,style: TextStyle(fontWeight: FontWeight.bold)),
      children: q.children.map(_buildTiles).toList(),
    );
  }
}
class StuffInTilesQuestion extends StatelessWidget {
  final QuestionsEntry questionsEntry;

  const StuffInTilesQuestion({Key key, this.questionsEntry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildTiles(questionsEntry);
  }

  Widget _buildTiles(QuestionsEntry q){
    if(q.children.isEmpty){
      return ListTile(title: Text(q.title),);
    }
    return ExpansionTile(
      key: PageStorageKey<QuestionsEntry>(q),
       title: Text(q.title,style: TextStyle(fontWeight: FontWeight.bold)),
      children: q.children.map(_buildTiles).toList(),
    );
  }
}