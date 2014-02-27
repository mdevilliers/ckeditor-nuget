set version=%1

git clone https://github.com/ckeditor/ckeditor-releases.git 

cd ckeditor-releases
git.exe checkout tags/basic/%version%
cd ..

.nuget\NuGet.exe pack ckeditor-basic.nuspec -version %version%

cd ckeditor-releases
git.exe checkout tags/standard/%version%
cd ..

.nuget\NuGet.exe pack ckeditor-standard.nuspec -version %version%

cd ckeditor-releases
git.exe checkout tags/full/%version%
cd ..
.nuget\NuGet.exe pack ckeditor-full.nuspec -version %version%


cd ckeditor-releases
git.exe checkout tags/%version%
cd ..
.nuget\NuGet.exe pack ckeditor-standard-all.nuspec -version %version%

rmdir /S /Q ckeditor-releases