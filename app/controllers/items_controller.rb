class ItemsController < ApplicationController
  def create
		new_items = []
		flash[:notice] = ""
		flash[:alert] = ""
		3.times do |i|
			item = Item.new
			item.name = params[:item]["name-#{i+1}"]
			item.user = current_user
			new_items << item if item.name && item.name != ""
		end
		new_items.each { |item| save_item(item) }
		flash[:notice] = nil if flash[:notice] == ""
		flash[:alert] = nil if flash[:alert] == ""
		redirect_to current_user
  end
	
	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
			flash[:notice] = "#{@item.name} completed!"
		else
			flash[:alert] = "Error marking #{@item} completed. Please try again!"
		end
		
		respond_to do |format|
			format.html { redirect_to @item.user }
			format.js
		end
	end
	
	private
	
	def save_item(item)
		if item.save
			flash[:notice] += "Created new to-do item: #{item.name}.<br>"
		else
			flash[:alert] += "Error creating new to-do item: #{item.name}.\nPlease try again!]<br>"
		end
	end
end
