import 'dart:convert';



List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  int? id;
  int? categoryId;
  int? subcategoryId;
  int? childcategoryId;
  String? title;
  String? slug;
  String? description;
  String? image;
  String? classType;
  Null? video;
  String? enroll;
  String? hours;
  Null? meetingLink;
  Null? classStartTime;
  Null? referenceLink;
  Null? materialLink;
  String? regularClass;
  String? reviewClass;
  String? sellingPrice;
  String? discountType;
  String? discount;
  String? discountPrice;
  String? priceActive;
  Null? seoKeyword;
  Null? seoDescription;
  Null? order;
  String? status;
  String? createdBy;
  String? updatedBy;
  Null? deletedBy;
  String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.childcategoryId,
      this.title,
      this.slug,
      this.description,
      this.image,
      this.classType,
      this.video,
      this.enroll,
      this.hours,
      this.meetingLink,
      this.classStartTime,
      this.referenceLink,
      this.materialLink,
      this.regularClass,
      this.reviewClass,
      this.sellingPrice,
      this.discountType,
      this.discount,
      this.discountPrice,
      this.priceActive,
      this.seoKeyword,
      this.seoDescription,
      this.order,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    childcategoryId = json['childcategory_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    classType = json['class_type'];
    video = json['video'];
    enroll = json['enroll'];
    hours = json['hours'];
    meetingLink = json['meeting_link'];
    classStartTime = json['class_start_time'];
    referenceLink = json['reference_link'];
    materialLink = json['material_link'];
    regularClass = json['regular_class'];
    reviewClass = json['review_class'];
    sellingPrice = json['selling_price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    priceActive = json['price_active'];
    seoKeyword = json['seo_keyword'];
    seoDescription = json['seo_description'];
    order = json['order'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['childcategory_id'] = this.childcategoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['class_type'] = this.classType;
    data['video'] = this.video;
    data['enroll'] = this.enroll;
    data['hours'] = this.hours;
    data['meeting_link'] = this.meetingLink;
    data['class_start_time'] = this.classStartTime;
    data['reference_link'] = this.referenceLink;
    data['material_link'] = this.materialLink;
    data['regular_class'] = this.regularClass;
    data['review_class'] = this.reviewClass;
    data['selling_price'] = this.sellingPrice;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discount_price'] = this.discountPrice;
    data['price_active'] = this.priceActive;
    data['seo_keyword'] = this.seoKeyword;
    data['seo_description'] = this.seoDescription;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['deleted_by'] = this.deletedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}