class Phone
  attr_reader(:home, :cell)

  define_method(:initialize) do |attributes|
    @home = attributes.fetch(:home)
    @cell = attributes.fetch(:cell)
  end





end
