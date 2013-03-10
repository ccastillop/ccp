module Mercury
  module Authentication

    def can_edit?
      authenticated?
    end

  end
end
