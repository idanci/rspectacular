###
# Unscrupulously stolen from: https://raw.github.com/cucumber/cucumber-rails/master/lib/cucumber/rails/capybara/select_dates_and_times.rb
#
def select_date(date, options = {})
  date        = Time.parse(date)
  base_dom_id = get_base_dom_id_from_label_tag(options[:from])

  page.execute_script %Q{$("##{base_dom_id}_1i").val("#{date.strftime('%Y')}")}
  page.execute_script %Q{$("##{base_dom_id}_2i").val("#{date.strftime('%m')}")}
  page.execute_script %Q{$("##{base_dom_id}_3i").val("#{date.strftime('%d')}")}
  page.execute_script %Q{$("##{base_dom_id}_datepicker").val("#{date.strftime('%m/%d/%Y')}")}
  page.execute_script %Q{$("##{base_dom_id}_datepicker").change()}
end

def select_time(time, options = {})
  time          = Time.zone.parse(time)
  base_dom_id   = get_base_dom_id_from_label_tag(options[:from])

  find(:xpath, ".//select[@id='#{base_dom_id}_4i']").select(time.strftime '%I %p')
  find(:xpath, ".//select[@id='#{base_dom_id}_5i']").select(time.min.to_s.rjust(2,  '0'))

  page.execute_script %Q{$("##{base_dom_id}_datepicker").change()}
end

def select_datetime(datetime, options = {})
  select_date(datetime, options)
  select_time(datetime, options)
end

private

# @example "event_starts_at_"
def get_base_dom_id_from_label_tag(field)
  find(:xpath, ".//label[contains(., '#{field}')]")['for'].gsub(/(_[1-5]i)$/, '')
end
