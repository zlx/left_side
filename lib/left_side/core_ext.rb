class String
  def get_params
    params_str = self.split("?")[1]
    return {} unless params_str
    params_str.split('&').inject({}) do |hash, str|
      arr = str.split('=')
      if arr[0] =~ /(\w*)\[(\w*)\]/
        hash.merge($1 => {$2 => arr[1]})
      else
        hash.merge(arr[0] => arr[1])
      end
    end
  end
end

class Hash
  def extract(*keys)
    result = {}
    keys.flatten.each {|key| result[key] = self[key] }
    result
  end

  def fixed_hash
    g = {}
    self.each_pair do |k, v|
      g[k.to_s] = v.is_a?(Hash) ? v.fixed_hash : v.to_s
    end
    g
  end

  def fetch_values
    self.map{|_, v| v.is_a?(Hash) ? v.fetch_values : v}.join(',').split(',')
  end

  def process_each_value(&block)
    self.each{|k, v| self[k] = v.is_a?(Hash) ? v.process_each_value(&block) : Array(v).map{|vv| yield vv}}
  end
end
