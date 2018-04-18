import Parseur 
import Lexeur 
import AST
import System.Console.Haskeline
import Control.Monad.Trans
import Control.Monad.Except

process :: String -> IO ()
process input = do
  let res = parseExpr =<< (scanTokens input)
  case runExcept res of
    Left err -> do
      putStrLn "Erreur de parsing:"
      print err
    Right ast -> putStrLn ("Syntax: " ++ show ast)




main :: IO ()
main = runInputT defaultSettings loop
  where
  loop = do
    minput <- getInputLine "Happy> "
    case minput of
      Nothing -> outputStrLn "Goodbye."
      Just input -> (liftIO $ process input) >> loop
