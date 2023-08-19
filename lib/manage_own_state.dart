import "package:flutter/material.dart";

class TapboxA extends StatefulWidget {
  const TapboxA ({ super.key });

  @override
  State<TapboxA> createState() => _ManageTapBoxA();
}

class _ManageTapBoxA extends State<TapboxA> {
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.blue[600] : Colors.orange[600],
          borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Center(
          child: Text(
            _active ? "Ativo" : "Inativo",
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "demo app Flutter",
      home: Scaffold(
        appBar: null,
        body: Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}

