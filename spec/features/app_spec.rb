require 'pg'

feature 'Bookmark' do
  scenario 'Displays bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end

feature 'Adding Bookmarks' do
  scenario 'User to add bookmark via form' do
    PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'http://www.odeon.com'
    click_on :Submit
    expect(page).to have_content 'http://www.odeon.com'
  end
end
