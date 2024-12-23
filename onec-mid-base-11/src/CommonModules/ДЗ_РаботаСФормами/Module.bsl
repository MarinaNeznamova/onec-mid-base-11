
#Область ПрограммныйИнтерфейс


Процедура ДополнитьФорму(Форма) Экспорт
  ИмяФормы = Форма.ИмяФормы;
  Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
	 ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	 ДобавитьСкидкуВГруппаШапкаЛево(Форма);	
  ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
	 ВставитьПолеКонтактноеЛицоПередСуммаДокумента(Форма); 
  ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
	 ВставитьПолеКонтактноеЛицоПередСуммаДокумента(Форма); 
  ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
	 ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
  ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
	 ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
  КонецЕсли;

КонецПроцедуры  
#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо";
КонецПроцедуры 

Процедура ВставитьПолеКонтактноеЛицоПередСуммаДокумента(Форма)
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), ,Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо";
КонецПроцедуры 

Процедура ДобавитьСкидкуВГруппаШапкаЛево(Форма)  
	Группа = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево); 
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Группа);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_СогласованнаяСкидка";  
	ПолеВвода.УстановитьДействие("ПриИзменении", "ДЗ_СогласованнаяСкидкаПриИзменении");
	
	Команда = Форма.Команды.Добавить("Пересчитать");
	Команда.Заголовок =  "Пересчитать";
	Команда.Действие = "ДЗ_Пересчитать";
	
	КнопкаФормы = Форма.Элементы.Добавить("ДЗ_Пересчитать", Тип("КнопкаФормы"), Группа);  
	КнопкаФормы.ИмяКоманды = "Пересчитать"; 
	КнопкаФормы.Картинка = БиблиотекаКартинок.Обновить;
	КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;

КонецПроцедуры 

#КонецОбласти

