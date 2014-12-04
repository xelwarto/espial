
module Espial
	module Spec
		class Helper

			def self.pluralize(name)
				name << 's'
			end

			def self.s_attr_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(value=nil)
							s_attr.push '#{arg.to_s}'.to_sym unless value.nil?
							value.nil? ? @#{arg.to_s} : @#{arg.to_s} = value
						end
					}
				end
			end

			def s_attr
				@s_attr_var ||= []
			end

			def self.a_attr_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(value=nil)
							a_attr.push '#{arg.to_s}'.to_sym unless value.nil?
							@#{arg.to_s} = @#{arg.to_s} || []
							value.nil? ? @#{arg.to_s}.flatten : @#{arg.to_s}.push(value)
						end
					}
				end
			end

			def a_attr
				@a_attr_var ||= []
			end

			def self.s_obj_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(&block)
							@#{arg.to_s} = @#{arg.to_s} || Espial::Spec::#{arg.to_s.capitalize}.new
							if block_given?
								s_obj.push '#{arg.to_s}'.to_sym
								@#{arg.to_s}.instance_eval(&block)
							end
							@#{arg.to_s}
						end
					}
				end
			end

			def s_obj
				@s_obj_var ||= []
			end

			def self.a_obj_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(name,&block)
							@#{pluralize(arg.to_s)} = @#{pluralize(arg.to_s)} || []
							if block_given?
								a_obj.push '#{arg.to_s}'.to_sym
								obj = Espial::Spec::#{arg.to_s.capitalize}.new(name)
								obj.instance_eval(&block)
								@#{pluralize(arg.to_s)}.push(obj)
							end
							@#{pluralize(arg.to_s)}
						end
					}
				end
			end

			def a_obj
				@a_obj_var ||= []
			end
			
			def to_json
				data = {}

				if !@s_attr_var.nil?
					@s_attr_var.each do |attr|
						data[attr] = self.send(attr.to_s)
					end
				end

				if !@a_attr_var.nil?
					@a_attr_var.each do |attr|
						data[attr] = self.send(attr.to_s)
					end
				end

				if !@s_obj_var.nil?
					@s_obj_var.each do |obj|
						data[obj] = self.send(obj.to_s).to_json
					end
				end

				data
			end

		end
	end
end
