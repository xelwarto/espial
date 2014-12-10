
module Espial
	module Spec
		class Info < Espial::Spec::Helper
			s_attr_accessor :title, :description, :termsOfService, :version
			h_obj_accessor :contact, :license
		end

		class Contact < Espial::Spec::Helper
			s_attr_accessor :name, :url, :email
		end

		class License < Espial::Spec::Helper
			s_attr_accessor :name, :url
		end
	end
end
