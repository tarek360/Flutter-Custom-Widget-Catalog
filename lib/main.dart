import 'package:flutter/material.dart';

import 'custom_widget_container.dart';
import 'custom_widgets_data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Api Filter list Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _filter = TextEditingController();

  String _searchText = "";

  final List<CustomWidgetData> _originalCustomWidgets = CustomWidgetsData.data;
  List<CustomWidgetData> _filteredCustomWidgets = CustomWidgetsData.data;
  Icon _searchIcon = Icon(Icons.search);
  Widget _title = Text('Flutter Custom Widget Catalog');

  Widget _appBarTitle;

  @override
  void initState() {
    super.initState();
    _appBarTitle = _title;
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _filteredCustomWidgets = _originalCustomWidgets;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _appBarTitle, actions: [
        IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        )
      ]),
      body: _buildList(),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty) {
      List<CustomWidgetData> tempList = List();
      for (int i = 0; i < _originalCustomWidgets.length; i++) {
        final customWidgetData = _originalCustomWidgets[i];
        for (int j = 0; j < customWidgetData.tags.length; j++) {
          final tag = customWidgetData.tags[j];
          if (tag.toLowerCase().contains(_searchText.toLowerCase())) {
            tempList.add(customWidgetData);
            break;
          }
        }
      }
      _filteredCustomWidgets = tempList;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widgetContainerWidth,
        childAspectRatio: widgetContainerWidth / widgetContainerHeight,
      ),
//      shrinkWrap: true,
      itemCount: _filteredCustomWidgets.length,
      itemBuilder: (BuildContext context, int index) {
        return _filteredCustomWidgets[index].widget;
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          autofocus: true,
          controller: _filter,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54)),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        this._appBarTitle = _title;
        _filteredCustomWidgets = _originalCustomWidgets;
        _filter.clear();
      }
    });
  }
}
