module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end 
    
    def locale(locale)
    I18n.locale == :en ? "Estados Unidos":"Portugues Brasil"
    
    end
    
    def nome_aplicacao
        "CRYPTO WALLET APP"
    end 
    
    def ambiente_desenvolviemnto
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Producao"
        else 
            "Teste"
        end 
            
    end 

end
