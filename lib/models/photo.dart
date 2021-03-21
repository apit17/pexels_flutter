class Photo {
  final int id;
  final String photographer;
  final String photographerUrl;
  final PhotoSrc src;

  Photo(this.id, this.photographer, this.photographerUrl, this.src);

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      json["id"],
      json["photographer"],
      json["photographer_url"],
      PhotoSrc.fromJson(
        json["src"],
      ),
    );
  }
}

class PhotoSrc {
  final String thumbImage;
  final String largeImage;

  PhotoSrc(this.thumbImage, this.largeImage);

  factory PhotoSrc.fromJson(Map<String, dynamic> json) {
    return PhotoSrc(json["tiny"], json["large"]);
  }
}
