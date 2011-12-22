Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "logo",
                     :replace => "#logo",
                     :text => "<div id='logo'><a href='/'></a></div>",
                     :disabled => false)