require 'active_support/concern'

module Documentable
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include SimpleEnum::Mongoid
  end
end
