require 'set'
class UniqueEmail
  # @param {String[]} emails
  # @return {Integer}
  def num_nique_emails(emails)
    seen = Set.new
    emails.each do |email|
      local, domain = email.split('@')
      local = local.split("+")[0]
      local = local.tr(".","")
      seen.add("#{local}@#{domain}")
    end
    seen.size
  end
  def num_unique_emails2(emails)
    seen = Set.new
    emails.each do |email|
      local, domain = email.split('@')
      local = local.gsub(/\+.+$/, '').gsub(/\./, '')
      seen.add([local, domain].join('@'))
    end
    seen.size
  end
end