//? Si por alguna razon llegara a cambiar el API solo tendremos que realizar los cambios en este modelo
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    // no lo necesitamos en esta clase pero queda como referencia
    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // >< Mapper
    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image
    );
}



// //? - para hacer esto mas rapido, del json que tengamos del API vamos a ir a https://app.quicktype.io/ y vamos a cambiar el nombre por el de la clase
// //? - pegamos la respuesta del API 
// //? - marcaremos `null safety` y `Make all properties final` y copiamos codigo
// // cuando recibamos una respuesta vamos a crear la instancia de Yesnomodel
// //~ creamos este modelo para recibir todas las propiedades del api
// class YesNoModel {
//   String answer;
//   bool forced;
//   String image;

//   // creamos instancia
//   YesNoModel({ required this.answer, required this.forced, required this.image });

//   //? factory:   cuando llame este constructor con nombre va  a crear una nueva instancia que necesitamos
//   factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>
//     YesNoModel(
//       answer: json['answer'],
//       forced: json['forced'],
//       image: json['image']
//     );
// }
