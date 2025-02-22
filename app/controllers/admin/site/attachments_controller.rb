class Admin::Site::AttachmentsController < Admin::SitesController
  def destroy
    authorize(current_site)
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    redirect_to edit_admin_site_path
  end
end
