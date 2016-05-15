require "aws-sdk"
require "serverkit/resources/base"

module Serverkit
  module Resources
    class S3Bucket < Base
      attribute :aws_access_key_id, type: String
      attribute :aws_region, type: String
      attribute :aws_secret_access_key, type: String
      attribute :name, required: true, type: String

      # @note Override
      def apply
        client.create_bucket(bucket: name)
      end

      # @note Override
      def check
        client.head_bucket(bucket: name)
        true
      rescue ::Aws::S3::Errors::NotFound
        false
      end

      private

      # @return [Aws::S3::Client]
      def client
        @client ||= ::Aws::S3::Client.new(client_options)
      end

      # @return [Hash]
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
