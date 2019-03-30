class ReorderLog
  # @param {String[]} logs
  # @return {String[]}
  def reorder_log_files(logs)
    logs.sort_by do |log|
      id_, *rest = log.split(/\s/)
      rest[0].match(/\D/) ? [0, rest, id_] : [1]
    end
  end
end