class ShowInfoController < ApplicationController
    def index
        @repos  = []
        commits = []
        
        repositorios = Github.repos.list user: 'denilsonrc'
        repositorios.map{ |repositorio|
            git_commits = Github.repos.commits.all 'denilsonrc', repositorio.name
            git_commits.map{ |commit|
                commits << {
                    :nome_author => commit.commit.committer.name,
                    :email_author => commit.commit.committer.email,
                    :data_commit => commit.commit.committer.date,
                    :commit_message => commit.commit.message
                }
            }
            @repos << {:nome_repo => repositorio.full_name, :descricao => repositorio.description, :commits => commits}
            commits = []
        }
    end
end
