set version=%1

git clone https://github.com/ckeditor/ckeditor-releases.git 

cd ckeditor-releases
git.exe checkout tags/basic/%version%
cd ..

.nuget\NuGet.exe pack ckeditor-basic.nuspec -version %version%
.nuget\NuGet.exe push ckeditor-basic.%version%.nupkg && rm ckeditor-basic.%version%.nupkg

cd ckeditor-releases
git.exe checkout tags/standard/%version%
cd ..

.nuget\NuGet.exe pack ckeditor-standard.nuspec -version %version%
.nuget\NuGet.exe push ckeditor-standard.%version%.nupkg && rm ckeditor-standard.%version%.nupkg

cd ckeditor-releases
git.exe checkout tags/full/%version%
cd ..
.nuget\NuGet.exe pack ckeditor-full.nuspec -version %version%
.nuget\NuGet.exe push ckeditor-full.%version%.nupkg && rm ckeditor-full.%version%.nupkg

cd ckeditor-releases
git.exe checkout tags/%version%
cd ..
.nuget\NuGet.exe pack ckeditor-standard-all.nuspec -version %version%
.nuget\NuGet.exe push ckeditor-standard-all.%version%.nupkg && rm ckeditor-standard-all.%version%.nupkg

rmdir /S /Q ckeditor-releases