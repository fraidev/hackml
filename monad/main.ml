module Monad = struct
  type 'a _t = 'a option

  let return x = Some x

  let bind self f =
    match self with
    | Some x -> f x
    | None -> None

  let ( >>= ) self f = bind self f
end

open Monad

let some_value_with_monad = Monad.return 1

let bind = Monad.bind some_value_with_monad (fun x -> Monad.return (x + 1))

let bind_op = some_value_with_monad >>= fun x -> Monad.return (x + 1);;

bind |> Option.get |> print_int;;
bind_op |> Option.get |> print_int
