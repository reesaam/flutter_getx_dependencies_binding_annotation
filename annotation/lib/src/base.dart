/// Annotation Class
library;

class GetPut {
  final bool? isPage;
  final bool? isController;
  final bool? isComponent;
  final bool? isRepository;
  const GetPut._({this.isPage, this.isController, this.isComponent, this.isRepository});

  static const GetPut page = GetPut._(isPage: true);
  static const GetPut controller = GetPut._(isController: true);
  static const GetPut component = GetPut._(isComponent: true);
  static const GetPut repository = GetPut._(isRepository: true);
}
