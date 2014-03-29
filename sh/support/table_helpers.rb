module TableHelpers
  def tab_props
    [20,12,12]
  end

  def table_header(a,b,c)
    "#{a.ljust(tab_props[0])} #{b.to_s.ljust(tab_props[1])} #{c.to_s.ljust(tab_props[2])}"
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
end
