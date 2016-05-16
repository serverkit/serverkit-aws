require "active_support/core_ext/hash/keys"
require "aws-sdk"
require "serverkit/aws/client_options_generatable"
require "serverkit/resources/base"

module Serverkit
  module Resources
    class CloudFrontWebDistribution < Base
      include ::Serverkit::Aws::ClientOptionsGeneratable

      DEFAULT_DISTRIBUTION_CONFIG = {
        comment: "Created by serverkit-aws",
        default_cache_behavior: {
          forwarded_values: {
            cookies: {
              forward: "none",
            },
            query_string: false,
          },
          min_ttl: 0,
          trusted_signers: {
            enabled: false,
            quantity: 0,
          },
          viewer_protocol_policy: "allow-all",
        },
        enabled: true,
      }

      attribute :aws_access_key_id, type: ::String
      attribute :aws_region, type: ::String
      attribute :aws_secret_access_key, type: ::String
      attribute :distribution_config, type: ::Hash

      # @note Override
      def apply
        client.create_distribution(
          distribution_config: DEFAULT_DISTRIBUTION_CONFIG.deep_merge(
            distribution_config.deep_symbolize_keys,
          )
        )
      rescue ::Aws::CloudFront::Errors::DistributionAlreadyExists
      end

      # @note Override
      def check
        false
      end

      # @note Override
      def recheck
        true
      end

      private

      # @return [Aws::Cloudfront::Client]
      def client
        @client ||= ::Aws::CloudFront::Client.new(client_options)
      end
    end
  end
end
