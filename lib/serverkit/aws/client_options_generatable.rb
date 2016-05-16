module Serverkit
  module Aws
    module ClientOptionsGeneratable
      private

      # @return [Hash{Symbol => Object}]
      def client_options
        options = { region: aws_region }
        if aws_access_key_id || aws_secret_access_key
          options[:credentials] = ::Aws::Credentials.new(aws_access_key_id, aws_secret_access_key)
        end
        options
      end
    end
  end
end
