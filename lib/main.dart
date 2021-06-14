import 'package:flutter/material.dart';
import './random_words.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //final wordPair = WordPair.random();//final is used for variables that cannot be re-assigned
    //WordPair is an object that comes with the english words package
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),//setting primary app color to purple
        home: RandomWords() /*Scaffold(
          appBar: AppBar(title: Text('WordPair Generator')),//creating app bar and adding text to it
          body: Center(child: Text(wordPair.asPascalCase))//adding text to the body of an application
        )*/);
 }
}

