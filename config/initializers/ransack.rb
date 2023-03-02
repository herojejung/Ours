Ransack.configure do |config|
  config.add_predicate 'title_or_text_or_tags_name_cont',
                       arel_predicate: 'matches',
                       formatter: proc { |v| "%#{v}%" },
                       compounds: true,
                       type: :string
end
