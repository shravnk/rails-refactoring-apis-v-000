class RepositoriesController < ApplicationController
  def index
  	token_hash = {}
  	token_hash['access_token'] = session[:token]
  	github = GithubService.new(token_hash)
  	@repos_array = github.get_repos
  end

  def create
  	token_hash = {}
  	token_hash['access_token'] = session[:token]
  	github = GithubService.new(token_hash)
  	github.create_repo(params[:name])
  	redirect_to root_path
  end
end
