require 'bookmark'

describe 'Bookmark' do
  let(:connection)  { PG.connect(dbname: 'bookmark_manager_test') }
  let(:bookmarks)   { Bookmark.all }

  it 'all method returns list of bookmarks' do
    connection.exec("INSERT INTO bookmarks (title) VALUES ('Makers');")
    connection.exec("INSERT INTO bookmarks (title) VALUES('Destroy');")
    connection.exec("INSERT INTO bookmarks (title) VALUES('Google');")
    expect(bookmarks[0].title).to include('Makers')
    expect(bookmarks[1].title).to include('Destroy')
    expect(bookmarks[2].title).to include('Google')
  end

  it 'adds a bookmark to the DB' do
    Bookmark.create('BBC', 'http://www.bbc.com')
    expect(bookmarks[0].title).to include('BBC')
    expect(bookmarks[0].url).to include('http://www.bbc.com')
  end
end
