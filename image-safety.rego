package kubernetes.admission                                                # line 1

deny[msg] {                                                                 # line 2
  input.request.kind.kind == "Pod"                                          # line 3
  image := input.request.object.spec.containers[_].image                    # line 4
  endswith(image, ":latest")                                                # line 5
  msg := sprintf("image '%v' is latest, don't use latest", [image])         # line 6
}
