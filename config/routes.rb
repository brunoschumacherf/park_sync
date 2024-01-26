Rails.application.routes.draw do
  post 'parkings', to: 'parkings#create'
  put 'parkings/:id/out', to: 'parkings#out'
  put 'parkings/:id/pay', to: 'parkings#pay'
  get 'parkings/:plate', to: 'parkings#list'
end
