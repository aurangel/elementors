## Elementors-ARM

[![Build Status](https://travis-ci.org/Exoticness/Elementors-arm.svg?branch=master)](https://travis-ci.org/Exoticness/Elementors-arm) [![License](https://poser.pugx.org/elementors/elementors/license.svg)](https://packagist.org/packages/elementors/elementors) [![Latest Unstable Version](https://poser.pugx.org/elementors/elementors/v/unstable.svg)](https://packagist.org/packages/elementors/elementors) 

> Программа носит характер автоматизированного рабочего места (АРМ) председателя цикловой комиссии. В разработанном приложении предусмотрена возможность редактирования старых отчетов и формирования новых, организация и поддержка самостоятельной базы данных. На основе хранящейся в базе данных информации о преподавателях, дисциплинах, рейтинговых оценках этими данными легко оперировать.

## Требуется .NET Framework 4!

Приложение разработано в Visual Studio 2013 с использованием библиотек DevExpress 14.1.8. Для полного функционирования разархивируйте help.zip (веб-справка) и sqlite_app.zip (SQLite дизайнер) в `../bin/Release`.

## Standalone installer

Также имеется возможность создать индивидуальный альтернативный (автономный) установочный файл. Его исходники расположены в `../Extras/Inno Script/` и снабжены комментариями. Для удачной компиляции потребуется **Inno Setup 5.5.1 Unicode & Inno Setup Compiler 5.5.1**.

## Библиотеки:

- DevExpress 14.1.8 .NET UI Controls

- SQLite 3
