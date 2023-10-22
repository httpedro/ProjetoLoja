import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:libelulas/models/product.dart';
import 'package:libelulas/screens/edit_product/components/image_source_sheet.dart';

class ImagesForm extends StatelessWidget {
  const ImagesForm(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: List.from(product.images as List<String>),
      validator: (images){
        if(images!.isEmpty){
          return 'Insira ao menos uma imagem';
        } else {
          return null;
        }
      },
      builder: (state) {
        void onImageSelected(File file){
          state.value!.add(file);
          state.didChange(state.value);
          Navigator.of(context).pop();
        }
        return Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 1.1,
                  viewportFraction: 1.0,
                ),
                items: state.value!.map<Widget>((image) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      if (image is String)
                        Image.network(image, fit: BoxFit.cover)
                      else
                        Image.file(image as File, fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.red,
                          onPressed: () {
                            state.value!.remove(image);
                            state.didChange(state.value);
                          },
                        ),
                      )
                    ],
                  );
                }).toList()
                  ..add(
                    Material(
                      color: Colors.grey[100],
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        color: Theme.of(context).primaryColor,
                        iconSize: 120,
                        onPressed: () {
                          if(Platform.isAndroid){
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => ImageSourceSheet(onImageSelected: onImageSelected,),
                            );
                          }
                          else {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_) => ImageSourceSheet(onImageSelected: onImageSelected,)
                            );
                          }
                        },
                      ),
                    ),
                  ),
              ),
            ),
            if(state.hasError)
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorText as String,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
