require 'csv'

CSV.generate do |csv|
  column_names = %w(content updated_at)
  csv << column_names
  @posts.each do |post|
    column_values = [
      post.content,
      post.updated_at
    ]
    csv << column_values
  end
end