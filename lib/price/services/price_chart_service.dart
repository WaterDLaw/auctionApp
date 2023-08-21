import 'package:auction_app/models/game_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:intl/intl.dart';

class PriceChartService {
/**
 * 
 * Function to get the Results
 * searchTerms
 * 
 */
  List<GameItem> gameItems = [];
  // Array welche alle konsolen für das scrappen beinhaltet
  var consoleNames = [
    'famicom',
    'super-famicom',
    'jp-nintendo-64',
    'jp-gamecube',
    'jp-wii',
    'jp-gameboy',
    'jp-switch',
    'jp-gameboy-color',
    'jp-gameboy-advance',
    'jp-nintendo-ds',
    'jp-nintendo-3ds'
        'jp-sega-mega-drive',
    'jp-sega-saturn',
    'jp-sega-game-gear'
        'jp-playstation',
    'famicom-disk-system'
  ];

  Future getPriceChartConsole(String console) async {
    // Cursor für das infinity scroll wichtig
    int cursor = 0;
    int endcursor = 0;

    List<String> allTitles = [];
    List<String> allLoosePrices = [];
    List<String> allCIBPrices = [];
    List<String> allNewPrices = [];

    // Depending on the console the endcursor is different
    if (console == "famicom") {
      endcursor = 1100;
    } else if (console == "super-famicom") {
      endcursor = 1500;
    }

    // It will always be the day before to be up to date
    var now = DateTime.now();
    var newDate = now.subtract(const Duration(days: 1));
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(newDate);

    for (int i = cursor; i <= endcursor; i = i + 50) {
      debugPrint(i.toString());
      // Url wird dynamisch nach auswahl hergestellt
      final url = Uri.parse('https://www.pricecharting.com/console/' +
          console +
          '?sort=&release-date=' +
          formattedDate +
          '&cursor=' +
          i.toString());

      final response = await http.get(url);
      dom.Document html = dom.Document.html(response.body);

      final titles = html
          .querySelectorAll('td.title > a')
          .map((e) => e.innerHtml.trim())
          .toList();

      final priceLoose = html
          .querySelectorAll('td.price.numeric.used_price > span')
          .map((e) => e.innerHtml.trim())
          .toList();

      final priceCIB = html
          .querySelectorAll('td.price.numeric.cib_price > span')
          .map((e) => e.innerHtml.trim())
          .toList();

      final priceNew = html
          .querySelectorAll('td.price.numeric.new_price > span')
          .map((e) => e.innerHtml.trim())
          .toList();

      // Add the values to the lists if they are new
      for (int i = 0; i < titles.length; i++) {
        if (!allTitles.contains(titles.elementAt(i))) {
          // Add infos
          allTitles.add(titles.elementAt(i));
          allLoosePrices.add(priceLoose.elementAt(i));
          allCIBPrices.add(priceCIB.elementAt(i));
          allNewPrices.add(priceNew.elementAt(i));
        }
      }
    }

    debugPrint(allTitles.length.toString());

    for (int i = 0; i < allTitles.length; i++) {
      GameItem gameItem = GameItem(
          allTitles.elementAt(i),
          allLoosePrices.elementAt(i),
          allCIBPrices.elementAt(i),
          allNewPrices.elementAt(i));
      gameItems.add(gameItem);
      debugPrint(gameItem.title);
    }

    // save all games
    saveGames(gameItems, console);
  }

  // This function creates the games from PriceCharts
  Future saveGames(List<GameItem> games, String console) async {
    try {
      CollectionReference colConsole =
          FirebaseFirestore.instance.collection(console);
      // Create a game for each of the game in the List
      for (GameItem game in games) {
        // Make it to json format for firebase
        var gameJson = game.toJson();

        colConsole.add(gameJson);
      }
    } catch (e) {
      debugPrint("error beim speichern der games");
    }
  }
}
