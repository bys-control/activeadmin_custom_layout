module TableForPatch

  def column(*args, &block)
    super

    col = @columns.last

    @collection.each_with_index do |resource, index|
      data = aa_data[:table][:rows][index][:data] ||= []

      attr = col.data
      attr = args[1][:sortable] if args[1] and args[1][:sortable].present?

      data << {
        classes: col.html_class,
        html: "#{find_last_child(@tbody.children[index].children.last)}",
        value: "#{find_value_patch(resource, attr)}"
      }
    end
  end

  def find_last_child(elem)
    if elem.children.length>0
      find_last_child(elem.children.first)
    else
      elem
    end
  end

  def find_value_patch(resource, attr)
    if attr.is_a? Proc
      nil
    elsif attr =~ /\A(.+)_id\z/ && reflection_for(resource, $1.to_sym)
      resource.public_send $1
    elsif resource.respond_to? attr
      resource.public_send attr
    elsif resource.respond_to? :[]
      resource[attr]
    end
  end

  protected

  def build_table_header(col)
    aa_data[:table][:header] ||= []

    classes  = Arbre::HTML::ClassList.new
    sort_key = sortable? && col.sortable? && col.sort_key
    params   = request.query_parameters.except :page, :order, :commit, :format
    url      = nil

    classes << 'sortable'                         if sort_key
    classes << "sorted-#{current_sort[1]}"        if sort_key && current_sort[0] == sort_key
    classes << col.html_class

    if sort_key
      th class: classes do
        url = link_to col.pretty_title, params: params, order: "#{sort_key}_#{order_for_sort_key(sort_key)}"
      end
    else
      th col.pretty_title, class: classes
    end

    aa_data[:table][:header].push({
      name: "#{col.pretty_title}",
      classes: "#{classes}".split(' '),
      url: url,
      current_sort: current_sort
    })
  end

  def build_table_body
    aa_data[:table][:rows] ||= []
    @tbody = tbody do
      # Build enough rows for our collection
      @collection.each do |elem|
        classes = [cycle('odd', 'even')]

        if @row_class
          classes << @row_class.call(elem)
        end

        tr(class: classes.flatten.join(' '), id: dom_id_for(elem))
        aa_data[:table][:rows].push({
          id: dom_id_for(elem),
          classes: classes
        })
      end
    end
  end

end


module ActiveAdmin
  module Views
    class TableFor < Arbre::HTML::Table
      prepend TableForPatch
    end
  end
end
