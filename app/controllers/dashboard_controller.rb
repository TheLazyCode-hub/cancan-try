class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_verifier_or_authorizer!

    def index
        # Load the posts awaiting verification or authorization
        @pending_approvals = Approval.where(status: "pending", approvable_type: 'Post')
        @authorize_approvals = Approval.where(status: "pending", approvable_type: 'Post')
    end


    def verify
        @post = Post.find(params[:id]) 
        pending_approvals = Approval.where(approvable_id:  @post.id)
        redirect_to @post, notice: 'Post was Verified.'
        # pending_approvals.update(staus: "verified")

        # if @post.update(post_approval_status: :approved)
        #   redirect_to @post, notice: 'Post was approved.'
        # else
        #   redirect_to @post, alert: 'Post could not be approved.'
        # end
    end

    def authorize
        @post = Post.find(params[:id]) 
        authorize_approvals = Approval.where(approvable_id:  @post.id)
        redirect_to @post, notice: 'Post was Authorized.'
        # pending_approvals.update(staus: "authorized")

        # if @post.update(post_approval_status: :approved)
        #   redirect_to @post, notice: 'Post was approved.'
        # else
        #   redirect_to @post, alert: 'Post could not be approved.'
        # end
    end
    private

    def authorize_verifier_or_authorizer!
        unless current_user.roles.exists?(name: "verifier") || current_user.roles.exists?(name: "authorizer")
        redirect_to root_path, alert: 'You are not authorized to access this page'
        end
    end

end
