import 'package:get_storage/get_storage.dart';


/////////// Local storage
/// Local storage works basically a key value combination pass the json and stored the data in local storage
/// json startes as () value can be anything but key should be unique string
/// unique key is retrieve the data from local storage


///   final _storage = GetStorage('CWT'); => there pass any value it is a bucket type . stored all the data inside the bracket name . we want retrieve the data mention the name to get the data.it was a users creating bucket




class Tlocalstorage{

  /// singleton variable
  late final GetStorage _storage;/// simple get storage variable


  /// private local storage
  static Tlocalstorage? _instance;


  Tlocalstorage._internal();


  factory Tlocalstorage.instance(){
     _instance ??= Tlocalstorage._internal(); /// _instance is null also its equal to a Tloacalstroage instance . handle the null value
     return _instance!;
  }


  /// initialize get storage create a new bucket in init method
static Future<void> init(String bucketName) async{ /// bucket name can be anything must be in string format
    await GetStorage.init(bucketName);

    /// initialize the local storage
    _instance = Tlocalstorage._internal();

    /// instance might be null so use null check operator . use storage variable is  new instance getstorage and pass the bucket name .
    _instance!._storage = GetStorage(bucketName);
}


  //common method of save data
Future<void> writeData<T>(String key , T  value) async {
  await _storage.write(key, value);
}


//common method of read data
  /// pass the key to read the data
T? readData<T>(String key){
  return _storage.read(key);
}

//common method to remove data
  /// pass the key to remove option to remove the data
Future<void> removeData(String key) async {
  await _storage.remove(key);
}

////clear data
Future<void> clearall ()async {
  await _storage.erase();
  }
}













