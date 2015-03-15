require 'rails_helper'

feature 'Categories' do

  before do
    create_user
    sign_in
  end


  scenario 'User can add category to post' do
    create_post(@user)
    visit user_posts_path(@user.id)
    Category.create!(title: "Miscellaneous")
    click_on "This is a post"
    expect(current_path).to eq (user_post_path(@user.id, @post.id))
    expect(page).to have_content("This is a post")
    expect(page).to have_content("this is the most amazing post ever, don't even pretend like it's not")
    select 'Miscellaneous', from: 'post_category_id'
    click_on 'Update'
    expect(page).to have_content("Miscellaneous")
    expect(page).to have_content("Post has been successfully updated")
  end
end
