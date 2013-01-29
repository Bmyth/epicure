class MainController < ApplicationController
  def index
    # init
    @current_restaurant = session[:current_restaurant]
    @team = Team.find :last
  end

  def edit
    @team = Team.find :last
  end

  def reset
    team = Team.find :last
    i = 1

    team.restaurants.each do |c|
      pname = "name" + i.to_s
      prate = "rate" + i.to_s
      r = {"name" => params[pname], "rate" => params[prate]}
      c.update_attributes(r)
      i += 1
    end

    redirect_to "/"
  end

  def rated
    team = Team.find :last
    rest_name = team.currentRestaurants.find :last
    @rest = team.restaurants.find_by_name(rest_name.name)
    r = @rest.rates.create!
    r.point = params[:point]
    r.save

    sum = 0
    times = 0
    @rest.rates.each do |c|
      sum += c.point
      times += 1
    end

    new_rate = (sum + r.point)/(times + 1)
    @rest.rate = new_rate
    @rest.save
    redirect_to "/"
  end

  def rate
    @team = Team.find :last
    @current_restaurant = @team.currentRestaurants.find :last
  end

  def pick
    team = Team.find :last
    all = 0
    team.restaurants.each do |c|
      all += c.rate
    end
    result = Random.rand(0...all)

    sum = 0
    team.restaurants.each do |c|
      sum += c.rate
      if(sum >= result)
        cr = team.currentRestaurants.create!
        cr.name = c.name
        cr.save
        session[:current_restaurant] = c.name
        break
      end
    end
    redirect_to "/"
  end

  def init
      team = Team.create!
      team.name = "Drupal"
      r = team.restaurants.create!
      r.name = "KFC"
      r.rate = 5
      rp = r.rates.create!
      rp.point = r.rate
      rp.save
      r.save


    i = 11

    loop{
      if i == 0
        break
      else
        r = team.restaurants.create!
        r.name = "none"
        r.rate = 5
        rp = r.rates.create!
        rp.point = r.rate
        rp.save
        r.save

        i = i - 1
      end
    }
    team.save

    redirect_to "/"
  end
end
