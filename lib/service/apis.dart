class Apis {

  String clientId = "xQPZiR8pze-Hs1VkZRm3Pu93CBM4r4235qkjXqOjbWc";
  // https://api.unsplash.com/photos/?per_page=30&client_id=xQPZiR8pze-Hs1VkZRm3Pu93CBM4r4235qkjXqOjbWc
  String imageApi(param) => "https://api.unsplash.com/photos?$param";
  String areaList()=>"https://my.transcombd.com/smart_api/customer/repArea";


  //=================================== sync ===============================
  String skuSyncApi(String url)=> "${url}/item/index";

  String outletSyncApi(String url)=> "${url}/visit_plan";
}
