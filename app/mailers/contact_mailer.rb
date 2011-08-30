class ContactMailer < ActionMailer::Base
  default :from => "CONTATO WELLNESS FIT<site@wellnessfit.com.br>"
  
  def enviar(nome, email, telefone, msg)
      @Nome = nome
      @Email = email
      @Telefone = telefone
      @Msg = msg
      mail(:to => "rmatuoka@korewa.com.br", :subject => "Wellnes - Contato via site")
      #mail(:to => @Contato.area, :bbc => @Contato.area, :subject => "Nautilus - Contato via site")
  end
end
