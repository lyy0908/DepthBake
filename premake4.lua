solution "DepthBakeSol"
  configurations { "Release", "Debug" }
  configuration {"vs*" }
    platforms { "x32","x64" }
  configuration {"xcode*" }
    platforms { "Universal" }
  location "project" 
	
project "DepthBake"
  kind "ConsoleApp"
  language "C++"
  files    { "src/**.h","src/**.cpp", "src/**.inl", "assets/**" }
  includedirs { "src"}
  configuration {"xcode*" }
    buildoptions "-std=c++1y -stdlib=libc++ -fno-exceptions"
  configuration {"xcode*" }
    links { "Cocoa.framework", "OpenGL.framework",  "/Library/Frameworks/SDL2.framework", "/Library/Frameworks/SDL2_image.framework"  }
  configuration {"vs*" }
    links { "../glew-1.11.0/lib/Release/Win32/glew32s" , "../SDL2-2.0.3/lib/x86/SDL2", "../SDL2-2.0.3/lib/x86/SDL2main", "../SDL2_image-2.0.0/lib/x86/SDL2_image", "OpenGL32", "../kick/lib/debug/kick" }
  configuration {"xcode*" }
    buildoptions { "-F/Library/Frameworks/" }
  configuration {"xcode*" }
    linkoptions { "-F/Library/Frameworks/"} 
  configuration {"vs*" }
    includedirs { "../glew-1.11.0/include", "../SDL2-2.0.3/include", "../SDL2-2.0.3/include", "../SDL2_image-2.0.0/include", "../kick/src", "../kick/libs/include"  }
  configuration {"xcode*" }	
      debugdir "../.."
	configuration {"vs*" }
      debugdir "./.."	
	
  configuration "Debug"
    targetdir "bin/debug"
    defines { "DEBUG","GLM_FORCE_PURE" }
    flags { "Symbols" }		
    

  configuration "Release"
    targetdir "bin/release"
    defines { "NDEBUG","GLM_FORCE_PURE" }
    flags { "Optimize" } 


	
  if _ACTION == "clean" then
    os.rmdir("bin")
  end
