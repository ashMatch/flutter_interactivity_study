import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget{
  const FavoriteWidget ({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 9;

  void _toggleFavorite(){
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;       
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited 
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border) ),
                  color: Colors.red,
                  onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text("$_favoriteCount"),
          ),
        ),
      ],
    );
  }
  
}

class SetUp extends StatelessWidget{
  const SetUp ({ super.key });

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Scaffold(
        appBar: null,
        body: Center(
          child: FavoriteWidget()),
      ),
    );
  }
}
