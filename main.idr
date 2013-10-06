
module Main


%link C "defs.o"
%include C "defs.h"


getEnvPairMine : Int -> IO String
getEnvPairMine i = mkForeign (FFun "getEnvPairMine" [FInt] FString) i


main : IO ()
main = do
    env <- getEnvPairMine 54 
    print "got here"
