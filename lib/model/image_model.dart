// To parse this JSON data, do
//
//     final unsplashModel = unsplashModelFromJson(jsonString);

import 'dart:convert';

List<UnsplashModel> unsplashModelFromJson(String str) =>
    List<UnsplashModel>.from(
        json.decode(str).map((x) => UnsplashModel.fromJson(x)));

String unsplashModelToJson(List<UnsplashModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnsplashModel {
  final String id;
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final UnsplashModelLinks? links;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final Sponsorship? sponsorship;
  final TopicSubmissions? topicSubmissions;
  final User? user;

  UnsplashModel({
    required this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  factory UnsplashModel.fromJson(Map<String, dynamic> json) => UnsplashModel(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null
            ? null
            : UnsplashModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null
            ? []
            : List<dynamic>.from(
                json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"] == null
            ? null
            : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions: json["topic_submissions"] == null
            ? null
            : TopicSubmissions.fromJson(json["topic_submissions"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null
            ? []
            : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "topic_submissions": topicSubmissions?.toJson(),
        "user": user?.toJson(),
      };
}

class UnsplashModelLinks {
  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  UnsplashModelLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory UnsplashModelLinks.fromJson(Map<String, dynamic> json) =>
      UnsplashModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Sponsorship {
  final List<String>? impressionUrls;
  final String? tagline;
  final String? taglineUrl;
  final User? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: json["impression_urls"] == null
            ? []
            : List<String>.from(json["impression_urls"]!.map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor:
            json["sponsor"] == null ? null : User.fromJson(json["sponsor"]),
      );

  Map<String, dynamic> toJson() => {
        "impression_urls": impressionUrls == null
            ? []
            : List<dynamic>.from(impressionUrls!.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor?.toJson(),
      };
}

class User {
  final String id;
  final DateTime? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final UserLinks? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final Social? social;

  User({
    required this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
        profileImage: json["profile_image"] == null
            ? null
            : ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
      };
}

class UserLinks {
  final String? self;
  final String? html;
  final String? photos;
  final String? likes;
  final String? portfolio;
  final String? following;
  final String? followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  final String? small;
  final String? medium;
  final String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  final String? instagramUsername;
  final String? portfolioUrl;
  final String? twitterUsername;
  final dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class TopicSubmissions {
  final ArchitectureInterior? wallpapers;
  final Experimental? nature;
  final Experimental? experimental;
  final Experimental? spirituality;
  final ArchitectureInterior? architectureInterior;
  final ArchitectureInterior? artsCulture;
  final ArchitectureInterior? travel;
  final ArchitectureInterior? people;
  final ArchitectureInterior? fashionBeauty;

  TopicSubmissions({
    this.wallpapers,
    this.nature,
    this.experimental,
    this.spirituality,
    this.architectureInterior,
    this.artsCulture,
    this.travel,
    this.people,
    this.fashionBeauty,
  });

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) =>
      TopicSubmissions(
        wallpapers: json["wallpapers"] == null
            ? null
            : ArchitectureInterior.fromJson(json["wallpapers"]),
        nature: json["nature"] == null
            ? null
            : Experimental.fromJson(json["nature"]),
        experimental: json["experimental"] == null
            ? null
            : Experimental.fromJson(json["experimental"]),
        spirituality: json["spirituality"] == null
            ? null
            : Experimental.fromJson(json["spirituality"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : ArchitectureInterior.fromJson(json["architecture-interior"]),
        artsCulture: json["arts-culture"] == null
            ? null
            : ArchitectureInterior.fromJson(json["arts-culture"]),
        travel: json["travel"] == null
            ? null
            : ArchitectureInterior.fromJson(json["travel"]),
        people: json["people"] == null
            ? null
            : ArchitectureInterior.fromJson(json["people"]),
        fashionBeauty: json["fashion-beauty"] == null
            ? null
            : ArchitectureInterior.fromJson(json["fashion-beauty"]),
      );

  Map<String, dynamic> toJson() => {
        "wallpapers": wallpapers?.toJson(),
        "nature": nature?.toJson(),
        "experimental": experimental?.toJson(),
        "spirituality": spirituality?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
        "arts-culture": artsCulture?.toJson(),
        "travel": travel?.toJson(),
        "people": people?.toJson(),
        "fashion-beauty": fashionBeauty?.toJson(),
      };
}

class ArchitectureInterior {
  final Status? status;

  ArchitectureInterior({
    this.status,
  });

  factory ArchitectureInterior.fromJson(Map<String, dynamic> json) =>
      ArchitectureInterior(
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
      };
}

enum Status { UNEVALUATED, REJECTED }

final statusValues = EnumValues(
    {"rejected": Status.REJECTED, "unevaluated": Status.UNEVALUATED});

class Experimental {
  final String? status;
  final DateTime? approvedOn;

  Experimental({
    this.status,
    this.approvedOn,
  });

  factory Experimental.fromJson(Map<String, dynamic> json) => Experimental(
        status: json["status"],
        approvedOn: json["approved_on"] == null
            ? null
            : DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn?.toIso8601String(),
      };
}

class Urls {
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
