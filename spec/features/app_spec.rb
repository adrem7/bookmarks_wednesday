

feature 'Bookmark' do
  scenario 'Displays bookmarks title' do
    visit('/bookmarks')
    expect(page).to have_title 'Bookmarks'
  end

  scenario 'Displays bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end

end
