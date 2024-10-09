import 'package:getx_binding_annotation/getx_binding_annotation.dart';

abstract class StorageComponent {
  loadDataFromStorage();
  saveDataOnStorage();
}

@GetPut.component(as: 'StorageComponent')
class StorageComponentImpl implements StorageComponent {

  @override
  loadDataFromStorage() {}

  @override
  saveDataOnStorage() {}
}