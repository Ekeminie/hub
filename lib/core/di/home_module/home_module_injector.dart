// import 'package:dio/dio.dart';
// import 'package:kiwi/kiwi.dart';
//
// part 'home_module_injector.g.dart';
//
// abstract class HomeModuleInjector {
//
//   static Container container;
//
//   void setup() {
//     container = Container();
//     _$HomeModuleInjector().configure();
//   }
//
//   static final resolve = container.resolve;
//
//   void configure(){
//     _configureHomeModule();
//   }
//
//   @Register.factory(HomeRemoteDatasource, from: HomeRemoteDatasourceImpl)
//   @Register.factory(HomeRepository, from: HomeRepositorylmpl)
//   @Register.singleton(ListRequestUserCase)
//   void _configureHomeModule();
//
// }
//
// HomeModuleInjector homeModuleInjector() => _$HomeModuleInjector();
