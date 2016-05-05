feature "filtering_by_tag" do
  scenario 'selecting a tag will only show me links with that tag' do
    link1 = Link.create(url: "www.test1", title: "test1")
    link2 = Link.create(url: "www.test2", title: "test2")
    link3 = Link.create(url: "www.test3", title: "test3")
    tag = Tag.first_or_create(name: "bubbles")
    link1.tags << tag
    link1.save
    link3.tags << tag
    link3.save

    visit '/tags/bubbles'
    within "ul#links" do
      expect(page).to have_content "test1"
      expect(page).not_to have_content "test2"
      expect(page).to have_content "test3"
    end
  end
end
