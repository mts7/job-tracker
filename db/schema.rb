# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_17_210949) do

  create_table "applications", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.integer "communication_id", null: false
    t.datetime "deadline"
    t.datetime "applied_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["communication_id"], name: "index_applications_on_communication_id"
    t.index ["resume_id"], name: "index_applications_on_resume_id"
  end

  create_table "communication_contacts", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "communication_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["communication_id"], name: "index_communication_contacts_on_communication_id"
    t.index ["contact_id"], name: "index_communication_contacts_on_contact_id"
  end

  create_table "communication_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "communication_reasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "communications", force: :cascade do |t|
    t.boolean "contact_initiated"
    t.datetime "contacted_at"
    t.integer "job_id", null: false
    t.integer "communication_reason_id", null: false
    t.text "notes"
    t.integer "communication_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["communication_method_id"], name: "index_communications_on_communication_method_id"
    t.index ["communication_reason_id"], name: "index_communications_on_communication_reason_id"
    t.index ["job_id"], name: "index_communications_on_job_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "headquarters"
    t.integer "industry_id", null: false
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "contact_positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "company_id", null: false
    t.string "job_title"
    t.integer "contact_position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
    t.index ["contact_position_id"], name: "index_contacts_on_contact_position_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_technologies", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "technology_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_job_technologies_on_job_id"
    t.index ["technology_id"], name: "index_job_technologies_on_technology_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.integer "company_id", null: false
    t.string "description_link"
    t.decimal "salary_low"
    t.decimal "salary_high"
    t.decimal "pto_days"
    t.boolean "remote"
    t.datetime "listed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "title"
    t.integer "version"
    t.string "location"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "applications", "communications"
  add_foreign_key "applications", "resumes"
  add_foreign_key "communication_contacts", "communications"
  add_foreign_key "communication_contacts", "contacts"
  add_foreign_key "communications", "communication_methods"
  add_foreign_key "communications", "communication_reasons"
  add_foreign_key "communications", "jobs"
  add_foreign_key "companies", "industries"
  add_foreign_key "contacts", "companies"
  add_foreign_key "contacts", "contact_positions"
  add_foreign_key "job_technologies", "jobs"
  add_foreign_key "job_technologies", "technologies"
  add_foreign_key "jobs", "companies"
end
