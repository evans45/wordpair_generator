import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() =>RandomWordsState();
}


class RandomWordsState extends State<RandomWords>{
  final _randomwordPairs = <WordPair>[];
  final _savedWordPairs = <WordPair>[];
  Widget _buildList() {
    return ListView.builder(
      padding:const EdgeInsets.all(16.0),
      itemBuilder:(context, item) {
        if(item.isOdd) return Divider();
        final index = item ~/2; //number of wordpairs in list view - divider

        if(index >= _randomwordPairs.length)_randomwordPairs.addAll(generateWordPairs().take(10));


        return _buildRow(_randomwordPairs[index]);
      },
    );

  }
  Widget _buildRow(WordPair pair){
    final alreadysaved = _savedWordPairs.contains(pair);
    return ListTile(title: Text(pair.asPascalCase, style: TextStyle
      (fontSize: 18.0)),
      trailing: Icon(alreadysaved ? Icons.favorite:
      Icons.favorite_border,
          color: alreadysaved ? Colors.red : null),
      onTap:(){
      setState((){
        if(alreadysaved){
          _savedWordPairs.remove(pair);
        }else{
          _savedWordPairs.add(pair);
        }
      });
      }

    );

  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder:(BuildContext context){
            final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair){
              return ListTile(
                title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0))
              );
            }
            );
            final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles
            ).toList();
            return Scaffold(
              appBar: AppBar(
                title: Text('saved wordpairs')),
                body: ListView(children:divided)
              );

          }
      )
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text('WordPair Generator'),
                actions :<Widget>[
                  IconButton(
            icon: Icon(Icons.list),
             onPressed:_pushSaved
        )
            ]
        ), body: _buildList());


  }
}
