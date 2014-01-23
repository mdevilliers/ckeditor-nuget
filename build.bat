set version=%1

git clone https://github.com/ckeditor/ckeditor-releases.git 

cd ckeditor-releases
git.exe checkout tags/%version%/basic
cd ..

.nuget\NuGet.exe pack ckeditor-basic.nuspec -version %version%

cd ckeditor-releases
git.exe checkout tags/%version%/standard
cd ..

.nuget\NuGet.exe pack ckeditor-standard.nuspec -version %version%

cd ckeditor-releases
git.exe checkout tags/%version%/full
cd ..
.nuget\NuGet.exe pack ckeditor-full.nuspec -version %version%

rmdir /S /Q ckeditor-releases