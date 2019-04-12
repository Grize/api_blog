class IpService
  def self.find_users
    query = <<-SQL
      SELECT DISTINCT user_ip, username
      FROM posts
    SQL
    result = ActiveRecord::Base.connection.execute(query).to_a

    result.
      group_by { |e| e['user_ip'] }.
      each { |_,v| v.map! { |e| e['username'] } }.
      reject { |_,v| v.size == 1 }.
      map { |k,v| { ip: k, users: v } }
  end
end
