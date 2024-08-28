import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';
// aqui instalamos el paquete dio -> pub.dev
// podemos hacerlo desde vscode:
// ctrl + p > pubspec assist add/update ... > <nombre paquete> ej: dio y lo podemos ver instalado en pubspec.yaml
class GetYesNoAnswer {
  // BaseOptions(...)  podemos mandar headers...
  final _dio = Dio();

  Future<Message> getAnswer() async {
    // #2 dejamos el cursor encima de response para ver la data previa
    final response = await _dio.get('https://yesno.wtf/api');
    // forma volatil
    // response.data['answer'];

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    // #3 ya no lo necesitamos ya que colocamos el Mapper -> YesNoModel > toMessageEntity()
    // return Message(
    //   text: yesNoModel.answer,
    //   fromWho: FromWho.hers,
    //   imageUrl: yesNoModel.image
    // );
    
    // #2 volatil
    // return Message(
    //   text: response.data['answer'],
    //   fromWho: FromWho.hers,
    //   imageUrl: response.data['image']
    // );

    // #1 una vez enviamos el mensaje con ? al final nos detemos aqui por el debug
    // throw UnimplementedError();
  }
}
