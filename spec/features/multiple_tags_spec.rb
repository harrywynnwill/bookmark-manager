feature 'multi-tag' do
  scenario 'can add multiple tags when creating links' do
    visit ('/links/new')
    fill_in :url, with: 'www.awesome.com'
    fill_in :title,  with: 'awesome'
    fill_in :tag, with: 'in awe some'
    click_button 'Create link'
    link = Link.first(title: 'awesome')
    expect(link.tags.map(&:name)).to eq ["in", "awe", "some"]
  end
end