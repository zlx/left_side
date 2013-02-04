require 'spec_helper'

feature "sidebar" do
  scenario "should render todo section" do
    visit todos_path
    page.should have_content("todos")
    page.should have_link("index")
    page.should have_content("tasks")
  end

  scenario "should render todo section" do
    visit tasks_path
    page.should have_content("todos")
    page.should have_link("index")
    page.should have_content("tasks")
  end

  scenario "should have right css class" do
    visit todos_path
    page.should have_css("div.left-side > div.well.sidebar-nav > ul.nav.nav-list > li.nav-header")
    page.should have_css("div.left-side > div.well.sidebar-nav > ul.nav.nav-list > li > a[href]")
  end

  scenario "should not render left_side when not define in section.yml" do
    visit new_task_path
    page.should_not have_css("left-side")
  end

end

feature "highlight" do
  scenario "should highlight when current url is match the left_side link" do
    visit todos_path
    page.should have_css("li.active > a[href='/todos']")
  end

  scenario "should highlight work when link have a group of url" do
    visit new_todo_path
    page.should have_css("li.active > a[href='/todos']")
  end

  scenario "should highlight when current link has extract params than link url" do
    visit todos_path(:extract => 'Hi')
    page.should have_css("li.active > a[href='/todos']")
  end

end
