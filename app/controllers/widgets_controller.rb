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
    # render 'index'
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

    # render 'new'
  end

  def create
    # The only way this method could be called
    #  is if the user submitted a form to create a new Widget.
    #  So, we will have a params hash sent here from the View

    # params: {widget: {name: "x", quantity: y}}

    # With this data, we are all set to create the new record in our DB:
    created_widget = Widget.create(params.require(:widget).permit(:name, :quantity))
      # And that's all!

    # Now that the task is done, we need to render a view to the user
    #  but there is no view page associated with thei method.
    #  So we will redirect to another route (and call the method) of our choosing.
    redirect_to widget_path(created_widget.id)
      # If your look at the routes.rb file, you'll see that
      #  'widget_path' is the shortcut for "GET '/widgets/:id'"
      #   (which calls "widgets#show").
      #  The 'created_widget.id' in parenthesis is the argument passed to the route
      #   and will become the ':id'.
      #    So if created_widget's ID is 11, the route that is being called is:
      #     '/widgets/11'
  end

  def show
    # Since the route to get here is 'widgets/:id', with ':id' being a variable,
    #  we have likely passed in a model ID to serve as ':id'.
    widget_id = params[:id]

    #  This is the ID we will be using to look up and retrieve in our Model,
    #   and pass to the view ('show.html.erb') as the following instance variable:
    @widget = Widget.find_by(id: widget_id)

    # Once again, no need to explicitly tell Rails to render a view.
    #  It knows to look for 'show.html.erb'
    
    # render 'show'
  end

  def edit
    # Just like the 'show' method, we have in our route the ID
    #  of the DB record we want to look up:
    widget_id = params[:id]

    # After that, it's simply a matter of passing an instance variable
    #  for our form to work with, JUST LIKE THE 'NEW' METHOD.
    @widget = Widget.find_by(id: widget_id)

    # As always, no need to explicitly render the 'edit.html.erb' view
    # render 'edit'
  end

  def update
    # This method should only be called when we are routed
    #  from the 'edit.html.erb' page after a form submission.

    # This method functions just like the 'create' method,
    #  only instead of creating a new record, we are finding the existing one
    #  and updating it

    # find the ID
    widget_id = params[:id]

    # look up the correct record
    widget_to_update = Widget.find_by(widget_id)

    # update that record in the DB
    widget_to_update.update_attributes(params.require(:widget).permit(:name, :quantity))

    # And since this method is for back-end only, we reroute to another method
    #  that will render a view to the user.
    redirect_to widgets_path # which is the 'index' method --> index.html.erb

  end

  def destroy
    # Much like the 'show' method, all we need for this method is an ID
    #  that is included in the route (and hence the params)
    widget_id = params[:id]

    # Then we look up the record that we want to delete:
    widget_to_delete = Widget.find_by(id: widget_id)

    # And then it's as easy as calling a simple Rails method:
    widget_to_delete.destroy
      # That's it!

    # All that's left is to redirect to another route/method,
    #  since this method is for back-end only
    redirect_to widgets_path
  end

  def bar
    render 'foobar'
  end

end