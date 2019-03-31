class GaugesController < ApplicationController
	def index
		set_channels_menu
		@channel = Channel.find(params[:channel_id])
		@channel_id = params[:channel_id]
		@domain = domain
		#set default value of model gauge
		#here
		check_permissions(@channel)		
	end

	def show
		feed_params = ['key', 'api_key', 'apikey', 'days','start','end','round','timescale','average','median','sum','results','location','status','timezone','offset','min','max']

	    # set chart size
	    width = params[:width].present? ? params[:width] : Chart.default_width
	    @width_style = (width == 'auto') ? '' : "width: #{width.to_i - 25}px;"
	    height = params[:height].present? ? params[:height] : Chart.default_height
	    @height_style = (height == 'auto') ? '' : "height: #{height.to_i - 25}px;"

	    # add extra parameters to querystring
	    @qs = ''
	    params.each do |p|
	      @qs += "&#{p[0]}=#{p[1]}" if feed_params.include?(p[0])
	    end

	    # set ssl
	    ssl = (get_header_value('x_ssl') == 'true')
	    @domain = domain(ssl)

	    # should data be pushed off the end in dynamic chart
	    @push = (params[:push] and params[:push] == 'false') ? false : true
	    @results = params[:results]
	    render :layout => false
		end
end
