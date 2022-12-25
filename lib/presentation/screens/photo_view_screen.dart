import 'dart:ui';
import 'dart:io';
import 'package:exif/exif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_hooks/presentation/widgets/metadata_info.dart';
import 'package:share_plus/share_plus.dart';

class PhotoViewScreen extends StatefulWidget {
  final File image;
  const PhotoViewScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  final _width = 400;
  final _height = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo View',
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            widget.image,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.file(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25.0),
                  child: Text(
                    '12 July 2022',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.ios_share_outlined),
                        color: Colors.white,
                        onPressed: () async {
                          await Share.shareXFiles([XFile(widget.image.path)]);
                        },
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.volunteer_activism_outlined),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.info_outline),
                        color: Colors.white,
                        onPressed: () {
                          //final metadata = MetadataInfo();
                          //metadata.updateMetadataFromPhoto(widget.image);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                              title: const Text('Image Info'),
                              content: MetadataInfo(
                                image: widget.image,
                              ),
                              contentPadding: const EdgeInsets.all(20.0),
                            ),
                          );
                        },
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.white,
                        onPressed: () async {
                          try {
                            await widget.image.delete();
                            Navigator.of(context).pop(true);
                          } catch (exception) {
                            Navigator.of(context).pop(false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*Future<Map<String, IfdTag>> updateMetadataFromPhoto(File photo) async {
    Map<String, IfdTag> data = await readExifFromFile(photo, details: false);

    if (data == null || data.isEmpty) {
      print('-- No exif information found');
    }
    for (String key in data.keys) {
      print('-- $key -- (${data[key]?.tagType}): ${data[key]} --');
    }

    print('<--- Image Model  :  ${data['Image Model']} --->');
    print('Image Width  :  ${data['Image ImageWidth']}');
    print('Image Length  :  ${data['Image ImageLength']}');
    print('Image DateTime  :  ${data['Image DateTime']}');
    print('Image Orientation  :  ${data['Image Orientation']}');
    print('Image Make  :  ${data['Image Make']}');
    print('<--- Image DateTime  :  ${data['Image DateTime']} --->');

    return data;
  }*/
}
