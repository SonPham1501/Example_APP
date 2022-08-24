import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _items = <String>['proud', 'determined', 'satisfied'];
  int? _selectedItem;

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
    leading: const Icon(Icons.close, color: Colors.blue),
    actions: _actionAppBar,
  );

  List<Widget> get _actionAppBar => [
    _donotAction(),
    const SizedBox(width: 10),
    _downTime(),
    const SizedBox(width: 10),
  ];

  Chip _donotAction() {
    return const Chip(
      label: Text(
        "I don't known",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Widget _downTime() {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      label: const Text('0:49', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _content(),
          const SizedBox(height: 60),
          Expanded(child: _listAnwser()),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  ListView _listAnwser() => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemCount: _items.length,
    itemBuilder: (BuildContext context, int index) {
      return _itemAnwser(index);
    },
    separatorBuilder: (BuildContext context, int index) {
      return index == _items.length - 1 ? const SizedBox.shrink() : const SizedBox(height: 20);
    },
  );

  Widget _itemAnwser(int index) {
    return GestureDetector(
      onTap: () {
        _selectedItem = index;
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: index == _selectedItem
            ? Border.all(
              color: Colors.blue,
              width: 1,
            )
            : null,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0,3),
              blurRadius: 6,
              spreadRadius: 0,
              color: Colors.grey.shade100,
            ),
          ]
        ),
        child: Text(_items[index], textAlign: TextAlign.center,),
      ),
    );
  }

  Text _content() => const Text(
    'Choos the best word to complete the sentence: "He was completely ... with the work that we did."',
    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500, height: 1.2),
  );

}