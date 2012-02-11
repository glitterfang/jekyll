module Jekyll
  class ArchivesBlock < Liquid::Block
    def initialize(tag_name, posts, tokens)
      super
      @posts = posts.collect { |post| post.date.strftime("%B %Y") }
    end

    def render_column(chunk)
      out = "<div class='column'>"
      chunk.each do |c|
        out << "<a href='#'>#{chunk}</a>"
      end
      out << '</div>'
    end

    def render(context)
      chunked = @posts.each_slice(3).to_a
      html = chunked.reduce("") { |mem, val|  mem << render_column(val) }
    end
  end
end

Liquid::Template.register_tag('archives', Jekyll::ArchivesBlock)