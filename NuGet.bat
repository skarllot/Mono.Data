echo off

echo Copying assemblies into directories


echo Copying System.Data PCL assemblies...
mkdir "NuGet\System.Data.Portable\lib\portable-net4+sl5+wp8+win+MonoAndroid+MonoTouch+XamariniOS"
copy "Output\Release\Portable\AnyCPU\System.Transactions.Portable.dll"				"NuGet\System.Data.Portable\lib\portable-net4+sl5+wp8+win+MonoAndroid+MonoTouch+XamariniOS\*.*"
copy "Output\Release\Portable\AnyCPU\System.Data.Portable.dll"						"NuGet\System.Data.Portable\lib\portable-net4+sl5+wp8+win+MonoAndroid+MonoTouch+XamariniOS\*.*"

echo Copying System.Data Windows Phone 8 assemblies...
mkdir "NuGet\System.Data.Portable\lib\wp8"
copy "Output\Release\WindowsPhone8\AnyCPU\System.Transactions.Portable.dll"			"NuGet\System.Data.Portable\lib\wp8\*.*"
copy "Output\Release\WindowsPhone8\AnyCPU\System.Data.Portable.dll"					"NuGet\System.Data.Portable\lib\wp8\*.*"

echo Copying System.Data Windows Store assemblies...
mkdir "NuGet\System.Data.Portable\lib\netcore"
copy "Output\Release\WindowsStore\AnyCPU\System.Transactions.Portable.dll"			"NuGet\System.Data.Portable\lib\netcore\*.*"
copy "Output\Release\WindowsStore\AnyCPU\System.Data.Portable.dll"					"NuGet\System.Data.Portable\lib\netcore\*.*"

echo Copying System.Data Silverlight 5 assemblies...
mkdir "NuGet\System.Data.Portable\lib\sl5"
copy "Output\Release\Silverlight5\AnyCPU\System.Transactions.Portable.dll"			"NuGet\System.Data.Portable\lib\sl5\*.*"
copy "Output\Release\Silverlight5\AnyCPU\System.Data.Portable.dll"					"NuGet\System.Data.Portable\lib\sl5\*.*"

echo Copying System.Data Android assemblies...
mkdir "NuGet\System.Data.Portable\lib\MonoAndroid"
copy "Output\Release\Android\AnyCPU\System.Transactions.Portable.dll"				"NuGet\System.Data.Portable\lib\MonoAndroid\*.*"
copy "Output\Release\Android\AnyCPU\System.Data.Portable.dll"						"NuGet\System.Data.Portable\lib\MonoAndroid\*.*"

echo Copying System.Data iOS assemblies...
mkdir "NuGet\System.Data.Portable\lib\MonoTouch"
copy "Output\Release\iOS\AnyCPU\System.Transactions.Portable.dll"					"NuGet\System.Data.Portable\lib\MonoTouch\*.*"
copy "Output\Release\iOS\AnyCPU\System.Data.Portable.dll"							"NuGet\System.Data.Portable\lib\MonoTouch\*.*"

echo Copying System.Data iOS Unified assemblies...
mkdir "NuGet\System.Data.Portable\lib\XamariniOS"
copy "Output\Release\iOSUnified\AnyCPU\System.Transactions.Portable.dll"			"NuGet\System.Data.Portable\lib\XamariniOS\*.*"
copy "Output\Release\iOSUnified\AnyCPU\System.Data.Portable.dll"					"NuGet\System.Data.Portable\lib\XamariniOS\*.*"

echo Copying System.Data Desktop assemblies...
mkdir "NuGet\System.Data.Portable\lib\net4"
copy "Output\Release\Desktop\AnyCPU\System.Transactions.Portable.dll"				"NuGet\System.Data.Portable\lib\net4\*.*"
copy "Output\Release\Desktop\AnyCPU\System.Data.Portable.dll"						"NuGet\System.Data.Portable\lib\net4\*.*"



echo Copy complete. Starting NuGet packaging...

cd NuGet
"nuget.exe" pack System.Data.Portable/System.Data.Portable.nuspec
cd..

echo Packaging complete