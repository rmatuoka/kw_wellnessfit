class HomeController < ApplicationController
  layout "home"
  
  def index
    sites =["http://click.uol.com.br/?rf=CS_mod-ultimas&u=http://noticias.uol.com.br/ultnot/cienciaesaude/ultnot/index.xml|UOL saúde","http://new.paho.org/bra/index.php?option=com_rss&feed=RSS2.0&no_html=1|Organização Pan-Americana da saúde"]
    site = sites.choice
    site = site.split("|")
    @Posts = RssReader.posts_for(site[0], 3, false)
    @Fonte = site[1]
  end

end
