require 'spec/helper'

require 'examples/templates/template_erubis'

describe 'Template Erubis' do
  ramaze

  it '/' do
    get('/').should == "<a href=\"/\">index</a> | <a href=\"/internal\">internal</a> | <a href=\"/external\">external</a>"
  end

  %w[/internal /external].each do |url|
    it url do
      html = get(url)
      html.should_not == nil
      html.should =~ %r{<title>Template::Erubis (internal|external)</title>}
      html.should =~ %r{<h1>The (internal|external) Template for Erubis</h1>}
    end
  end
end
