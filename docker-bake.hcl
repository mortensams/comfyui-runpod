variable "TAG" {
  default = "slim"
}

variable "REGISTRY" {
  default = "ghcr.io/mortensams/comfyui-runpod"
}

group "default" {
  targets = ["common", "dev5090"]
}

# Common settings for all targets
target "common" {
  context = "."
  platforms = ["linux/amd64"]
}

# Dev image for local testing (RTX 5090)
target "dev5090" {
  inherits = ["common"]
  dockerfile = "Dockerfile.5090"
  tags = ["${REGISTRY}:dev-5090"]
  output = ["type=docker"]
}

# Dev push target for CI (RTX 5090)
target "devpush5090" {
  inherits = ["common"]
  dockerfile = "Dockerfile.5090"
  tags = [
    "${REGISTRY}:dev-5090",
    "${REGISTRY}:dev",
    "${REGISTRY}:latest"
  ]
}

# RTX 5090 optimized image (CUDA 12.8 + latest PyTorch build)
target "rtx5090" {
  inherits = ["common"]
  dockerfile = "Dockerfile.5090"
  tags = [
    "${REGISTRY}:${TAG}-5090",
    "${REGISTRY}:${TAG}",
    "${REGISTRY}:latest-5090",
    "${REGISTRY}:latest",
  ]
}
