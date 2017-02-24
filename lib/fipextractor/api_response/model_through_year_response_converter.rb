module FipeApi
  class ModelThroughYearResponseConverter < ResponseConverter

    CONVERSION_TEMPLATE = {
      Label: :model,
      Value: :model_id
    }

  end
end
