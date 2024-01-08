class Memes {
  bool success;
  int totalResults;
  List<Meme> memes;

  Memes({required this.success, this.totalResults = 0, required this.memes});

  Memes.fromJson(Map<String, dynamic> memesJson)
  : success = memesJson['success'],
  memes = List.from(memesJson['data']['memes'])
      .map((meme) => Meme.fromJson(meme)).toList(),
  totalResults = memesJson.length;
}
class Meme {
  final String name;
  final String url;

  const Meme({
    required this.name,
    required this.url
  });

  factory Meme.fromJson(Map<String, dynamic> memeJson) {
    return Meme(
        name: memeJson['name'],
        url: memeJson['url']
    );
  }
}