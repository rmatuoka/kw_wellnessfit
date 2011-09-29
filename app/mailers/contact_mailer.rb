class ContactMailer < ActionMailer::Base
  default :from => "CONTATO WELLNESS FIT<site@wellnessfit.com.br>"
  
  def enviar(nome, email, telefone, msg)
      @Nome = nome
      @Email = email
      @Telefone = telefone
      @Msg = msg
      mail(:to => "contato@wellnessfit.com.br",:bcc => "rmatuoka@korewa.com.br", :subject => "Wellnes - Contato via site")
      #mail(:to => @Contato.area, :bbc => @Contato.area, :subject => "Nautilus - Contato via site")
  end

  def works(nome, email, telefone, anexado)
      @Nome = nome
      @Email = email
      @Telefone = telefone
      attachments[anexado] = File.read(anexado)
      mail(:to => "contato@wellnessfit.com.br",:bcc => "rmatuoka@korewa.com.br", :subject => "Wellnes - Curriculo via Site")
      #mail(:to => "cnascimento@korewa.com.br",:bcc => "cnascimento@korewa.com.br", :subject => "Wellnes - Curriculo via Site")
  end
end
