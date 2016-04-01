require File.expand_path('../../config/constants', __FILE__)
require 'pry'
require 'pg' # jruby_pg gem is required

class QueueFetcher
  def initialize
    @dbConn = PG.connect( dbname: DB_NAME,
                          host: HOST,
                          login: USER_NAME,
                          user: USER_NAME,
                          password: PASSWORD,
                          port: PORT )
  end

  def get_portfolio_ppt
    @dbConn.exec('select * from member_credit3.portfolio_ppts')
  end

  def check_connection
    begin
      status = @dbConn.exec( "SELECT 1" )
      puts "DB Connection Success: #{!status.count.zero?}"
    rescue PG::Error => err
      puts "%p while testing connection: %s" % [ err.class, err.message ]
      @dbConn.reset
    end
  end
end
