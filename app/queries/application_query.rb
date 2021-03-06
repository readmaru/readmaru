class ApplicationQuery
  attr_reader :relation

  def initialize(relation = model_class.all)
    @relation = relation
  end

  private

  def model_class
    self.class.name.chomp("Query").singularize.constantize
  end
end
