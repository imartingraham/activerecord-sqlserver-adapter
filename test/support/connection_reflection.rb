# frozen_string_literal: true

module ARTest
  module SQLServer
    module ConnectionReflection
      extend ActiveSupport::Concern

      included { extend ConnectionReflection }

      def connection
        ActiveRecord::Base.lease_connection
      end

      def connection_options
        connection.instance_variable_get :@connection_parameters
      end

      def connection_sqlserver_azure?
        connection.sqlserver_azure?
      end
    end
  end
end
