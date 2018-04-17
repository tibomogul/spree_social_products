Deface::Override.new(
  virtual_path: 'spree/layouts/spree_application',
  name: 'add_meta_to_head',
  insert_bottom: "[data-hook='inside_head']",
  partial: 'spree/shared/meta_tags'
)
