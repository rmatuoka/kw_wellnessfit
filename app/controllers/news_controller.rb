class NewsController < ApplicationController
  def index
    @Uol = RssReader.posts_for("http://click.uol.com.br/?rf=CS_mod-ultimas&u=http://noticias.uol.com.br/ultnot/cienciaesaude/ultnot/index.xml", 10, false)
    @Paho = RssReader.posts_for("http://new.paho.org/bra/index.php?option=com_rss&feed=RSS2.0&no_html=1", 0, false)
  end

  def show
  end

end
