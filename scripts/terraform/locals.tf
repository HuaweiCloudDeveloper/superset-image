locals {
  // you need to specify a unique name under a tenant according to the business, which will be used as part of the resource name
  app_id = format("%s-%s", "app", formatdate("hhmm", timestamp()))

  name_suffix = "mkp"

  // Tags of HUAWEI CLOUD resources. You can add tags to resources to classify resources.
  // for more details, please refer to https://support.huaweicloud.com/usermanual-tms/zh-cn_topic_0056266263.html
  tags = { Purpose = "MkpApplication" }



  # Configuration of the ECS memory size and number of cores
  # instance_flavor_cpu    = 4
  # instance_flavor_memory = 16
  #  通用计算增强型
  instance_performance_type = "kunpeng_computing"
  # 系统盘: 通用SSD
  ecs_volume_type = "GPSSD"

  # 规格：通用入门型
  #ecs_flavor = "kc1.xlarge.4"

  // Billing model for cloud resources, You need to modify it according to your actual situation.
  // In the development and testing phase, pay-per-use billing is recommended.
  // You can also set these three parameters as variables, allowing users to select at deployment time.
  charging_mode = var.charging_mode
  period_unit   = var.period_unit
  period        = var.period

  // The billing model for bandwidth, You need to modify it according to your actual situation.
  publicip_type         = "5_bgp"     # 全动态
  bandwidth_share_type  = "PER"       # 独享带宽
  bandwidth_charge_mode = "bandwidth" # 按带宽计费
  bandwidth_size        = 10          # 带宽大小

  # Image information in different regions, you need to enter your own image ID or add another region.
  # For Marketplace Image Id,you can log in to Seller Console, view the marketplace image id on Product Specifications section of My Products detail page.
  # 镜像版本：Superset
  #Superset4.1.2-arm-HCE-v1.0
  instance_image_id_maps_v1 = {
#     北京4
    cn-north-4     = "57dcbb47-4de5-4f7e-8b33-36a4a2aa89d6"
#     广州
    cn-south-1     = "0b0bdc10-d477-4cfb-9d09-11f6713c90fb"
#     上海一
    cn-east-3      = "f9c3470b-0109-47ac-9b87-090c8ba12525"
#     乌兰察布一
    cn-north-9     = "a1782296-b188-4311-a59c-6d526979462f"
#     贵阳一
    cn-southwest-2 = "537d931c-773b-452a-8665-2aa97d2c36fb"

  }
  #Superset4.1.2-arm-ubuntu-v1.0
  instance_image_id_maps_v2 = {
#     北京4
    cn-north-4     = "7d7226b8-4ccf-4862-bcf6-ed06b81bebbc"
#     广州
    cn-south-1     = "2963e4c1-c320-4891-93dd-ee12204cf41b"
#     上海一
    cn-east-3      = "d60cd48b-ab30-4d70-abb2-91774778549d"
#     乌兰察布一
    cn-north-9     = "ca2635df-e681-471d-85fe-d038f46d8153"
#     贵阳一
    cn-southwest-2 = "b4192fb3-d03b-4042-ae18-802c002f2e23"

  }  
  # # 其他版本增加（注意修改var参数和镜像的版本的判断部分）
  #  instance_image_id_maps = {
  #   #     北京4
  #   cn-north-4 = ""
  #  }  

  # Specifies the DNS server address list of a subnet. For details about the private DNS address, see https://support.huaweicloud.com/dns_faq/dns_faq_002.html#?
  subnet_dns_list_maps = {
    cn-north-4     = ["100.125.1.250", "100.125.129.250"]
    cn-south-1     = ["100.125.1.250", "100.125.136.29"]
    cn-east-3      = ["100.125.1.250", "100.125.64.250"]
    cn-north-9     = ["100.125.1.250", "100.125.107.250"]
    cn-southwest-2 = ["100.125.1.250", "100.125.129.250"]
  }


}