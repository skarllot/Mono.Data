echo off

echo Starting NuGet packaging...

cd NuGet
"nuget.exe" pack Mono.Data.Portable/Mono.Data.Portable.nuspec
cd..

echo Packaging complete