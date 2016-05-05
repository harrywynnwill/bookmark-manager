feature 'adding tags' do
  scenario 'add a tag to a link' do
    visit '/links/new'
    fill_in :url, with: "test.test.com"
    fill_in :title, with: "test"
    fill_in :tag, with: "test_tag"
    click_button "Create link"
    within 'ul#links' do
      expect(page).to have_content "test_tag"
    end
  end
end
