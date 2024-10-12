
import 'package:getx_binding_annotation/annotation.dart';

abstract class StorageComponent {
  loadDataFromStorage();
  saveDataOnStorage();
}

@GetPut.component()
class StorageComponentImpl implements StorageComponent {

  @override
  loadDataFromStorage() {}

  @override
  saveDataOnStorage() {}
}