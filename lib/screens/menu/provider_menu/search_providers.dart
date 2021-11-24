import 'package:flutter/material.dart';
import 'package:uts_mopro2_19552011328/models/model_produk.dart';

/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */

/// for doc comments

class SearchProvider with ChangeNotifier {
  final List<ModelProduk> listProduct;

  SearchProvider(this.listProduct) {
    searchControl.addListener(() {
      if (searchControl.text.isNotEmpty) {
        isSearch = true;
      }
    });
  }

  TextEditingController _searchControl = TextEditingController();
  List<ModelProduk> _searchResult = [];
  bool _isSearch = false;
  FocusNode _focusNode = FocusNode();

  bool get isSearch => _isSearch;

  set isSearch(bool newValue) {
    _isSearch = newValue;
    notifyListeners();
  }

  FocusNode get focusNode => _focusNode;

  set focusNode(FocusNode newValue) {
    _focusNode = newValue;
    notifyListeners();
  }

  Icon get iconSearch {
    if (isSearch) {
      return const Icon(
        Icons.close,
        color: Colors.white,
      );
    } else {
      return const Icon(
        Icons.search,
        color: Colors.white,
      );
    }
  }

  TextEditingController get searchControl => _searchControl;

  set searchControl(TextEditingController newValue) {
    _searchControl = newValue;
    notifyListeners();
  }

  List<ModelProduk> get searchResult => _searchResult;

  set searchResult(List<ModelProduk> newValue) {
    _searchResult = newValue;
    notifyListeners();
  }

  void searchOperation(String searchText) {
    searchResult.clear();
    if (searchText.isNotEmpty) {
      isSearch = true;
      for (int i = 0; i < listProduct.length; i++) {
        ModelProduk data = listProduct[i];
        if (data.namaTipe!.toLowerCase().contains(searchText.toLowerCase())) {
          searchResult.add(data);
        }
      }
    } else {
      searchResult.clear();
      isSearch = false;
    }
  }
}
