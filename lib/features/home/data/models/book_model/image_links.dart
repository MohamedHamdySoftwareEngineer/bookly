import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String smallThumbnail;
  final String thumbnail;

  const ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromBookJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] as String,
        thumbnail: json['thumbnail'] as String,
      );

  Map<String, dynamic> toBookJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
