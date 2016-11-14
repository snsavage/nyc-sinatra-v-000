class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
  
  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    figure.save

    redirect to "/figures"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    figure.save

    redirect to "/figures/#{figure.id}"
  end
end
