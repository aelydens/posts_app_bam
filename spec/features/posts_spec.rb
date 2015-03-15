require 'rails_helper'

feature "Posts" do

  scenario 'User can make new post' do
    sign_in
    click_on "Posts"
    click_on "New Post"
    expect(page).to have_content("New Post")
    fill_in :post_title, with: "Hey"
    fill_in :post_content, with: "Hello everybody, this is a post"
    click_on "Create Post"
    expect(current_path).to eq (user_posts_path(@user))
    expect(page).to have_content("List of User Posts")
    expect(page).to have_content("Hello everybody, this is a post")
    puts " fuck yea Jeff!!!! " * 100
  end

end
