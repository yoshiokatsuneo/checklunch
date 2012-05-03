class GmtoffsetController < ApplicationController
  def gmtoffset
    cookies[:gmtoffset] = params[:gmtoffset].to_i if !params[:gmtoffset].nil? # notice that the javascript version of gmtoffset is in minutes ;-)
    render :nothing => true # this can be improved by being able to return xml or json output to inform the client side whether the offset was successfully set on the server or not.
  end
end
