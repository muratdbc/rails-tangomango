class HomeController < ApplicationController
  def index

    Date.today.beginning_of_week.upto(Date.today.end_of_week) do |date|
    day=date.strftime('%A')
    instance_variable_set("@#{date.strftime('%A').downcase}", Event.where(:date=>date.to_s))
    end

    Date.today.next_week.upto(Date.today.next_week.end_of_week) do |date|
    day=date.strftime('%A')
    instance_variable_set("@next#{date.strftime('%A').downcase}", Event.where(:date=>date.to_s))
    end
    @firstWeek=Date.today.beginning_of_week
    @secondWeek=Date.today.next_week
    render :welcome
  end
end