Rails.application.routes.draw do
  # This line mounts Cloud-MES's routes at the root of your application.
  # This means, any requests to URLs such as /modeler/factories, will go to Mes::Modeler::FactoriesController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  mount Mes::Modeler::Engine, :at => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
