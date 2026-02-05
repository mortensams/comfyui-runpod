[![Watch the video](https://i3.ytimg.com/vi/JovhfHhxqdM/hqdefault.jpg)](https://www.youtube.com/watch?v=JovhfHhxqdM)

Run the latest ComfyUI. First start installs dependencies (takes a few minutes), then when you see this in the logs, ComfyUI is ready to be used: `[ComfyUI-Manager] All startup tasks have been completed.`

## Access

- `8188`: ComfyUI web UI
- `8080`: FileBrowser Quantum (mks / mks123)
- `8888`: JupyterLab (token via `JUPYTER_PASSWORD`, root at `/workspace`)
- `8000`: VS Code Server (token: mks123, or access via `?tkn=mks123`)
- `22`: SSH (set `PUBLIC_KEY` or check logs for generated root password)

## Pre-installed custom nodes

- ComfyUI-Manager
- ComfyUI-KJNodes
- Civicomfy

## AI Toolkit

[ai-toolkit](https://github.com/ostris/ai-toolkit) is pre-installed for training and fine-tuning diffusion models (Stable Diffusion, FLUX, etc.).

**Quick Start:**
```bash
# Activate ai-toolkit environment
ai-toolkit

# Or manually:
source /workspace/ai-toolkit/venv/bin/activate
cd /workspace/ai-toolkit

# Run training
python run.py your-config.yaml
```

The ai-toolkit runs in its own isolated virtual environment to avoid conflicts with ComfyUI dependencies.

## Additional Tools

- **llama-cpp-python**: CUDA 12.8 optimized build pre-installed
- **FileBrowser Quantum**: Enhanced file browser with indexing and search
- **VS Code Server**: Full VS Code in your browser with persistent settings

## Source Code

This template is open source. Source code available at: [github.com/mortensams/comfyui-runpod](https://github.com/mortensams/comfyui-runpod)

## Custom Arguments

Edit `/workspace/runpod-slim/comfyui_args.txt` (one arg per line):

```
--max-batch-size 8
--preview-method auto
```

## Directory Structure

- `/workspace/runpod-slim/ComfyUI`: ComfyUI installation
- `/workspace/runpod-slim/comfyui_args.txt`: ComfyUI custom arguments
- `/workspace/runpod-slim/filebrowser.db`: FileBrowser Quantum database
- `/workspace/runpod-slim/cache`: FileBrowser cache directory
- `/workspace/ai-toolkit`: AI Toolkit for training (isolated venv)
- `/workspace/.vscode-server`: VS Code server data and extensions
