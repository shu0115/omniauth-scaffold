  match "/auth/:provider/callback" => "sessions#callback"
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout
