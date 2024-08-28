import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    // obtenemos el color del tema  
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white)
            ),
          ),
        ),
        const SizedBox(height: 5),

      // Todo: imagen
      _ImageBubble(message.imageUrl!),

      const SizedBox(height: 10),
      ],
    );
  }
}


// colocamos _ porque solo se usara en este widget
class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // la url la traemos desde postman pa fast
    // return Image.network('https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif');

    // obtenemos el tamaño de la pantalla del dispositivo
    // context -> hace referencia al arbol de widgets (dimensiones, caracteristicas que lo este corriendo)
    final size = MediaQuery.of(context).size;
    // print(size);

    // colocamos el breakpoint despues para ver que valor obtuvo al correr debug
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        // 'https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif',
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor está enviando una imagen...'),
          );
        },
      )
    );
  }
}