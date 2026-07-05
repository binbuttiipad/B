# MCP Tools Reference -- @ycse/nanobanana-mcp

Package: `@ycse/nanobanana-mcp`
GitHub: https://github.com/YCSE/nanobanana-mcp

## Tools

### gemini_generate_image
Generate an image from a text prompt.

**Parameters:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `prompt` | string | Yes | Text description of the image to generate |

**Returns:** Image data + file path (saved to `~/Documents/nanobanana_generated/`)

### gemini_edit_image
Edit an existing image with text instructions.

**Parameters:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `imagePath` | string | Yes | Path to the image file to edit |
| `prompt` | string | Yes | Edit instructions |

**Returns:** Modified image data + file path

### gemini_chat
Multi-turn visual conversation maintaining session context.

**Parameters:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `message` | string | Yes | Chat message |

**Returns:** Text response + optional image

**Key feature:** Session consistency -- maintains style, characters, and context across turns.

### set_aspect_ratio
Configure the aspect ratio for subsequent image generations.

**Parameters:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `ratio` | string | Yes | Aspect ratio (e.g., "16:9", "1:1", "9:16") |

**Supported ratios:** 1:1, 16:9, 9:16, 4:3, 3:4, 2:3, 3:2, 4:5, 5:4, 1:4, 4:1, 1:8, 8:1, 21:9

### set_model
Switch the active Gemini model.

**Parameters:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| `model` | string | Yes | Model identifier |

**Available models:**
- `gemini-3.1-flash-image-preview` (default, recommended -- Nano Banana 2)
- `gemini-2.5-flash-image` (stable fallback -- Nano Banana original)

### get_image_history
Retrieve list of images generated in the current session.

### clear_conversation
Reset session context and conversation history.

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `GOOGLE_AI_API_KEY` | Yes | API key from https://aistudio.google.com/apikey |
| `NANOBANANA_MODEL` | No | Override default model |

## Output Directory
All generated images are saved to: `~/Documents/nanobanana_generated/`
