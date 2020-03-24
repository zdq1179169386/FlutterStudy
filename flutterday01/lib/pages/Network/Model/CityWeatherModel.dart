class CityWeatherModel {
  String message;
  int status;
  String date;
  String time;
  CityInfo cityInfo;
  Data data;

  CityWeatherModel(
      {this.message,
      this.status,
      this.date,
      this.time,
      this.cityInfo,
      this.data});

  CityWeatherModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    cityInfo = json['cityInfo'] != null
        ? new CityInfo.fromJson(json['cityInfo'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['date'] = this.date;
    data['time'] = this.time;
    if (this.cityInfo != null) {
      data['cityInfo'] = this.cityInfo.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CityInfo {
  String city;
  String citykey;
  String parent;
  String updateTime;

  CityInfo({this.city, this.citykey, this.parent, this.updateTime});

  CityInfo.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    citykey = json['citykey'];
    parent = json['parent'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['citykey'] = this.citykey;
    data['parent'] = this.parent;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class Data {
  String shidu;
  double pm25;
  double pm10;
  String quality;
  String wendu;
  String ganmao;
  List<Forecast> forecast;
  Forecast yesterday;

  Data(
      {this.shidu,
      this.pm25,
      this.pm10,
      this.quality,
      this.wendu,
      this.ganmao,
      this.forecast,
      this.yesterday});

  Data.fromJson(Map<String, dynamic> json) {
    shidu = json['shidu'];
    pm25 = json['pm25'];
    pm10 = json['pm10'];
    quality = json['quality'];
    wendu = json['wendu'];
    ganmao = json['ganmao'];
    if (json['forecast'] != null) {
      forecast = new List<Forecast>();
      json['forecast'].forEach((v) {
        forecast.add(new Forecast.fromJson(v));
      });
    }
    yesterday = json['yesterday'] != null
        ? new Forecast.fromJson(json['yesterday'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shidu'] = this.shidu;
    data['pm25'] = this.pm25;
    data['pm10'] = this.pm10;
    data['quality'] = this.quality;
    data['wendu'] = this.wendu;
    data['ganmao'] = this.ganmao;
    if (this.forecast != null) {
      data['forecast'] = this.forecast.map((v) => v.toJson()).toList();
    }
    if (this.yesterday != null) {
      data['yesterday'] = this.yesterday.toJson();
    }
    return data;
  }
}

class Forecast {
  String date;
  String high;
  String low;
  String ymd;
  String week;
  String sunrise;
  String sunset;
  int aqi;
  String fx;
  String fl;
  String type;
  String notice;

  Forecast(
      {this.date,
      this.high,
      this.low,
      this.ymd,
      this.week,
      this.sunrise,
      this.sunset,
      this.aqi,
      this.fx,
      this.fl,
      this.type,
      this.notice});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    low = json['low'];
    ymd = json['ymd'];
    week = json['week'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    aqi = json['aqi'];
    fx = json['fx'];
    fl = json['fl'];
    type = json['type'];
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['high'] = this.high;
    data['low'] = this.low;
    data['ymd'] = this.ymd;
    data['week'] = this.week;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['aqi'] = this.aqi;
    data['fx'] = this.fx;
    data['fl'] = this.fl;
    data['type'] = this.type;
    data['notice'] = this.notice;
    return data;
  }
}
