variable "TAG" {
  default = "slim"
}

variable "REGISTRY" {
  default = "ghcr.io/mortensams/comfyui-runpod"
}

group "default" {
  targets = ["common", "dev"]
}

# Common settings for all targets
target "common" {
  context = "."
  platforms = ["linux/amd64"]
}

# Regular ComfyUI image (CUDA 12.4)
target "regular" {
  inherits = ["common"]
  dockerfile = "Dockerfile"
  tags = [
    "${REGISTRY}:${TAG}",
    "${REGISTRY}:latest",
  ]
}

# Dev image for local testing
target "dev" {
  inherits = ["common"]
  dockerfile = "Dockerfile"
  tags = ["${REGISTRY}:dev"]
  output = ["type=docker"]
}

# Dev push targets (for CI pushing dev tags, without overriding latest)
target "devpush" {
  inherits = ["common"]
  dockerfile = "Dockerfile"
  tags = ["${REGISTRY}:dev"]
}

target "devpush5090" {
  inherits = ["common"]
  dockerfile = "Dockerfile.5090"
  tags = ["${REGISTRY}:dev-5090"]
}

# RTX 5090 optimized image (CUDA 12.8 + latest PyTorch build)
target "rtx5090" {
  inherits = ["common"]
  dockerfile = "Dockerfile.5090"
  tags = [
    "${REGISTRY}:${TAG}-5090",
    "${REGISTRY}:latest-5090",
  ]
}
