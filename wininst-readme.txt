Инструкция по сборке проекта инсталлятора:

1. Установить CMake.
2. 
	2.1. Сборка с помощью утилиты CMake(cmake-gui)
	
		Запускаем программу CMake(cmake-gui).
		В строке "Where is the source code" указываем путь до папки с корневым скриптом cmake.
		В строке "Where to build the binaries" указываем путь до папки куда хотим чтобы CMake нам сгенерил .sln файл.
		Нажимаем кнопку "Configure".
		Нажимаем кнопку "Generate".
		На выходе в папке "Where to build the binaries" получаем сгенерированный .sln файл.
	
	2.2. Сборка с помощью командной строки.
	
		В командной строке переходим в папку куда необходимо сгенерировать .sln файл.
		Из этого расположения выполняем команду cmake -G Visual Studio 15 2017 "path_To_Root_CMake_Script"
		На выходе в директории откуда выполнялась команда получаем сгенерированный .sln файл.

Должен быть установлен WiX и должна быть установлена переменная WIX_DIR в path до wix

3. Сборка сгенерированного .sln файла

	Запустить MSBuild и указать ему путь до сгенерированного .sln файла
	
4. Настраиваемые параметры CMake скрипта:

	Все настраиваемые параметры находятся в корневом Cmake скрипте:

		ProductName = "TarantoolODBCDriver" - имя продукта, отображается в списке программы и компоненты.
		ProductVersion = "1.0.1.0" - версия продукта, отображается в списке программы и компоненты.
		Manufacturer = "Mail.ru" - имя произвоителя
		SearchMsiResoursesPath = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverInstaller/" - путь до ресурсов для msi файла. По данному пути должна лежать папка Resourсes с необходимыми для работы драйвера dll в папках "x86" и "x64" соответственно.
		SearchBootstrapperResoursesPath = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverBootstrapper/" - путь до ресурсов bootstrapper. По данному пути должна лежать папка Resourсes с необходимыми для bootstrapper файлами.
		LanguageBuild = "EN" - язык установщика. Допустимые значения: "RU", "EN".
		Driver64bitSourcePath = "${CMAKE_CURRENT_SOURCE_DIR}/DriverSource" - путь до файла 64-разрядного драйвера.
		Driver32bitSourcePath = "${CMAKE_CURRENT_SOURCE_DIR}/DriverSource" - путь до файла 32-разрядного драйвера.
		Driver64bitFilename = "64.tnt_odbc.dll" - имя файла 64-разрядного драйвера.
		Driver32bitFilename = "32.tnt_odbc.dll" - имя файла 32-разрядного драйвера.
		BitmapSourcePath = "${CMAKE_CURRENT_SOURCE_DIR}/BitmapSource" - путь до директории с bitmap для инсиаллятора
		BannerBitmapFilename = "bannrbmp_tarantool.bmp" - имя файла bitmap баннера (полоса сверху).
		DialogBitmapFilename = "dlgbmp_tarantool.bmp" -  имя файла bitmap диалога (картинка слева в диалогах).
		AddRemoveProgramsIconFilename = "tarantool_icon.ico" -  имя файла ico программы (отображается в программах и компонентах).
		LicenseSourcePath = "${CMAKE_CURRENT_SOURCE_DIR}/LicenseSource" - путь до директории с лицензионными соглашениями.
		LicenseFileRu = "bsd_license_Ru.rtf" - имя файла лицензионного соглашения на русском языке.
		LicenseFileEn = "bsd_license_En.rtf" - имя файла лицензионного соглашения на английском языке.
		
		TempFilesPathFor64bit = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverInstaller/obj/x64/" - путь для временных файлов сборки msi x64.
		TempFilesPathFor32bit = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverInstaller/obj/x32/" - путь для временных файлов сборки msi x32.
		MsiOutputPathFor64bit = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverInstaller/bin/x64" - путь для msi x64.
		MsiOutputPathFor32bit = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverInstaller/bin/x32" - путь для msi x32.
		MsiNameFor64bit = "TarantoolODBCDriverInstaller_x64.msi" - имя файла msi x64.
		MsiNameFor32bit = "TarantoolODBCDriverInstaller_x86.msi" - имя файла msi x32.
		
		TempFilePathForBootstrapper = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverBootstrapper/obj/" - путь для временных файлов сборки выходного файла.
		BootstrapperApplicationPath = "${CMAKE_CURRENT_SOURCE_DIR}/TarantoolODBCDriverBootstrapper/bin" - путь до папки выходного файла.
		BootstrapperApplicationName = "TarantoolSetup.exe" - имя выходного файла.
.
