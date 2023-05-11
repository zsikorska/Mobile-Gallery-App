import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_gallery_app/photo_view_page.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  final List<String> photos = [
    'assets/images/a.jpg',
    'assets/images/b.jpg',
    'assets/images/c.jpg',
    'assets/images/d.jpg',
    'https://i.pinimg.com/736x/63/92/75/6392750513cc15bf5fb8cba4ed78fbb9.jpg',
    'https://pbs.twimg.com/media/D-I-4UpXoAEMoXm.jpg',
    'https://s.yimg.com/ny/api/res/1.2/FRW8JzlzhjtJIVsIKc5xdw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEwMDA7aD03NTA-/https://media.zenfs.com/en_US/News/BGR_News/funny-cat.jpg',
    'https://s3.amazonaws.com/photography.prod.demandstudios.com/c639593c-3f0b-48a5-a623-13f772f411ba.png',
    'https://th-thumbnailer.cdn-si-edu.com/bZAar59Bdm95b057iESytYmmAjI=/1400x1050/filters:focal(594x274:595x275)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/95/db/95db799b-fddf-4fde-91f3-77024442b92d/egypt_kitty_social.jpg',
    'https://i.pinimg.com/originals/4b/32/51/4b32515811f098335969df205547b4bc.jpg',
    'https://miro.medium.com/v2/resize:fit:605/1*flrlrahcfKKtLR9MTgeW8w.png',
    'https://sadanduseless.b-cdn.net/wp-content/uploads/2023/04/liquid-cats1.jpg',
    'https://cattime.com/assets/uploads/gallery/cats-are-liquid/cats-are-liquid-2.jpg',
    'https://i.redd.it/hs5o1c49if531.jpg',
    'https://static.boredpanda.com/blog/wp-content/uuuploads/funny-liquid-cats/funny-liquid-cats-9.jpg',
    'https://i.pinimg.com/736x/71/fe/83/71fe83b3f2423bb24a925ff72565fd0e.jpg',
    'https://hips.hearstapps.com/hmg-prod/images/cute-photos-of-cats-lion-1593184780.jpg',
    'https://www.wheninmanila.com/wp-content/uploads/2016/03/Gimo-cute-cat.jpg?mrf-size=m',
    'https://static.inspiremore.com/wp-content/uploads/2022/03/17123220/cute-cats-15.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gallery")),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.all(1),
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: ((context, index) {
          Widget imageWidget;
          if (photos[index].startsWith('http')) {
            imageWidget = CachedNetworkImage(
              imageUrl: photos[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey),
              errorWidget: (context, url, error) => Container(
                color: Colors.red.shade400,
              ),
            );
          } else {
            imageWidget = Image.asset(
              photos[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.red.shade400,
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.all(0.5),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PhotoViewPage(photos: photos, index: index),
                ),
              ),
              child: Hero(
                tag: photos[index],
                child: imageWidget,
              ),
            ),
          );
        }),
      ),
    );
  }
}
