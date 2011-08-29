class ContactMailer < ActionMailer::Base
  default :from => "CONTATO NAUTILUS<site@nautilus.ind.br>"
  
  def enviar(corpo)
      @Contato = corpo
      mail(:to => "cnascimento@korewa.com.br", :subject => "Wellnes - Contato via site")
      #mail(:to => @Contato.area, :bbc => @Contato.area, :subject => "Nautilus - Contato via site")
  end
end
