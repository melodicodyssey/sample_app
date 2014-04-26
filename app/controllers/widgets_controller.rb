class WidgetsController < ApplicationController

  def index
    # Since the Controller can communicate with the Model,
    #  we can collect all the rows within our 'Widgets' table
    #  and wrap them all into an array, 
    #  to be passed into whatever view we tell this method to render:
    @all_widgets = Widget.all
      # Assuming no changes have been made to the Model,
      # the current contents of'db/seeds.rb' 
      # reflect the ActiveRecord objects that are being collected into @all_widgets

    # If we want this method to render 'index.html.erb',
    #  we don't even need to explicitly say it here,
    #  since Rails will assume that, at the end of the function,
    #  we intend to render a view page of the same name as this method.
    #    i.e. for the "bar" method at the bottom of this file,
    #    Rails will actually try to find a 'bar.html.erb' to render
    #    unless we tell it otherwise

    # If I did want to explicitly redirect from this method, I would put:
    # redirect_to widgets_path
  end

  def new
    # In order to use the "form_for" type of form,
    #  we will be sending 'new.html.erb' the following variable,
    #  which is basically just a new, empty record in our Widgets model:
    @new_widget = Widget.new
      # The different between 'Widget.new' and 'Widget.create' is
      #  that '.new' will create a new record,
      #  but it will not actually be saved to the DB until '.create' is called,
      #  which is what we will do in the 'create' method below.

    # Again, no need to explicity tell Rails to render 'new.html.erb',
    #  since it will look for it automatically.

    # redirect_to new_widget_path
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def bar
  end

end