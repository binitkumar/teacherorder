jQuery ($) ->
  itemsOptions = {
  itemSelector: ".item",
  containerSelector: ".items-container",
  addSelector: ".item-add",
  removeSelector: ".item-remove",
  itemTemplateSelector: ".item.template",
  new_item_index: "new_item_index",
  }

  $(".order-form").nestedFields({
  itemSelector: ".vendor",
  containerSelector: ".vendors-container",
  addSelector: ".vendor-add",
  removeSelector: ".vendor-remove",
  itemTemplateSelector: ".vendor.template",
  new_item_index: "new_vendor_index",
  afterInsert: (item) ->
    # Applies nestedFields to this task's resources
    item.find(".nested-level-2").nestedFields(itemsOptions)
    # Inserts a resource item
    item.find(".nested-level-2").nestedFields("insert")
  })

  # Applies nestedFields to all projects on page
  $(".order-form").find(".nested-level-2").nestedFields(itemsOptions)