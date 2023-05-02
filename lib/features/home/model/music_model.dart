class FindMusicModel {
  int? resultCount;
  List<Result>? results;

  FindMusicModel({
    this.resultCount,
    this.results,
  });

  factory FindMusicModel.fromJson(Map<String, dynamic> json) => FindMusicModel(
        resultCount: json["resultCount"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  WrapperType? wrapperType;
  Kind? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  DateTime? releaseDate;
  Explicitness? collectionExplicitness;
  Explicitness? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  Country? country;
  Currency? currency;
  String? primaryGenreName;

  Result({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: wrapperTypeValues.map[json["wrapperType"]]!,
        kind: kindValues.map[json["kind"]]!,
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        trackPrice: json["trackPrice"]?.toDouble(),
        releaseDate: json["releaseDate"] == null
            ? null
            : DateTime.parse(json["releaseDate"]),
        collectionExplicitness:
            explicitnessValues.map[json["collectionExplicitness"]]!,
        trackExplicitness: explicitnessValues.map[json["trackExplicitness"]]!,
        discCount: json["discCount"],
        discNumber: json["discNumber"],
        trackCount: json["trackCount"],
        trackNumber: json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"],
        country: countryValues.map[json["country"]]!,
        currency: currencyValues.map[json["currency"]]!,
        primaryGenreName: json["primaryGenreName"],
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperTypeValues.reverse[wrapperType],
        "kind": kindValues.reverse[kind],
        "artistId": artistId,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "releaseDate": releaseDate?.toIso8601String(),
        "collectionExplicitness":
            explicitnessValues.reverse[collectionExplicitness],
        "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
        "discCount": discCount,
        "discNumber": discNumber,
        "trackCount": trackCount,
        "trackNumber": trackNumber,
        "trackTimeMillis": trackTimeMillis,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "primaryGenreName": primaryGenreName,
      };
}

enum Explicitness { NOT_EXPLICIT }

final explicitnessValues =
    EnumValues({"notExplicit": Explicitness.NOT_EXPLICIT});

enum Country { USA }

final countryValues = EnumValues({"USA": Country.USA});

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

enum Kind { MUSIC_VIDEO }

final kindValues = EnumValues({"music-video": Kind.MUSIC_VIDEO});

enum WrapperType { TRACK }

final wrapperTypeValues = EnumValues({"track": WrapperType.TRACK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
