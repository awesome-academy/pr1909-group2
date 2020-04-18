module CustomHelper
  def index_by_type(type)
    Book.where(type_book: type)
  end
end
