require "rails_helper"

describe Scrapper::Categories do
  subject { described_class.call }
  
  before do
    create(:category, name: "Arrasta-pé", link: "https://old_link.com")

    allow(Scrapper::Login).to receive(:call).and_return(mechanize_agent)
    allow(mechanize_agent).to receive(:get).and_return(page)
  end

  let(:mechanize_agent) { Mechanize.new }
  let(:page) { Nokogiri::HTML(File.open("spec/fixtures/categories.html")) }

  it "adds new categories" do
    expect{ subject }.to change(Category, :count).by(23)
  end

  it "updates existing category link" do
    subject
    expect(Category.find_by(name: "Arrasta-pé").link).to eq "https://fisarmonica.online/fisa-trilha/arrasta-pe/"
  end
end