require "rails_helper"

describe Scrapper::Parser::Categories do
  subject { described_class.call(html) }
  
  let(:html) { File.read(Rails.root.join('spec', 'fixtures', 'categories.html'))}
  let(:expected) do
    [
      { category: "Arrasta-pé", link: "https://fisarmonica.online/fisa-trilha/arrasta-pe/" },
      { category: "Baião", link: "https://fisarmonica.online/fisa-trilha/baiao/" },
      { category: "Bugio", link: "https://fisarmonica.online/fisa-trilha/bugio/" },
      { category: "Chamamé", link: "https://fisarmonica.online/fisa-trilha/chamame/" },
      { category: "Choro", link: "https://fisarmonica.online/fisa-trilha/choro/" },
      { category: "Forró", link: "https://fisarmonica.online/fisa-trilha/forro/" },
      { category: "Hinos Nacionais e Internacionais", link: "https://fisarmonica.online/fisa-trilha/hinos-nacionais-e-internacionais/" },
      { category: "Jazz", link: "https://fisarmonica.online/fisa-trilha/jazz/" },
      { category: "Música Cristã", link: "https://fisarmonica.online/fisa-trilha/musica-crista-2/" },
      { category: "Música Erudita", link: "https://fisarmonica.online/fisa-trilha/musica-classica/" },
      { category: "Música Infantis", link: "https://fisarmonica.online/fisa-trilha/musica-infantis/" },
      { category: "Música Internacional", link: "https://fisarmonica.online/fisa-trilha/musica-internacional/" },
      { category: "Músicas para Casamento", link: "https://fisarmonica.online/fisa-trilha/musicas-para-casamento/" },
      { category: "Pisadinha", link: "https://fisarmonica.online/fisa-trilha/pisadinha/" },
      { category: "Rock", link: "https://fisarmonica.online/fisa-trilha/rock-4/" },
      { category: "Samba/Pagode", link: "https://fisarmonica.online/fisa-trilha/samba-pagode/" },
      { category: "Sertanejo Raiz", link: "https://fisarmonica.online/fisa-trilha/sertanejo-raiz/" },
      { category: "Sertanejo Universitário", link: "https://fisarmonica.online/fisa-trilha/sertanejo-universitario/" },
      { category: "Tango", link: "https://fisarmonica.online/fisa-trilha/tango/" },
      { category: "Trilhas, Sons e Vinhetas", link: "https://fisarmonica.online/fisa-trilha/trilhas-sons-e-vinhetas/" },
      { category: "Valsa", link: "https://fisarmonica.online/fisa-trilha/valsa/" },
      { category: "Vaneira", link: "https://fisarmonica.online/fisa-trilha/vaneira/" },
      { category: "Xote Gaúcho", link: "https://fisarmonica.online/fisa-trilha/xote-gaucho/" },
      { category: "Xote Nordestino", link: "https://fisarmonica.online/fisa-trilha/xote-nordestino/" }
    ]
  end

  it "returns an array of categories" do
    is_expected.to eq expected
  end
end