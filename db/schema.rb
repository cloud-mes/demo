# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151002100548) do

  create_table "bin_codes", id: false, force: :cascade do |t|
    t.string  "bin_code",    null: false
    t.integer "bin_type"
    t.string  "description"
    t.index ["bin_code"], name: "idx_on_bin_codes", unique: true
  end

  create_table "boms", force: :cascade do |t|
    t.integer  "work_order_id",                         null: false
    t.integer  "component_id",                          null: false
    t.string   "component_instruction"
    t.integer  "qty_required"
    t.boolean  "stage_confirmed",       default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["work_order_id"], name: "idx_work_order_id_on_boms"
  end

  create_table "certs", force: :cascade do |t|
    t.string   "certification_code", null: false
    t.string   "description"
    t.integer  "life_seconds"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["certification_code"], name: "idx_cert_code_on_certs"
  end

  create_table "certs_step_codes", id: false, force: :cascade do |t|
    t.integer  "step_code_id", null: false
    t.integer  "cert_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["step_code_id", "cert_id"], name: "idx_step_code_certs", unique: true
  end

  create_table "component_containers", force: :cascade do |t|
    t.string   "container_code",     null: false
    t.integer  "component_id",       null: false
    t.string   "sap_batch"
    t.string   "vendor"
    t.string   "vendor_lot"
    t.string   "vendor_datecode"
    t.string   "vendor_part_number"
    t.datetime "shelf_life_start"
    t.datetime "shelf_life_expire"
    t.datetime "floor_life_start"
    t.datetime "floor_life_expire"
    t.integer  "qty"
    t.string   "uom"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["component_id"], name: "idx_comp_id_on_comp_containers"
    t.index ["container_code"], name: "idx_co_code_on_comp_containers"
  end

  create_table "component_histories", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "usage_time", null: false
    t.index ["step_id"], name: "idx_step_id_on_comp_histories"
  end

  create_table "component_history_details", force: :cascade do |t|
    t.integer "component_history_id",   null: false
    t.integer "component_container_id", null: false
    t.index ["component_history_id"], name: "idx_comp_history_on_details"
  end

  create_table "component_step_usage_settings", force: :cascade do |t|
    t.integer  "step_code_id",                                null: false
    t.string   "product_componenet_category"
    t.date     "from_date",                                   null: false
    t.date     "to_date"
    t.integer  "component_id",                                null: false
    t.boolean  "is_required_before_start",    default: false, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["step_code_id"], name: "idx_step_code_on_comp_step_use"
  end

  create_table "components", force: :cascade do |t|
    t.string   "component_code",         null: false
    t.string   "description"
    t.string   "component_type"
    t.boolean  "indirect_material"
    t.integer  "floor_life_seconds"
    t.integer  "shelf_life_seconds"
    t.integer  "quantity_per_container"
    t.string   "container_uom"
    t.boolean  "used_at_frontend"
    t.boolean  "used_at_backend"
    t.boolean  "is_containerized"
    t.boolean  "is_active"
    t.string   "sap_material_document"
    t.datetime "sap_material_doc_time"
    t.string   "sap_material_doc_item"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["component_code"], name: "idx_comp_code_on_components", unique: true
  end

  create_table "factories", force: :cascade do |t|
    t.string   "factory_code",     null: false
    t.string   "factory_name"
    t.string   "factory_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["factory_code"], name: "idx_on_factories", unique: true
  end

  create_table "hold_reasons", force: :cascade do |t|
    t.string   "hold_reason", null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hold_release_histories", force: :cascade do |t|
    t.integer  "container_id"
    t.string   "container_name"
    t.string   "class_name"
    t.integer  "product_id"
    t.integer  "work_order_id"
    t.integer  "step_sequence"
    t.integer  "step_id"
    t.datetime "hold_time",                  null: false
    t.string   "hold_reason",                null: false
    t.string   "hold_reason_description",    null: false
    t.string   "hold_comment"
    t.integer  "hold_user_id"
    t.datetime "release_time"
    t.string   "release_reason"
    t.string   "release_reason_description"
    t.string   "release_comment"
    t.integer  "release_user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["container_id"], name: "idx_container_id_on_uhlh"
    t.index ["container_name"], name: "idx_container_name_on_uhlh"
    t.index ["product_id"], name: "idx_product_id_on_uhlh"
    t.index ["step_id"], name: "idx_step_id_on_uhlh"
  end

  create_table "inline_rework_next_steps", force: :cascade do |t|
    t.integer  "step_code_id",      null: false
    t.string   "defect_code",       null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.integer  "from_step_code_id", null: false
    t.string   "step_result",       null: false
    t.integer  "to_step_code_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["step_code_id", "defect_code", "from_step_code_id"], name: "idx_irns_on_step_defect_codes"
  end

  create_table "instructions", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "idx_step_id_on_instructions"
  end

  create_table "lot_basic_histories", force: :cascade do |t|
    t.integer  "lot_id"
    t.string   "lot_no"
    t.integer  "step_id"
    t.integer  "step_sequence"
    t.string   "step_code",          null: false
    t.integer  "product_id"
    t.string   "product_code"
    t.integer  "machine_id"
    t.string   "machine_code"
    t.integer  "work_order_id"
    t.string   "work_order_name"
    t.datetime "in_queue_time",      null: false
    t.datetime "start_process_time"
    t.integer  "move_to_step_id"
    t.string   "move_to_step_code"
    t.datetime "move_time"
    t.integer  "start_user_id"
    t.integer  "move_user_id"
    t.string   "comment"
    t.integer  "in_qty"
    t.integer  "out_qty"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["lot_id"], name: "idx_unit_id_on_lot_histories"
    t.index ["lot_no"], name: "idx_lot_no_on_lot_histories"
    t.index ["product_id"], name: "idx_pt_id_on_lot_histories"
    t.index ["step_id"], name: "idx_step_id_on_lot_histories"
    t.index ["work_order_id"], name: "idx_wo_id_on_lot_histories"
  end

  create_table "lot_bins", force: :cascade do |t|
    t.integer  "lot_id",     null: false
    t.string   "lot_no",     null: false
    t.integer  "step_id",    null: false
    t.string   "step_code",  null: false
    t.string   "bin_code"
    t.integer  "bin_qty"
    t.integer  "user_id",    null: false
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lot_id"], name: "idx_lot_id_on_lot_bins"
    t.index ["lot_no"], name: "idx_lot_no_on_lot_bins"
    t.index ["step_id"], name: "idx_step_id_on_lot_bins"
  end

  create_table "lot_combine_histories", force: :cascade do |t|
    t.integer  "lot_id",      null: false
    t.string   "lot_no",      null: false
    t.integer  "step_id",     null: false
    t.string   "step_code",   null: false
    t.integer  "sub_lot_id",  null: false
    t.string   "sub_lot_no",  null: false
    t.integer  "sub_lot_qty", null: false
    t.integer  "user_id",     null: false
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lot_id"], name: "idx_lot_id_on_comb_histories"
    t.index ["lot_no"], name: "idx_lot_no_on_comb_histories"
    t.index ["step_id"], name: "idx_step_id_on_comb_histories"
  end

  create_table "lot_rejects", force: :cascade do |t|
    t.integer  "lot_id",         null: false
    t.string   "lot_no",         null: false
    t.integer  "step_id",        null: false
    t.string   "step_code",      null: false
    t.string   "reject_code"
    t.integer  "reject_qty"
    t.integer  "reject_user_id", null: false
    t.string   "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["lot_id"], name: "idx_lot_id_on_lot_rejects"
    t.index ["lot_no"], name: "idx_lot_no_on_lot_rejects"
    t.index ["step_id"], name: "idx_step_id_on_lot_rejects"
  end

  create_table "lot_split_histories", force: :cascade do |t|
    t.integer  "lot_id",      null: false
    t.string   "lot_no",      null: false
    t.integer  "step_id",     null: false
    t.string   "step_code",   null: false
    t.integer  "sub_lot_id",  null: false
    t.string   "sub_lot_no",  null: false
    t.integer  "sub_lot_qty", null: false
    t.integer  "user_id",     null: false
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lot_id"], name: "idx_lot_id_on_split_histories"
    t.index ["lot_no"], name: "idx_lot_no_on_split_histories"
    t.index ["step_id"], name: "idx_step_id_on_split_histories"
  end

  create_table "lot_types", force: :cascade do |t|
    t.string   "lot_type",    null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string   "lot_no",                            null: false
    t.integer  "status",                default: 0, null: false
    t.integer  "work_order_id"
    t.integer  "workflow_id",                       null: false
    t.integer  "step_id",                           null: false
    t.integer  "machine_id"
    t.integer  "before_hold_status"
    t.integer  "hold_count",            default: 0
    t.string   "comment"
    t.integer  "factory_id",                        null: false
    t.integer  "lot_type_id",                       null: false
    t.integer  "product_id",                        null: false
    t.integer  "basic_histories_count", default: 0, null: false
    t.integer  "qty",                               null: false
    t.integer  "wafer_qty"
    t.string   "customer_number"
    t.string   "customer_part_number"
    t.integer  "created_user_id",                   null: false
    t.integer  "updated_user_id",                   null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["lot_no"], name: "idx_lot_no_on_lots", unique: true
    t.index ["product_id"], name: "idx_product_id_on_lots"
    t.index ["step_id"], name: "idx_step_id_on_lots"
    t.index ["work_order_id"], name: "idx_work_order_id_on_lots"
    t.index ["workflow_id"], name: "idx_workflow_id_on_lots"
  end

  create_table "low_yield_settings", force: :cascade do |t|
    t.integer  "step_code_id",             null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.float    "lower_limit"
    t.float    "upper_limit"
    t.integer  "threshold_in_pass_number"
    t.string   "notification_email_group"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["order_type", "product_id"], name: "idx_wo_t_pt_on_low_yield_sets"
  end

  create_table "machine_histories", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "usage_time", null: false
    t.index ["step_id"], name: "idx_step_id_on_machine_history"
  end

  create_table "machine_history_details", force: :cascade do |t|
    t.integer "machine_history_id", null: false
    t.integer "machine_id",         null: false
    t.index ["machine_history_id"], name: "idx_machine_history_on_details"
  end

  create_table "machine_mappings", force: :cascade do |t|
    t.integer  "step_code_id",                             null: false
    t.string   "product_machine_category"
    t.integer  "machine_type_id",                          null: false
    t.boolean  "is_required_before_start", default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["step_code_id"], name: "idx_step_code_on_machine_map"
  end

  create_table "machine_types", force: :cascade do |t|
    t.string   "machine_type"
    t.string   "description"
    t.integer  "calibration_frequency_seconds"
    t.integer  "small_pm_frequency_seconds"
    t.integer  "large_pm_frequency_seconds"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string   "machine_code"
    t.string   "description"
    t.integer  "machine_type_id",                   null: false
    t.datetime "last_calibration_time"
    t.datetime "next_calibration_time"
    t.date     "last_small_pm_time"
    t.date     "next_small_pm_time"
    t.date     "last_large_pm_time"
    t.date     "next_large_pm_time"
    t.integer  "status",                default: 0
    t.integer  "created_user_id",                   null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["machine_type_id"], name: "idx_machine_type_on_machines"
  end

  create_table "operator_certifications", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "cert_id",           null: false
    t.datetime "validation_start"
    t.datetime "validation_expire"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id", "cert_id"], name: "idx_on_operator_certifications"
  end

  create_table "order_type_settings", force: :cascade do |t|
    t.string   "order_type",         null: false
    t.integer  "product_id"
    t.integer  "max_allowed_defect"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["order_type", "product_id"], name: "idx_wo_type_pt_on_wo_type_sets"
  end

  create_table "order_types", force: :cascade do |t|
    t.string   "order_type",  null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_code",                 null: false
    t.string   "description"
    t.string   "capacity"
    t.string   "customer_code"
    t.string   "customer_product_number"
    t.string   "customer_eng_rev"
    t.string   "customer_product_description"
    t.string   "customer_serial_number"
    t.string   "wafer_size"
    t.string   "leads"
    t.string   "form_factor"
    t.string   "nand_vendor"
    t.string   "nand_type"
    t.string   "product_machine_category"
    t.string   "product_tool_category"
    t.string   "product_component_category"
    t.boolean  "need_serial_label"
    t.string   "internal_serial_number"
    t.string   "external_ww_number"
    t.integer  "quantity_per_box"
    t.string   "panel_size"
    t.integer  "panel_quantity"
    t.integer  "tray_quantity_length"
    t.integer  "tray_quantity_width"
    t.integer  "tray_quantity"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["product_code"], name: "idx_product_code_on_products", unique: true
  end

  create_table "reject_codes", id: false, force: :cascade do |t|
    t.string "reject_code",  null: false
    t.string "reject_type"
    t.string "sap_location"
    t.index ["reject_code"], name: "idx_on_reject_codes", unique: true
  end

  create_table "release_reasons", force: :cascade do |t|
    t.string   "release_reason", null: false
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "staged_components", force: :cascade do |t|
    t.integer  "bom_id",                             null: false
    t.integer  "component_id",                       null: false
    t.string   "sap_batch"
    t.integer  "component_container_id"
    t.integer  "qty_staged",             default: 0
    t.datetime "stage_time"
    t.integer  "user_id",                            null: false
    t.string   "vendor"
    t.string   "vendor_lot"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["bom_id"], name: "idx_bom_id_on_stages"
    t.index ["component_container_id"], name: "idx_comp_container_on_stages"
    t.index ["component_id"], name: "idx_component_id_on_stages"
  end

  create_table "step_allocated_components", force: :cascade do |t|
    t.integer  "step_id",                null: false
    t.integer  "component_container_id", null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["step_id"], name: "idx_step_id_on_step_components"
  end

  create_table "step_allocated_machines", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.integer  "machine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "idx_step_id_on_step_machines"
  end

  create_table "step_allocated_tools", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.integer  "tool_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "idx_step_id_on_step_tools"
  end

  create_table "step_codes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "step_type"
    t.text     "notes"
    t.boolean  "for_inline_rework"
    t.boolean  "tray_generation",             default: false
    t.boolean  "tray_management",             default: false
    t.boolean  "machine_required",            default: false
    t.boolean  "can_auto_start_current_step", default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "step_hold_release_histories", force: :cascade do |t|
    t.integer  "step_id"
    t.string   "step_code_name"
    t.integer  "product_id"
    t.integer  "work_order_id"
    t.datetime "hold_time",                  null: false
    t.string   "hold_reason",                null: false
    t.string   "hold_reason_description",    null: false
    t.string   "hold_comment"
    t.datetime "release_time"
    t.string   "release_reason"
    t.string   "release_reason_description"
    t.string   "release_comment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["product_id"], name: "idx_product_id_on_shlh"
    t.index ["step_code_name"], name: "idx_step_code_name_on_shlh"
    t.index ["step_id"], name: "idx_step_id_on_shlh"
  end

  create_table "step_process_bin_codes", force: :cascade do |t|
    t.integer "step_process_bin_id", null: false
    t.string  "bin_code"
    t.index ["step_process_bin_id"], name: "idx_on_step_pcs_bin_codes"
  end

  create_table "step_process_bins", force: :cascade do |t|
    t.integer  "step_code_id", null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["step_code_id", "order_type", "product_id"], name: "idx_on_step_process_bins", unique: true
  end

  create_table "step_process_defect_codes", force: :cascade do |t|
    t.integer "step_process_defect_id", null: false
    t.string  "defect_code"
    t.index ["step_process_defect_id"], name: "idx_on_step_pcs_defect_codes"
  end

  create_table "step_process_defects", force: :cascade do |t|
    t.integer  "step_code_id", null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["step_code_id", "order_type", "product_id"], name: "idx_on_step_process_defects", unique: true
  end

  create_table "step_process_reject_codes", force: :cascade do |t|
    t.integer "step_process_reject_id", null: false
    t.string  "reject_code"
    t.index ["step_process_reject_id"], name: "idx_on_step_pcs_reject_codes"
  end

  create_table "step_process_rejects", force: :cascade do |t|
    t.integer  "step_code_id", null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["step_code_id", "order_type", "product_id"], name: "idx_on_step_process_rejects", unique: true
  end

  create_table "step_process_settings", force: :cascade do |t|
    t.integer  "step_code_id",                 null: false
    t.string   "order_type"
    t.integer  "product_id"
    t.integer  "same_unit_max_defect_allowed"
    t.integer  "future_rework_step_code_id"
    t.boolean  "req_first_article_inspection"
    t.integer  "unit_sample_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["step_code_id", "order_type", "product_id"], name: "idx_on_step_process_settings", unique: true
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "work_order_id"
    t.integer  "workflow_id"
    t.integer  "step_code_id",              null: false
    t.integer  "sequence"
    t.integer  "status",        default: 0, null: false
    t.integer  "units_count",   default: 0, null: false
    t.integer  "lots_count",    default: 0, null: false
    t.integer  "hold_count",    default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["step_code_id"], name: "idx_step_code_id_on_steps"
    t.index ["work_order_id"], name: "idx_work_order_id_on_steps"
    t.index ["workflow_id"], name: "idx_workflow_id_on_steps"
  end

  create_table "tool_histories", force: :cascade do |t|
    t.integer  "step_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "usage_time", null: false
    t.index ["step_id"], name: "idx_step_id_on_tool_histories"
  end

  create_table "tool_history_details", force: :cascade do |t|
    t.integer "tool_history_id", null: false
    t.integer "tool_id",         null: false
    t.index ["tool_history_id"], name: "idx_tool_history_id_on_details"
  end

  create_table "tool_mappings", force: :cascade do |t|
    t.integer  "step_code_id",                             null: false
    t.integer  "machine_type_id"
    t.string   "product_tool_category"
    t.integer  "tool_part_id",                             null: false
    t.boolean  "is_required_before_start", default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["step_code_id", "machine_type_id"], name: "idx_on_tool_mappings"
  end

  create_table "tool_parts", force: :cascade do |t|
    t.string   "tool_part",                     null: false
    t.string   "description"
    t.integer  "calibration_frequency_seconds"
    t.integer  "pm_frequency_seconds"
    t.integer  "life_seconds"
    t.integer  "tool_consume_limit"
    t.integer  "unit_consume_limit"
    t.string   "tool_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string   "tool_code"
    t.integer  "tool_part_id",                      null: false
    t.integer  "status",                default: 0
    t.datetime "last_calibration_time"
    t.datetime "next_calibration_time"
    t.datetime "last_pm_time"
    t.datetime "next_pm_time"
    t.datetime "life_start"
    t.datetime "life_expire"
    t.integer  "tool_processed_count"
    t.integer  "tool_processing_limit"
    t.integer  "unit_processed_count"
    t.integer  "unit_processing_limit"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["tool_part_id"], name: "idx_tool_part_id_on_tools"
  end

  create_table "trays", force: :cascade do |t|
    t.string   "tray_code",     null: false
    t.integer  "work_order_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tray_code"], name: "idx_tray_code_on_trays", unique: true
  end

  create_table "unit_basic_histories", force: :cascade do |t|
    t.integer  "unit_id"
    t.integer  "step_id"
    t.integer  "step_sequence"
    t.string   "step_code",            null: false
    t.string   "unit_sn"
    t.integer  "product_id"
    t.string   "product_code"
    t.integer  "work_order_id"
    t.string   "work_order_name"
    t.boolean  "is_rework"
    t.datetime "in_queue_time",        null: false
    t.datetime "start_process_time"
    t.string   "step_result"
    t.string   "reject_code"
    t.string   "defect_code"
    t.string   "failure_location"
    t.string   "frwk_defect_code"
    t.integer  "move_to_step_id"
    t.string   "move_to_step_code"
    t.datetime "move_time"
    t.integer  "start_user_id"
    t.integer  "component_history_id"
    t.integer  "machine_history_id"
    t.integer  "tool_history_id"
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "in_qty"
    t.integer  "out_qty"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["product_id"], name: "idx_pt_id_on_unit_histories"
    t.index ["step_id"], name: "idx_step_id_on_unit_histories"
    t.index ["unit_id"], name: "idx_unit_id_on_unit_histories"
    t.index ["unit_sn"], name: "idx_unit_sn_on_unit_histories"
    t.index ["work_order_id"], name: "idx_wo_id_on_unit_histories"
  end

  create_table "units", force: :cascade do |t|
    t.string   "unit_sn",                            null: false
    t.integer  "status",                 default: 0, null: false
    t.boolean  "sap_confirmed"
    t.string   "panel_number"
    t.string   "cavity_number"
    t.integer  "tray_id"
    t.string   "inner_box"
    t.string   "outer_box"
    t.string   "delivery_number"
    t.string   "delivery_line"
    t.integer  "work_order_id"
    t.integer  "step_id",                            null: false
    t.integer  "machine_id"
    t.integer  "last_routing_step_id",               null: false
    t.integer  "frwk_step_code_id"
    t.string   "frwk_defect_code"
    t.integer  "before_hold_status"
    t.integer  "hold_count",             default: 0
    t.integer  "total_defect_count",     default: 0
    t.string   "reject_code"
    t.string   "comment"
    t.integer  "product_id"
    t.integer  "basic_histories_count",  default: 0, null: false
    t.integer  "qty",                    default: 1, null: false
    t.string   "wwn"
    t.string   "customer_serial_number"
    t.integer  "created_user_id",                    null: false
    t.integer  "updated_user_id",                    null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["product_id"], name: "idx_product_id_on_units"
    t.index ["step_id"], name: "idx_step_id_on_units"
    t.index ["unit_sn"], name: "idx_unit_sn_on_units", unique: true
    t.index ["work_order_id"], name: "idx_work_order_id_on_units"
  end

  create_table "work_orders", force: :cascade do |t|
    t.string   "work_order_name"
    t.string   "order_type",                       null: false
    t.integer  "product_id",                       null: false
    t.integer  "order_qty"
    t.date     "released_date"
    t.date     "due_date"
    t.integer  "status",               default: 0
    t.string   "factory",                          null: false
    t.string   "customer_no"
    t.string   "packing_data"
    t.string   "front_panel_smt_line"
    t.string   "pack_panel_smt_line"
    t.string   "firmware"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["product_id"], name: "idx_product_id_on_work_orders"
  end

  create_table "workflows", force: :cascade do |t|
    t.string   "workflow_name", null: false
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["workflow_name"], name: "idx_on_workflows", unique: true
  end

end
