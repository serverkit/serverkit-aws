require "serverkit/resources/base"

module Serverkit
  module Resources
    class S3 < Base
      attribute :name, required: true, type: String

      # @note Override
      def apply
        raise "TODO"
      end

      # @note Override
      def check
        raise "TODO"
      end
    end
  end
end
