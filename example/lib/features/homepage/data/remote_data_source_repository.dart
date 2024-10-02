
import 'package:getx_dependencies_binding_annotation/annotation.dart';

abstract class RemoteDataSourceRepository {
  getData();
  sendData();
}

@GetPut.repository
class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {

  @override
  getData() {}

  @override
  sendData() {}
}