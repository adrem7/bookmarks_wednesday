require 'bookmark' 

describe 'Bookmark' do 
  let(:bookmark) { Bookmark.new }

  it 'all method shows array of bookmark instances' do 
    expected_array = ["http://www.makersacademy.com", "http://google.com", "http://www.destroyallsoftware.com"]
    expect(Bookmark.all).to eq(expected_array)
  end 
end 