ActiveAdmin.register_page "Dashboard" do

  # menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
  #   div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #     span :class => "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Users" do
            table_for User.order("created_at desc").limit(15) do
                column :name do |user|
                    link_to user.name, admin_user_path(user)
                end
                column :email
                column :created_at
            end
        end
        strong { link_to "View All Users", admin_users_path}
      end
    end

    columns do
      column do
        panel "Recent Notebooks" do
            table_for Notebook.order("created_at desc").limit(15) do
                column :title do |notebook|
                    link_to notebook.title, admin_notebook_path(notebook)
                end
                column :user
                column :created_at
            end
        end
        strong { link_to "View All Notebooks", admin_notebooks_path}
      end
    end


  end # content
end
