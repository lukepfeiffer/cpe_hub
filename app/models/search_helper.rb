class SearchHelper
  def self.search(model, search, search_by)
    model.where("#{search_by} ILIKE ?", "%#{search}%")
  end
end
