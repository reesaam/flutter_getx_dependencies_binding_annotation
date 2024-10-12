
import 'package:getx_binding_annotation/annotation.dart';

abstract class RemoteDataSourceRepository {
  getData();
  sendData();
}

@GetPut.repository(as: 'RemoteDataSourceRepository')
class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {

  @override
  getData() {}

  @override
  sendData() {}
}