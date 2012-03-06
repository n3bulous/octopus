require 'active_record/connection_adapters/abstract_adapter'

module Octopus::AbstractAdapter

  def self.extended(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    # TODO: rename to 'read_from_master?'?
    def write_occurred?
      @write_occurred
    end

    # TODO: rename to 'enable_read_from_master'?
    def set_write_occurred
      @write_occurred = true
    end

    # TODO: rename to 'disable_read_from_master'?
    def reset_write_occurred
      @write_occurred = false
    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.extend(Octopus::AbstractAdapter)
