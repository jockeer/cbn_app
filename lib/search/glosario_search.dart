

import 'package:flutter/material.dart';

class GlosarioSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => 'Buscar Glosario';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: ()=> close(context, null), 
      icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('BuildResults', style: TextStyle(color: Colors.black),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Center(
        child: Icon(Icons.contact_page_rounded, color: Colors.black12,size: size.width*0.2,),
      );
    } else {
    return Text('BuildSeggestions $query', style: TextStyle(color: Colors.black),);
    }
  }

}