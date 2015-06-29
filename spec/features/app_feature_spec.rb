describe "edits a song", :type => :feature do
  before :each do
    Song.create({
      title: 'Smells Like Teen Spirit',
      artist: 'Metallica',
      album: 'Ride the Lightning',
      genre: 'Metal',
      length: '3:25'
    })
  end

  it "first visits a song show page and clicks edit" do
    visit '/songs/1'
    click_link 'Edit'
    expect(current_path).to eq '/songs/1/edit'
    song = Song.first
    attributes = Song.attribute_names - ['id']
    attributes.each do |attribute|
      expect(page).to have_field("song[#{attribute}]", with: song.send(attribute))

    end
    expect(page).to have_button 'Save Changes'
  end

  it "changes artist and saves changes" do
    visit '/songs/1/edit'
    fill_in('song[artist]', :with => 'Nirvana')
    click_button('Save Changes')
    expect(current_path).to eq '/songs/1'
    expect(page).to have_content 'Nirvana'
  end
end
