module ApplicationHelper
    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Producao"
        else 
            "Teste"
        end
    end
end
