# app/services/users/create.rb
module Servicese
  module Users
    class Create
      def initailize(params)
        @user = User.new(params)
      end

      def success?
      @success
      end
      def errors; end

      def call
        if user.save
          @success = true
          else
          @success = false
      end

      private 


    end
  end
end