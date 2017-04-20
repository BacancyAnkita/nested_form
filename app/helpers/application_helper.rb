module ApplicationHelper
  def link_to_add_row(name, f, association, **args)
    obj = f.object.send(association).klass.new
    id = obj.object_id
    fields = f.fields_for(association, obj, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
end
