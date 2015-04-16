
module Espial
	module Spec
		class Helper

			def self.pluralize(name)
				name << 's'
			end

			def ref(value=nil)
				if value.nil?
					@ref
				else
					if value.is_a?(String)
						@ref = value
					end
				end
			end

			# String attribute spec
			def self.s_attr_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(value=nil)
							if value.nil?
								@#{arg.to_s}
							else
								if value.is_a?(String)
									unless s_attr.include? '#{arg.to_s}'.to_sym
										s_attr.push '#{arg.to_s}'.to_sym
									end
									@#{arg.to_s} = value
								end
							end
						end
					}
				end
			end

			# Boolean attribute spec
			def self.b_attr_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(value=nil)
							if value.nil?
								@#{arg.to_s}
							else
								if value.is_a?(TrueClass) || value.is_a?(FalseClass)
									unless s_attr.include? '#{arg.to_s}'.to_sym
										s_attr.push '#{arg.to_s}'.to_sym
									end
									@#{arg.to_s} = value
								end
							end
						end
					}
				end
			end

			def s_attr
				@s_attr_var ||= []
			end

			# Array attribute spec
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

			# Hash object spec
			def self.h_obj_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{arg.to_s}(&block)
							@#{arg.to_s} = @#{arg.to_s} || Espial::Spec::#{arg.to_s.capitalize}.new
							if block_given?
								h_obj.push '#{arg.to_s}'.to_sym
								@#{arg.to_s}.instance_eval(&block)
							end
							@#{arg.to_s}
						end
					}
				end
			end

			def h_obj
				@h_obj_var ||= []
			end

			# Hash(ID) object spec
			def self.hid_obj_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{pluralize(arg.to_s)}(name=nil,&block)
							#{arg.to_s}(name,&block)
						end

						def #{arg.to_s}(name=nil,&block)
							@#{pluralize(arg.to_s)} = @#{pluralize(arg.to_s)} || []
							if block_given?
								unless hid_obj.include? '#{arg.to_s}'.to_sym
									hid_obj.push '#{arg.to_s}'.to_sym
								end
								obj = Espial::Spec::#{arg.to_s.capitalize}.new(name)
								obj.instance_eval(&block)
								@#{pluralize(arg.to_s)}.push(obj)
							end
							@#{pluralize(arg.to_s)}
						end
					}
				end
			end

			def hid_obj
				@hid_obj_var ||= []
			end

			# Array object spec
			def self.a_obj_accessor(*args)
				args.each do |arg|
					class_eval %Q{
						def #{pluralize(arg.to_s)}(&block)
							#{arg.to_s}(&block)
						end

						def #{arg.to_s}(&block)
							@#{pluralize(arg.to_s)} = @#{pluralize(arg.to_s)} || []
							if block_given?
								unless a_obj.include? '#{arg.to_s}'.to_sym
									a_obj.push '#{arg.to_s}'.to_sym
								end
								obj = Espial::Spec::#{arg.to_s.capitalize}.new
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
				data = data || {}

				if !@ref.nil?
					data[:$ref] = @ref
				end

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

				if !@h_obj_var.nil?
					@h_obj_var.each do |obj|
						data[obj] = self.send(obj.to_s).to_json
					end
				end

				if !@hid_obj_var.nil?
					@hid_obj_var.each do |obj|
						obj_name = Espial::Spec::Helper.pluralize(obj.to_s)
						data[obj_name] = {}

						objs = self.send(obj.to_s)
						objs.each do |o|
							data[obj_name][o.id] = o.to_json
						end
					end
				end

				if !@a_obj_var.nil?
					@a_obj_var.each do |obj|
						obj_name = Espial::Spec::Helper.pluralize(obj.to_s)
						data[obj_name] = []

						objs = self.send(obj.to_s)
						objs.each do |o|
							data[obj_name].push(o.to_json)
						end
					end
				end

				data
			end

		end
	end
end
