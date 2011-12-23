Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "footer",
                     :replace => "#footer-left",
                     :text => "<h4>Questions?</h4><p>Please Contact the Webstore TEST <%= mail_to 'sean@tfh.org?subject=Webstore Inquiry', 'Admin' %></p>",
                     :disabled => false
)
