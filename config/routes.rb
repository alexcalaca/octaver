# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#               instruments GET    /instruments(.:format)                                                                   instruments#index
#                           POST   /instruments(.:format)                                                                   instruments#create
#            new_instrument GET    /instruments/new(.:format)                                                               instruments#new
#           edit_instrument GET    /instruments/:id/edit(.:format)                                                          instruments#edit
#                instrument GET    /instruments/:id(.:format)                                                               instruments#show
#                           PATCH  /instruments/:id(.:format)                                                               instruments#update
#                           PUT    /instruments/:id(.:format)                                                               instruments#update
#                           DELETE /instruments/:id(.:format)                                                               instruments#destroy
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         registrations#update
#                           PUT    /users(.:format)                                                                         registrations#update
#                           DELETE /users(.:format)                                                                         registrations#destroy
#                           POST   /users(.:format)                                                                         registrations#create
#                      root GET    /                                                                                        instruments#index
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :carts
  resources :instruments
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
  root 'instruments#index'  
end
