module ViewsHelper

  def self.panelize(html_string)
    new_html_string = ''
    need_to_close_panel = false
    html_string.split("\n").each {|line|
      if(line.starts_with? "<h")
        if need_to_close_panel
          new_html_string = new_html_string + "\n\t</div>\n</div>\n<hr>"
        end
        new_html_string = new_html_string + '<div class="panel panel-info">\n\t<div class="panel-heading">\n\t\t' + line + '\n\t</div>' + '\n\t<div class="panel-body">'
        need_to_close_header = true

      else
        new_html_string = new_html_string + '\n\t\t' + line
      end

    }

    return new_html_string.hmtl_safe
  end
end