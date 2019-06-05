require 'pg'

# bookmark class
class Bookmark
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url_added)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url_added}');")
  end
end
