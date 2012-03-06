require 'active_record/connection_adapters/abstract/connection_pool'

# c.f., http://blog.jayfields.com/2008/04/alternatives-for-redefining-methods.html
# TODO: shoehorn this into model?
class ActiveRecord::ConnectionAdapters::ConnectionPool
  octopus_free_checkin = instance_method(:checkin)

  define_method :checkin do |conn|
    conn.reset_write_occurred if conn
    octopus_free_checkin.bind(self).call(conn)
  end
end
