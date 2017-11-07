class HomeController < ApplicationController
  def home
    @client_requests = ClientRequest.all
  end

  def signup
  end

  def login
  end

  def aboutus
  end

  def profile
  end

  def services
  end
  
  def faq
  end
  
  def tos
  end
  
  def pp
  end
  
  def sitemap
  end
end
