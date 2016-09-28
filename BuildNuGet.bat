echo off

echo Starting NuGet packaging...

cd NuGet
"nuget.exe" pack System.Data.Portable/System.Data.Portable.nuspec
cd..

echo Packaging complete