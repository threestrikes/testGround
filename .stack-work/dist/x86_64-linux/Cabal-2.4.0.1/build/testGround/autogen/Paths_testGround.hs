{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_testGround (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/bin"
libdir     = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/lib/x86_64-linux-ghc-8.6.5/testGround-0.1.0.0-8R0xaYdZvMz1lB6KuezxXd-testGround"
dynlibdir  = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/share/x86_64-linux-ghc-8.6.5/testGround-0.1.0.0"
libexecdir = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/libexec/x86_64-linux-ghc-8.6.5/testGround-0.1.0.0"
sysconfdir = "/home/threestrikes/src/haskell/testGround/.stack-work/install/x86_64-linux/lts-13.20/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "testGround_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "testGround_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "testGround_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "testGround_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "testGround_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "testGround_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
