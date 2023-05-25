import 'dart:io';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ImagePage extends StatefulWidget {
  String Imagelink;
  ImagePage(this.Imagelink);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  Future<void> _saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Download image
      final http.Response response =
          await http.get(Uri.parse(widget.Imagelink));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DismissiblePage(
        onDismissed: () {
          Navigator.of(context).pop();
        },
        direction: DismissiblePageDismissDirection.multi,
        child: Hero(
            tag: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${widget.Imagelink}'))),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () async {
                          // downloadImage(widget.Imagelink);
                          _saveImage(context);
                        },
                        child: Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
