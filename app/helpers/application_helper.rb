module ApplicationHelper

  #def link_to_add_fields(name = nil, f = nil, associations = nil, options = nil, html_options = nil, &block)
  #  # If a block is provided there is no name attribute and the arguments are
  #  # shifted with one position to the left. This re-assigns those values.
  #  if block_given?
  #    html_options = options
  #    options = associations
  #    associations = f
  #    f = name
  #  end
  #
  #  options = {} if options.nil?
  #  html_options = {} if html_options.nil?
  #
  #  locals = if options.include? :locals
  #             options[:locals]
  #           else
  #             {}
  #           end
  #
  #  fields = ''
  #  associations.each do |association|
  #
  #  partial = if options.include? :partial
  #              options[:partial]
  #            else
  #              association.to_s.singularize + '_fields'
  #            end
  #
  #  # Render the form fields from a file with the association name provided
  #  new_object = f.object.class.reflect_on_association(association).klass.new
  #  fields << f.fields_for(association, new_object, child_index: 'new_record') do |builder|
  #    render(partial, locals.merge!(f: builder))
  #  end
  #
  #
  #  end
  #
  #  # The rendered fields are sent with the link within the data-form-prepend attr
  #  html_options['data-form-prepend'] = raw CGI.escapeHTML(fields)
  #  html_options['href'] = '#'
  #
  #  content_tag(:a, name, html_options, &block)
  #end
  #
  #def link_to_remove_fields(name, f)
  #  link = link_to name, onclick: 'remove_fields(this);'
  #  f.hidden_field(:_destroy) + link
  #end

  def link_to_remove_fields(name, span_class)
    onclick = 'remove_fields(this); return false;'
    content_tag(:a, name, onclick: onclick, class: 'strong') do
      content_tag(:span, nil, class: span_class)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_function(name, *args, &block)
    html_options = args.extract_options!.symbolize_keys

    function = block_given? ? update_page(&block) : args[0] || ''
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    content_tag(:a, name, html_options.merge(href: href, onclick: onclick))
  end

end
