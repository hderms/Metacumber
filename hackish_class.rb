class Metacumber
  class << self
      [:Then, :When, :Given, :And].each do |verb|
        define_method verb do |*reg, &blk|
          puts reg.to_s
        end
      end
    end
  instance_eval do
    def method_missing(*args)
      puts "----"
    end

    def translate(file_name)
      class_eval do
        eval(File.read(file_name))
      end
    end
  end
end
Metacumber.translate("./inside_scope.rb")
