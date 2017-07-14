require 'bundler'
Bundler.require

conn = PGconn.open(dbname: 'cars')

get '/volvo' do
	content_type :json
	res = conn.exec('SELECT id, year, make, model FROM volvo;')
	volvo = []
	res.each do |car|
		volvo.push(car)
	end
	volvo.to_json
end

get '/volvo/:id' do
	id = params[:id]
	res = conn.exec("SELECT id, year, make, model FROM volvo WHERE id = #{id};")
	volvo = res[0]
	volvo.to_json
end

post '/volvo' do
	new_volvo = JSON.parse(request.body.read)
	year = new_volvo['year']
	make = new_volvo['make']
	model = new_volvo['model']
	conn.exec("INSERT INTO volvo (year, make, model) VALUES ('#{year}','#{make}','#{model}');")
	"Success!"
end

patch '/volvo/:id' do
	id = params['id']
	updated_volvo = JSON.parse(request.body.read)
	year = updated_volvo['year']
	make = updated_volvo['make']
	model = updated_volvo['model']
	conn.exec("UPDATE volvo SET year = '#{year}', make = '#{make}', model = '#{model}' WHERE id = #{id};")
	"Success!"
end

delete '/volvo/:id' do
	id = params['id']
	conn.exec("DELETE FROM volvo WHERE id = #{id};")
	"Success!"
end







get '/sedans' do
	content_type :json
	res = conn.exec('SELECT id, mileage, color, trans, volvo_id FROM sedans;')
	sedans = []
	res.each do |car|
		sedans.push(car)
	end
	sedans.to_json
end

get '/sedans/:id' do
	id = params[:id]
	res = conn.exec("SELECT id, mileage, color, trans, volvo_id FROM sedans WHERE id = #{id};")
	sedans = res[0]
	sedans.to_json
end

post '/sedans' do
	new_sedans = JSON.parse(request.body.read)
	mileage = new_sedans['mileage']
	color = new_sedans['color']
	trans = new_sedans['trans']
	volvo_id = new_sedans['volvo_id']
	conn.exec("INSERT INTO sedans (mileage, color, trans, volvo_id) VALUES ('#{mileage}','#{color}','#{trans}','#{volvo_id}');")
	"Success!"
end

patch '/sedans/:id' do
	id = params['id']
	updated_sedans = JSON.parse(request.body.read)
	mileage = updated_sedans['mileage']
	color = updated_sedans['color']
	trans = updated_sedans['trans']
	volvo_id = updated_sedans['volvo_id']
	conn.exec("UPDATE sedans SET mileage = '#{mileage}', color = '#{color}', trans = '#{trans}', volvo_id = '#{volvo_id}' WHERE id = #{id};")
	"Success!"
end

delete '/sedans/:id' do
	id = params['id']
	conn.exec("DELETE FROM sedans WHERE id = #{id};")
	"Success!"
end

