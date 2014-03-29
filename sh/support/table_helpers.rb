module TableHelpers
  def tab_props
    [20,12,12]
  end

  def table_row(a,b,c)
    "#{a.ljust(tab_props[0])} #{b.to_s.rjust(tab_props[1])} #{c.to_s.rjust(tab_props[2])}"
  end

  def table_separator
    "-"* (tab_props.reduce(:+) + 2)
  end

  def render_markdown
    [%Q(```), render, %Q(```)].join("\n")
  end

  # speed_table
  def replace_readme(comment_signature)
    regex_start  = %Q(<!-- #{comment_signature} -->)
    regex_end    = %Q(<!-- #{comment_signature}_end -->)
    regex_string = %Q(\<\!-- #{comment_signature} --\>(.*)\<\!-- #{comment_signature}_end --\>)
    regex        = Regexp::new(regex_string, Regexp::MULTILINE)
    content      = File.read('README.md')
    new_content  = content.gsub(regex, render_markdown)
    File.open('README.md', 'w') do |f|
      f.puts new_content
    end
  end
end
