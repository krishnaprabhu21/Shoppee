module ApplicationHelper

	def check(pid, opid)
		if pid = opid
			@offer = @offers.where(product_id: pid)
			return true
		else
			return false
		end
	end

end
