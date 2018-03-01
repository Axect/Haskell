{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_myproject (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kavis/.cabal/bin"
libdir     = "/home/kavis/.cabal/lib/x86_64-linux-ghc-8.0.2/myproject-0.1-CANkHDR261E5vdyKWN8s7L"
dynlibdir  = "/home/kavis/.cabal/lib/ghc-8.0.2/myproject-0.1-CANkHDR261E5vdyKWN8s7L"
datadir    = "/home/kavis/.cabal/share/x86_64-linux-ghc-8.0.2/myproject-0.1"
libexecdir = "/home/kavis/.cabal/libexec"
sysconfdir = "/home/kavis/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myproject_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myproject_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myproject_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myproject_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myproject_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myproject_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
