class Ship
	attr_accessor :name, :water_out, :zagr

	def initialize name, water_out, kind = "unknown"
		@name = name || ''
		@water_out = water_out || 0
    @zagr = false
    @kind = kind
	end
	def zagruzka weight 
		count = 0
		while count < weight
			@water_out += 10
			puts water_out
			count += 10
			sleep(1)
		end
		@zagr = true
	end
	def razgruzka
		@zagr = false
	end  
	def state
		if(zagr) then "загружен" else "не загружен" end
	end
end
class Port
	attr_accessor :name, :ships
	def initialize name
		@name = name
		@ships = []
	end
	def priem ship
        @ships << ship
	end
	def otpravka ship
        @ships.delete ship
	end
	def print_ships 
		@ships.each do |ship|
			puts ship.name
		end
	end
end
ship = Ship.new("avrora", 100, "G")
ship2 = Ship.new("avrora2", 100, "P")
ship3 = Ship.new("avrora3", 100)
port = Port.new("artur")
p ship
p ship2
p ship3
# port.priem(ship)
# port.priem(ship2)
# port.priem(ship2)
# port.priem(ship2)
# port.print_ships
# puts "*************"
# port.otpravka(ship2)
# port.print_ships


# ДЗ Раздели корабли на пассажирские и грузовые
# у пасажирских вместимость пасажиров, а у грузовых грузы 
# В порту ограничить места, для кораблей, если мы добавляем корабль и порт перегружен, ругаемся
# В корабли добавим свойство Порт, должен храниться объект порт
# Создать репозиторий на гит хабе
# каждое задание отдельным коммитом
# Наследование: грузовой и пассажирский.
