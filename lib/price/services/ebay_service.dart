import 'package:auction_app/models/ebay_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class EbayService {
/**
 * 
 * Function to get the Results
 * searchTerms
 * 
 */

  Future getResults(String searchTerm) async {
    List<EbayItem> ebayItems = [];

    final url = Uri.parse(
        'https://www.ebay.de/sch/i.html?_from=R40&_trksid=p4432023.m570.l1313&_nkw=donkey+kong+country+1+JAP&_sacat=0');

    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('ul .s-item__title > span')
        .map((e) => e.innerHtml.replaceAll(RegExp(r"<!--(.*?)-->"), "").trim())
        .toList();

    final prices = html
        .querySelectorAll('ul .s-item__price > span')
        .map((e) => e.innerHtml.trim())
        .toList();

    // Create a new Item for each
    for (int i = 0; i < titles.length; i++) {
      EbayItem newItem = EbayItem("10", titles.elementAt(i));
      ebayItems.add(newItem);
    }
    for (final item in ebayItems) {
      debugPrint(item.title);
      debugPrint(item.price);
    }
  }
}
