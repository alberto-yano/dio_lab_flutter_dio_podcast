class FeedModel {
  String? sXmlnsYt;
  String? sXmlnsMedia;
  String? sXmlns;
  List<LinkModel>? link;
  String? id;
  String? ytChannelId;
  String? title;
  AuthorModel? author;
  String? published;
  List<EntryModel>? entry;
  bool isReady = false;
  bool isPlaying = false;

  FeedModel(
      {this.sXmlnsYt,
      this.sXmlnsMedia,
      this.sXmlns,
      this.link,
      this.id,
      this.ytChannelId,
      this.title,
      this.author,
      this.published,
      this.entry});

  FeedModel.fromJson(Map<String, dynamic> json) {
    sXmlnsYt = json['_xmlns:yt'];
    sXmlnsMedia = json['_xmlns:media'];
    sXmlns = json['_xmlns'];
    if (json['link'] != null) {
      link = <LinkModel>[];
      try {
        json['link'].forEach((v) {
          link!.add(LinkModel.fromJson(v));
        });
      } catch (e) {
        link!.add(LinkModel.fromJson(json['link']));
      }
    }
    id = json['id'];
    ytChannelId = json['yt:channelId'];
    title = json['title'];
    author =
        json['author'] != null ? AuthorModel.fromJson(json['author']) : null;
    published = json['published'];
    if (json['entry'] != null) {
      entry = <EntryModel>[];
      json['entry'].forEach((v) {
        entry!.add(EntryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_xmlns:yt'] = sXmlnsYt;
    data['_xmlns:media'] = sXmlnsMedia;
    data['_xmlns'] = sXmlns;
    if (link != null) {
      data['link'] = link!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['yt:channelId'] = ytChannelId;
    data['title'] = title;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['published'] = published;
    if (entry != null) {
      data['entry'] = entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinkModel {
  String? sRel;
  String? sHref;
  String? value;

  LinkModel({this.sRel, this.sHref, this.value});

  LinkModel.fromJson(Map<String, dynamic> json) {
    sRel = json['_rel'];
    sHref = json['_href'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_rel'] = sRel;
    data['_href'] = sHref;
    data['value'] = value;
    return data;
  }
}

class AuthorModel {
  String? name;
  String? uri;

  AuthorModel({this.name, this.uri});

  AuthorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uri'] = uri;
    return data;
  }
}

class EntryModel {
  String? id;
  String? ytVideoId;
  String? ytChannelId;
  String? title;
  LinkModel? link;
  AuthorModel? author;
  String? published;
  String? updated;
  MediaGroupModel? mediaGroup;
  bool isPlaying = false;

  EntryModel(
      {this.id,
      this.ytVideoId,
      this.ytChannelId,
      this.title,
      this.link,
      this.author,
      this.published,
      this.updated,
      this.mediaGroup});

  EntryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ytVideoId = json['yt:videoId'];
    ytChannelId = json['yt:channelId'];
    title = json['title'];
    link = json['link'] != null ? LinkModel.fromJson(json['link']) : null;
    author =
        json['author'] != null ? AuthorModel.fromJson(json['author']) : null;
    published = json['published'];
    updated = json['updated'];
    mediaGroup = json['media:group'] != null
        ? MediaGroupModel.fromJson(json['media:group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['yt:videoId'] = ytVideoId;
    data['yt:channelId'] = ytChannelId;
    data['title'] = title;
    if (link != null) {
      data['link'] = link!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['published'] = published;
    data['updated'] = updated;
    if (mediaGroup != null) {
      data['media:group'] = mediaGroup!.toJson();
    }
    return data;
  }
}

class MediaGroupModel {
  String? mediaTitle;
  MediaContentModel? mediaContent;
  MediaThumbnailModel? mediaThumbnail;
  String? mediaDescription;
  MediaCommunityModel? mediaCommunity;

  MediaGroupModel(
      {this.mediaTitle,
      this.mediaContent,
      this.mediaThumbnail,
      this.mediaDescription,
      this.mediaCommunity});

  MediaGroupModel.fromJson(Map<String, dynamic> json) {
    mediaTitle = json['media:title'];
    mediaContent = json['media:content'] != null
        ? MediaContentModel.fromJson(json['media:content'])
        : null;
    mediaThumbnail = json['media:thumbnail'] != null
        ? MediaThumbnailModel.fromJson(json['media:thumbnail'])
        : null;
    mediaDescription = json['media:description'];
    mediaCommunity = json['media:community'] != null
        ? MediaCommunityModel.fromJson(json['media:community'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media:title'] = mediaTitle;
    if (mediaContent != null) {
      data['media:content'] = mediaContent!.toJson();
    }
    if (mediaThumbnail != null) {
      data['media:thumbnail'] = mediaThumbnail!.toJson();
    }
    data['media:description'] = mediaDescription;
    if (mediaCommunity != null) {
      data['media:community'] = mediaCommunity!.toJson();
    }
    return data;
  }
}

class MediaContentModel {
  String? sUrl;
  String? sType;
  String? sWidth;
  String? sHeight;
  String? value;

  MediaContentModel(
      {this.sUrl, this.sType, this.sWidth, this.sHeight, this.value});

  MediaContentModel.fromJson(Map<String, dynamic> json) {
    sUrl = json['_url'];
    sType = json['_type'];
    sWidth = json['_width'];
    sHeight = json['_height'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_url'] = sUrl;
    data['_type'] = sType;
    data['_width'] = sWidth;
    data['_height'] = sHeight;
    data['value'] = value;
    return data;
  }
}

class MediaThumbnailModel {
  String? sUrl;
  String? sWidth;
  String? sHeight;
  String? value;

  MediaThumbnailModel({this.sUrl, this.sWidth, this.sHeight, this.value});

  MediaThumbnailModel.fromJson(Map<String, dynamic> json) {
    sUrl = json['_url'];
    sWidth = json['_width'];
    sHeight = json['_height'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_url'] = sUrl;
    data['_width'] = sWidth;
    data['_height'] = sHeight;
    data['value'] = value;
    return data;
  }
}

class MediaCommunityModel {
  MediaStarRatingModel? mediaStarRating;
  MediaStatisticsModel? mediaStatistics;

  MediaCommunityModel({this.mediaStarRating, this.mediaStatistics});

  MediaCommunityModel.fromJson(Map<String, dynamic> json) {
    mediaStarRating = json['media:starRating'] != null
        ? MediaStarRatingModel.fromJson(json['media:starRating'])
        : null;
    mediaStatistics = json['media:statistics'] != null
        ? MediaStatisticsModel.fromJson(json['media:statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mediaStarRating != null) {
      data['media:starRating'] = mediaStarRating!.toJson();
    }
    if (mediaStatistics != null) {
      data['media:statistics'] = mediaStatistics!.toJson();
    }
    return data;
  }
}

class MediaStarRatingModel {
  String? sCount;
  String? sAverage;
  String? sMin;
  String? sMax;
  String? value;

  MediaStarRatingModel(
      {this.sCount, this.sAverage, this.sMin, this.sMax, this.value});

  MediaStarRatingModel.fromJson(Map<String, dynamic> json) {
    sCount = json['_count'];
    sAverage = json['_average'];
    sMin = json['_min'];
    sMax = json['_max'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_count'] = sCount;
    data['_average'] = sAverage;
    data['_min'] = sMin;
    data['_max'] = sMax;
    data['value'] = value;
    return data;
  }
}

class MediaStatisticsModel {
  String? sViews;
  String? value;

  MediaStatisticsModel({this.sViews, this.value});

  MediaStatisticsModel.fromJson(Map<String, dynamic> json) {
    sViews = json['_views'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_views'] = sViews;
    data['value'] = value;
    return data;
  }
}
