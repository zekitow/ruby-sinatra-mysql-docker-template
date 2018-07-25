module Requests
  class BaseRequest
    include ActiveModel::Model

    #
    # Valida um request e lanca erro caso seja invalido.
    #
    def validate!
      raise BadRequestError.new(self.errors.full_messages.uniq.join(', ')) unless valid?
    end

    # Overwrite para o ActiveModel
    def persisted?
      false
    end

    #
    # Cria dinamicamente metodos para validacao de "use_attribute?"
    # Caso o metodo exista na classe, ele é chamado, caso contrario
    # verifica se o attributo chamado está vazio.
    #
    # Ex.: use_age?, user_play_since?
    #
    def method_missing(m, *args, &block)
      mtd = m.to_s
      return send("#{mtd.to_sym}") if respond_to? mtd

      if mtd.starts_with? 'use_' and mtd.ends_with? '?'
        attr = mtd.gsub(/use_/,'').gsub('?','')
        val = send("#{attr.to_sym}")
        return (not val.empty?) if val.kind_of?(Array)
        return (not val.blank?)
      else
        raise NoMethodError.new("Undefined method '#{m}'!")
      end
    end

  end
end