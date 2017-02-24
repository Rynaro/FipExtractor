module FipeApi
  class BrandResponseConverter < ResponseConverter
    
    CONVERSION_TEMPLATE = {
      Label: :brand_name,
      Value: :brand_id
    }

  end
end
