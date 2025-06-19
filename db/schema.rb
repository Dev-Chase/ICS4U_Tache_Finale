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

ActiveRecord::Schema[7.2].define(version: 2025_06_19_035807) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "amis", force: :cascade do |t|
    t.integer "utilisateur_1_id", null: false
    t.integer "utilisateur_2_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utilisateur_1_id"], name: "index_amis_on_utilisateur_1_id"
    t.index ["utilisateur_2_id"], name: "index_amis_on_utilisateur_2_id"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.integer "publication_id", null: false
    t.text "contenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_commentaires_on_publication_id"
    t.index ["utilisateur_id"], name: "index_commentaires_on_utilisateur_id"
  end

  create_table "enregistres", force: :cascade do |t|
    t.integer "utilisateur_dossier_id", null: false
    t.integer "publication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_enregistres_on_publication_id"
    t.index ["utilisateur_dossier_id"], name: "index_enregistres_on_utilisateur_dossier_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.integer "publication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_likes_on_publication_id"
    t.index ["utilisateur_id"], name: "index_likes_on_utilisateur_id"
  end

  create_table "publications", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utilisateur_id"], name: "index_publications_on_utilisateur_id"
  end

  create_table "signalements", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.integer "publication_id"
    t.text "raison"
    t.string "etat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_signalements_on_publication_id"
    t.index ["utilisateur_id"], name: "index_signalements_on_utilisateur_id"
  end

  create_table "utilisateur_dossiers", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utilisateur_id"], name: "index_utilisateur_dossiers_on_utilisateur_id"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "surnom"
    t.string "prenom"
    t.integer "age"
    t.string "email", default: "", null: false
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_utilisateurs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_utilisateurs_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "amis", "utilisateurs", column: "utilisateur_1_id"
  add_foreign_key "amis", "utilisateurs", column: "utilisateur_2_id"
  add_foreign_key "commentaires", "publications"
  add_foreign_key "commentaires", "utilisateurs"
  add_foreign_key "enregistres", "publications"
  add_foreign_key "enregistres", "utilisateur_dossiers"
  add_foreign_key "likes", "publications"
  add_foreign_key "likes", "utilisateurs"
  add_foreign_key "publications", "utilisateurs"
  add_foreign_key "signalements", "publications"
  add_foreign_key "signalements", "utilisateurs"
  add_foreign_key "utilisateur_dossiers", "utilisateurs"
end
