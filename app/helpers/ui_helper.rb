module UiHelper
  def info_alert(text)
    content_tag(:div, text,
      class: 'alert alert-info alert-styled-left alert-arrow-left alert-bordered helper',
      id: 'alert-info')
  end

  def danger_alert(text = nil)
    text = t('no_results') if text.nil?
    content_tag(:div, text,
      class: 'alert alert-danger alert-styled-left alert-arrow-left alert-bordered')
  end

  def cross_or_tick(value)
    if value == true
      content_tag(:i, nil, class: 'fas fa-check text-success')
    else
      content_tag(:i, nil, class: 'fas fa-times text-danger')
    end
  end

  def status_label(active)
    if active
      content_tag(:span, t('helpers.active'), class: 'badge bg-success')
    else
      content_tag(:span, t('helpers.inactive'), class: 'badge bg-danger')
    end
  end

  def localized_datetime(datetime, format = nil)
    return if datetime.blank?

    I18n.l(Time.zone.parse(datetime), format: format)
  end
end
