import 'package:flutter/material.dart';
// codigo para ver interação statefull stateless
import 'favorite_widget.dart' as favorite_widget;
// codigo de gerencia de estados feitas pelo proprio widget
import 'manage_own_state.dart' as manage_own_state;
// codigo de gerencia de estados feitas pelo widget pai
import 'pareting_widget_management.dart' as pareting_widget_management;


class DigimonDex extends StatefulWidget {
  const DigimonDex ({ super.key });

  @override
  State<DigimonDex> createState() => _HandlingDigimons();
}

class _HandlingDigimons extends State<DigimonDex>{
  List<String> digimonList = ["assets/images/Agumon.png", "assets/images/Devimon.gif", "assets/images/Gabumon.gif", "assets/images/Palmon.gif", "assets/images/Patamon.gif"];
  String ?imageURL;
  String name = "assets/images/Devimon.gif";

  void _handleDigimonList(){
    setState(() {
      switch (name) {
        case "assets/images/Agumon.png":
          name = digimonList[0];
          break;
      case "assets/images/Devimon.gif":
          name = digimonList[1];
          break;
      case "assets/images/Gabumon.gif":
          name = digimonList[2];
          break;
      case "assets/images/Palmon.gif":
          name = digimonList[3];
          break;
        default:
          name = digimonList[4];
          break;
      }
      print(name);
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 240,
                child: Image(image: AssetImage(name)),
              ),
              const SizedBox(
                width: 400,
                height: 100,
                child: Text("CORRE BERG", 
                          style: TextStyle(fontWeight: FontWeight.bold,), 
                          textAlign: TextAlign.center,)),
              SizedBox(
                width: 260,
                height: 80,
                child: ElevatedButton(onPressed:() => _handleDigimonList(), child: Text("Próximo", style: TextStyle(fontSize: 40, color: Colors.white),)))
            ]);
  }
}


class DigimonArea extends StatelessWidget{
  const DigimonArea ({ super.key });

  @override
  Widget build(BuildContext context){
    return  const DigimonDex();
  }
}

void main() {
  runApp( MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
                        textTheme: const TextTheme(
                          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
                          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind')
                        )),
      home: Scaffold(
        appBar:AppBar(
          title: const Text("Saporra mexmo", style: TextStyle(color: Colors.white),)
        ),
        body:  const Center(
          child:
            DigimonArea()
          )
        )
      )
    );
  // runApp(const manage_own_state.MyApp());
  // runApp(const favorite_widget.SetUp());
/*
  runApp(
    const MaterialApp(
      home: Scaffold(
        appBar:null,
        body:  pareting_widget_management.ParentWidget(),
      ),
    )
  );
  */



}
