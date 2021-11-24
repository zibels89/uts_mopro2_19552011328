import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts_mopro2_19552011328/models/model_produk.dart';
import 'package:uts_mopro2_19552011328/screens/menu/item_detail.dart';
import 'package:uts_mopro2_19552011328/screens/menu/provider_menu/search_providers.dart';
import 'package:provider/provider.dart';

/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */

/// ini adalah menu

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static final ModelProduk _modelProduk = ModelProduk();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(_modelProduk.listProduct),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey[700]!,
              width: 1,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade900,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          title: Image.asset(
            'aset/img/banner.png',
            width: 150,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Consumer<SearchProvider>(builder: (_, searchProvider, __) {
                return TextFormField(
                  controller: searchProvider.searchControl,
                  onTap: () {
                    FocusScope.of(context).requestFocus(
                      searchProvider.focusNode,
                    );
                  },
                  onChanged: searchProvider.searchOperation,
                  onEditingComplete: () {
                    searchProvider.isSearch = false;
                    FocusScope.of(context).unfocus();
                  },
                  focusNode: searchProvider.focusNode,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (searchProvider.isSearch) {
                          searchProvider.searchResult.clear();
                          searchProvider.searchControl.clear();
                          searchProvider.isSearch = false;
                          FocusScope.of(context).unfocus();
                        } else {
                          searchProvider.isSearch = true;
                          FocusScope.of(context).requestFocus(
                            searchProvider.focusNode,
                          );
                        }
                      },
                      icon: searchProvider.iconSearch,
                    ),
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16.0),
            Consumer<SearchProvider>(
              builder: (context, searchProvider, child) {
                List<ModelProduk> listData = searchProvider.isSearch
                    ? searchProvider.searchResult
                    : _modelProduk.listProduct;
                if (listData.isEmpty) {
                  return const Center(
                    child: Text('Searching not found!'),
                  );
                }
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: searchProvider.isSearch
                      ? searchProvider.searchResult.length
                      : _modelProduk.listProduct.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: _buildItemList(
                        context: context,
                        modelProduk: listData[index],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemList({
    required BuildContext context,
    required ModelProduk modelProduk,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Color(modelProduk.colorHex!),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Limited Edition',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Instax ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: modelProduk.namaTipe!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '\$ ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: modelProduk.harga!.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return DetailItem(modelProduk);
                      },
                    ),
                  );
                },
                child: Text(
                  'Buy',
                  style: TextStyle(
                    color: Color(modelProduk.colorHex!),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 20.0,
          bottom: 20.0,
          child: Image.asset(
            modelProduk.gambar!,
            height: 150.0,
          ),
        ),
      ],
    );
  }
}
