// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'home_module_injector.dart';
//
// // **************************************************************************
// // InjectorGenerator
// // **************************************************************************
//
// class _$HomeModuleInjector extends HomeModuleInjector {
//   void _configureHomeModule() {
//     final Container container = Container();
//     container.registerFactory<HomeRemoteDatasource, HomeRemoteDatasourceImpl>(
//         (c) => HomeRemoteDatasourceImpl(c<Dio>()));
//     container.registerFactory<HomeRepository, HomeRepositorylmpl>((c) =>
//         HomeRepositorylmpl(c<HomeRemoteDatasource>(), c<SharedPreference>()));
//     container
//         .registerSingleton((c) => ListRequestUserCase(c<HomeRepository>()));
//   }
// }
