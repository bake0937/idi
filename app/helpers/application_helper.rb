module ApplicationHelper

  #フラッシュメッセージの設定
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger",
      alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
  def flash_messages(opts = {})
    flash.each do |flash_type, message|
      concat(
        content_tag(:div, message, class: "alert alert-dismissable #{bootstrap_class_for(flash_type)} fade in") do
          concat(
            content_tag(:button, class: "close", data: { dismiss: "alert" }) do
              concat content_tag(:span, "&times;".html_safe)
            end
          )
          concat message
        end
      )
    end
  end

  def show_meta_tags
    if display_meta_tags.blank?
      assign_meta_tags
    end
    display_meta_tags
  end

  def assign_meta_tags(options = {})
    defaults = t('meta_tags.defaults')
    options.reverse_merge!(defaults)

    site = options[:site]
    title = options[:title]
    description = options[:description]
    image = options[:image].presence || image_url('logo.png')

    configs = {
      separator: '-',
      reverse: true,
      site: site,
      title: title,
      description: description,
      canonical: request.original_url,
      og: {
        type: 'article',
        title: title.presence || site,
        description: description,
        url: request.original_url,
        image: image,
        site_name: 'iDi(アイディ)'
      }
    }

    set_meta_tags(configs)
  end

end
