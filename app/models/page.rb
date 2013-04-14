# http://haplesshero13.github.io/blog/2012/08/17/rails-syntax-highlighting-using-redcarpet/
class Pygmentize < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language, :options => {})
  end
end

class Page < ActiveRecord::Base

  attr_accessible :body, :title

  validates :title, :presence => true

  belongs_to :user

  def render
  	pygmentized = Pygmentize.new(:filter_html => true, :hard_wrap => true)
	markdown = Redcarpet::Markdown.new(pygmentized, :fenced_code_blocks => true, :autolink => true)
	markdown.render self.body
  end
end

