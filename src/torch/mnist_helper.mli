(* Images have shape [ samples; 728 ]. Labels are one-hot encoded with
   shape [ samples; 10 ]. *)
type t =
  { train_images : Tensor.t
  ; train_labels : Tensor.t
  ; test_images : Tensor.t
  ; test_labels : Tensor.t
  }

val read_files
  :  ?train_image_file:string
  -> ?train_label_file:string
  -> ?test_image_file:string
  -> ?test_label_file:string
  -> ?with_caching:bool
  -> unit
  -> t

val image_dim : int
val label_count : int

val train_batch
  :  t
  -> batch_size:int
  -> batch_idx:int
  -> Tensor.t * Tensor.t