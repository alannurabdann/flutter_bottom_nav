import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  var counter = 0.obs;
  List<String> recentSearch = [];
  final box = GetStorage();
  List storageList = [];

  void increaseCounter(){
    counter += 1;
  }

  void addAndStoreTask(String query) {
    recentSearch.add(query);

    final storageMap = {}; // temporary map that gets added to storage
    final index = recentSearch.length; // for unique map keys
    final nameKey = 'name$index';

    storageMap[nameKey] = query;

    storageList.add(query); // adding temp map to storageList
    box.write('recentSearch', storageList); // adding list of maps to storage
  }

  void restoreTasks() {
    storageList = box.read('recentSearch'); // initializing list from storage
    String nameKey;

    // looping through the storage list to parse out Task objects from maps
    for (int i = 0; i < storageList.length; i++) {
      final map = storageList[i];
      
      // index for retreival keys accounting for index starting at 0
      final index = i + 1;

      nameKey = 'name$index';

      // recreating Task objects from storage
      final String data = map[nameKey];

      recentSearch.add(data); // adding Tasks back to your normal Task list
    }
  }
}
