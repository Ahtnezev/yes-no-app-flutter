import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // tener control del input que vamos a asociar
    final textController = TextEditingController();
    final focusNode = FocusNode();
    // final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      // hacemos uso de esas dos propiedades ya que si colocamos una, cuando abramos el input se va a regresar a un tamaño por defecto 
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          // print('BUTTON: $textValue');
          textController.clear();
          onValue(textValue);
        },
      )
    );

    return TextFormField(
      // keyboardType: TextInputType.number,
      // ocultamos keyboard si hacemos click fuera de
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // print('SUBMIT VALUE: $value');
        textController.clear();
        // mantemeos el input arriba 
        focusNode.requestFocus();
        onValue(value);
      },
      // onChanged: (value) {
      //   print('CHANGED: $value');
      // },
    );
  }
}