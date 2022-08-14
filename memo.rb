class Memo < Post
  
  # Отдельный конструктор здесь не нужен, т. к. у заметки нет дополнительных
  # переменных экземпляра.
  
  # Напишем реализацию метода read_from_console для экземпляра земетки. Он
  # спрашивает у пользователя текст заметки все строки (до слова end) и
  # записывает их в переменную экземпляра, массив @text.
  def read_from_console
  	puts "Новая заметка (всё, что пишите до строчки \"end\"):"
    
    # Для старта цикла запишем в переменную line nil
    line = nil
    
    # Пока в переменной line не окажется (пока пользователь не введёт) слово
    # <<end>>, крутимся в цикле и считываем строку за стрококой в массив @text.
    while line != "end" do
      line = STDIN.gets.chomp

      # Напомню, что изначально в переменной @text у нас пустой массив (смотрите 
      # конструктор класса - родителя Post).
      @text << line
    end
    
    # Удалим последний элемент из массива @text - там служебное слово <<end>>
    # которое мы не хотим видеть в нашей заметке.
    @text.pop
  end
  
  # Метод to_string должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей заметки: помимо всех строк массива @text (тела
  # заметки) мы положим туда строку с датой создания заметки.
  def to_strings
    # Сгенерируем строку с датой создания заметки используя объект класса Time
    # который у нас находиться в переменной @created_at (смотрите конструктор
    # класса родителя Post).
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    # Возвращаем массив @text с добавлением в начало (методом массива unshift)
    # строчки с датой создания заметки.
    @text.unshift(time_string)
  end
end
