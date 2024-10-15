import 'package:burgershop/components/cartModel.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:burgershop/pages/cartPage.dart';
import 'package:burgershop/pages/itemDesc.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:burgershop/components/tabController.dart';
import 'package:provider/provider.dart';

class homeWidget extends StatefulWidget {
  const homeWidget({super.key});
  @override
  State<homeWidget> createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  List _searchResults = [];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
          elevation: 0,
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Stack(alignment: Alignment.topRight, children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => cartList(),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_cart)),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '${shoppingCart.length}',
                          style: TextStyle(fontSize: 10),
                        ),
                      ))
                ]))
          ],
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(itemImg[0]))),
                ),
              ),
              Text(
                "THE BURGER SHOP",
                style: TextStyle(letterSpacing: 5),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                subtitle: Text("See what is in your Cart"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => cartList(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                subtitle: Text("Flutter App by Malindu Liyanage"),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Find the Best Burger for you!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        height: 1,
                        fontSize: 46,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _controller,
                      onChanged: _onSearchChanged,
                      maxLines: 1,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: "Search for your Burger!",
                        hintStyle: TextStyle(
                          fontFamily:
                              'ComicNeue', // Set font family for hint text
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: DynamicTabBarWidget(
                  indicatorColor: Colors.yellow,
                  labelColor: Colors.yellow,
                  dynamicTabs: tabs,
                  isScrollable: true,
                  onTabControllerUpdated: (controller) {},
                  onTabChanged: (index) {},
                  onAddTabMoveTo: MoveToTab.last,
                  showBackIcon: false,
                  showNextIcon: false,
                  dividerHeight: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 32,
        right: 32,
        top: MediaQuery.of(context).size.height * 0.35,
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
          elevation: 0.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(itemImg[
                                itemName.indexOf(_searchResults[index])]))),
                  ),
                ),
                title: Text(
                  _searchResults[index],
                  style: TextStyle(
                    fontFamily: 'ComicNeue',
                  ),
                ),
                onTap: () {
                  _controller.text = "";
                  _removeOverlay();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => itemDescWidget(
                        itemNumber: itemName.indexOf(_searchResults[index]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onSearchChanged(String query) {
    if (query.isEmpty) {
      _removeOverlay();
      return;
    }

    setState(() {
      _searchResults = itemName
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (_searchResults.isNotEmpty) {
      _removeOverlay();
      _showOverlay(context);
    } else {
      _removeOverlay();
    }
  }
}
