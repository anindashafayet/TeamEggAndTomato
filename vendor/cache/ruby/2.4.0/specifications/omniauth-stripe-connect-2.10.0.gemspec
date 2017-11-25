# -*- encoding: utf-8 -*-
# stub: omniauth-stripe-connect 2.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-stripe-connect".freeze
  s.version = "2.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Isaac Sanders".freeze]
  s.date = "2017-02-01"
  s.description = "Stripe Connect OAuth2 Strategy for OmniAuth 1.0.".freeze
  s.email = ["isaac@isaacbfsanders.com".freeze]
  s.homepage = "https://stripe.com/docs/connect".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Supports the OAuth 2.0 server-side and client-side flows. Read the Stripe Connect docs for more details: https://stripe.com/docs/connect".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.4"])
    else
      s.add_dependency(%q<omniauth>.freeze, ["~> 1.3"])
      s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.4"])
    end
  else
    s.add_dependency(%q<omniauth>.freeze, ["~> 1.3"])
    s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.4"])
  end
end
