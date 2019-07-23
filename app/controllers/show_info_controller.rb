class ShowInfoController < ApplicationController
    def index
        @repositories = Repository.all
    end

    def atualizar_lista_de_repositorios
        Github.repos.list user: 'denilsonrc' do |repositorio|
            repository = Repository.where(full_name: repositorio.full_name).last
            if repository.nil?
                repository = Repository.new(name:        repositorio.name,
                                            full_name:   repositorio.full_name,
                                            description: repositorio.description)
                repository.save
            end
            Github.repos.commits.all 'denilsonrc', repositorio.name do |commit|
                if Commit.where(sha: commit.sha).empty?
            
                    Commit.create(sha:           commit.sha, 
                                  author:        commit.commit.committer.name,
                                  email:         commit.commit.committer.email,
                                  date:          commit.commit.committer.date,
                                  message:       commit.commit.message,
                                  repository_id: repository.id )
            
                end
            end
        end
        redirect_to root_path
    end
end
