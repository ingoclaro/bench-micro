class AllocationSummaryTable
  attr_accessor :results
  def initialize(results)
    @results = results
  end

  def render
    summary_table.join("\n")
  end

  def sorted_results
    results.sort_by{|x| x[:total_allocations]}
  end

  def table
    sorted_results.map do |res|
      name        = res[:frameworkname].downcase
      allocations = res[:total_allocations]
      memory      = res[:total_memsize]
      table_row(name, allocations, memory)
    end.join("\n")
  end

  def summary_table
    summary = []
    summary << table_header("Framework", "Tot. alloc.", 'Tot. mem.')
    summary << table_header(":------------", "-----:", '-----:')
    summary << table
  end

  def table_header(a,b,c)
    "| #{a.ljust(20)} | #{b.to_s.ljust(12)} | #{c.to_s.ljust(12)} |"
  end

  def table_row(a,b,c)
    "| #{a.ljust(20)} | #{b.to_s.rjust(12)} | #{c.to_s.rjust(12)} |"
  end
end
