# frozen_string_literal: true

require 'active_record'

module ActiveRecord
  module SecureUuid
    extend ActiveSupport::Concern

    module ClassMethods
      # Example using has_secure_uuid
      #
      #   # Schema: User(identifier:string, uuid:string)
      #   class User < ActiveRecord::Base
      #     has_secure_uuid
      #     has_secure_uuid :uuid
      #   end
      #
      #   user = User.new
      #   user.save
      #   user.identifier # => "93712506-fe9e-4ae9-a713-53c67cd9bccc"
      #   user.uuid # => "245f9ae1-9f8d-4a0e-817d-8ba3e4d663c1"
      #   user.regenerate_identifier # => true
      #   user.regenerate_uuid # => true
      #
      # Note that it's still possible to generate a race condition in the database in the same way that
      # <tt>validates_uniqueness_of</tt> can. You're encouraged to add a unique index in the database to deal
      # with this even more unlikely scenario.
      def has_secure_uuid(attribute = :identifier)
        define_method("regenerate_#{attribute}") do
          update_attributes attribute => self.class.generate_unique_uuid
        end
        before_create do
          send("#{attribute}=", self.class.generate_unique_uuid) unless send("#{attribute}?")
        end
      end

      def generate_unique_uuid
        SecureRandom.uuid
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::SecureUuid)
