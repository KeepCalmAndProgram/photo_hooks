import 'dart:io';
import 'package:exif/exif.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MetadataInfo extends StatefulWidget {
  final File image;

  const MetadataInfo({Key? key, required this.image}) : super(key: key);

  @override
  State<MetadataInfo> createState() => _MetadataInfoState();
}

class _MetadataInfoState extends State<MetadataInfo> {
  IfdTag? image_model;
  IfdTag? image_width;
  IfdTag? image_length;
  IfdTag? image_orientation;
  IfdTag? image_make;
  IfdTag? image_datetime;

  void updateMetadataFromPhoto(File photo) async {
    Map<String, IfdTag> data = await readExifFromFile(photo, details: false);

    if (data == null && data.isEmpty) {
      print('-- No exif information found');
    }
    for (String key in data.keys) {
      print('-- $key -- (${data[key]?.tagType}): ${data[key]} --');
    }

    setState(() {
      image_model = data['Image Model'];
      image_width = data['Image ImageWidth'];
      image_length = data['Image ImageLength'];
      image_orientation = data['Image Orientation'];
      image_make = data['Image Make'];
      image_datetime = data['Image DateTime'];
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateMetadataFromPhoto(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Property',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Value',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image Model',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_model',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image Width',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_width',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image Length',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_length',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image Orientation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_orientation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image Make',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_make',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Image DateTime',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            DataCell(
              Text(
                '$image_datetime',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/*class MetadataInfo {
  late final image_model;
  late final image_width;
  late final image_length;
  late final image_orientation;
  late final image_make;
  late final image_datetime;

  MetadataInfo({
    this.image_model,
    this.image_width,
    this.image_length,
    this.image_orientation,
    this.image_make,
    this.image_datetime,
  });

  Future<Map<String, IfdTag>> updateMetadataFromPhoto(File photo) async {
    Map<String, IfdTag> data = await readExifFromFile(photo, details: false);

    if (data == null || data.isEmpty) {
      print('-- No exif information found');
    }
    for (String key in data.keys) {
      print('-- $key -- (${data[key]?.tagType}): ${data[key]} --');
    }

    image_model = data['Image Model'];
    image_width = data['Image ImageWidth'];
    image_length = data['Image ImageLength'];
    image_orientation = data['Image Orientation'];
    image_make = data['Image Make'];
    image_datetime = data['Image DateTime'];

    return data;
  }
}*/
