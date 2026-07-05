# Gemini Image Generation Models

> Last updated: 2026-03-19
> Aligned with Google's March 2026 API state

## Available Models

### gemini-3.1-flash-image-preview -- Nano Banana 2 (DEFAULT)
| Property | Value |
|----------|-------|
| **Model ID** | `gemini-3.1-flash-image-preview` |
| **Tier** | Nano Banana 2 (Flash) |
| **Status** | Preview -- **Active, recommended default** |
| **Speed** | Fast -- optimized for high-volume use |
| **Aspect Ratios** | All 14 ratios including extreme: 1:4, 4:1, 1:8, 8:1 |
| **Max Resolution** | Up to 4096×4096 (4K tier) |
| **Input Tokens** | 131,072 |
| **Features** | Google Search grounding (web + image), thinking levels, image-only output, extreme aspect ratios |
| **Rate Limits (Free)** | ~5-15 RPM / ~20-500 RPD (per project, resets midnight Pacific) |
| **Output Tokens** | ~1,290 output tokens per image |
| **Best For** | All standard production generation and editing -- most use cases |

### gemini-2.5-flash-image -- Nano Banana (Original)
| Property | Value |
|----------|-------|
| **Model ID** | `gemini-2.5-flash-image` |
| **Tier** | Nano Banana (Flash, original generation) |
| **Status** | GA -- **Active** |
| **Speed** | Fast |
| **Aspect Ratios** | 1:1, 16:9, 9:16, 4:3, 3:4, 2:3, 3:2, 4:5, 5:4, 21:9 (10 ratios) |
| **Max Resolution** | Up to 1024×1024 (1K tier) |
| **Input Tokens** | 32,768 |
| **Rate Limits (Free)** | ~5-15 RPM / ~20-500 RPD |
| **Best For** | Free-tier users, budget-conscious high-volume workflows, 1K-resolution use cases |
| **Cost** | ~$0.039/image at 1K |

## Resolution Tiers

| `imageSize` Value | Pixel Range | Model Availability | Use Case |
|-------------------|-------------|-------------------|----------|
| `512` | Up to 512×512 | Nano Banana 2 only | Drafts, quick iteration |
| `1K` | Up to 1024×1024 | All models | Standard web use, social media |
| `2K` | Up to 2048×2048 | Nano Banana 2 only | Quality assets, detailed work |
| `4K` | Up to 4096×4096 | Nano Banana 2 only | Print production, hero images |

**Note:** `imageSize` value MUST be uppercase -- `"2k"` will be silently ignored

## Aspect Ratios

| Ratio | Orientation | Use Cases | Nano Banana 2 | Nano Banana |
|-------|-------------|-----------|:--:|:--:|
| `1:1` | Square | Social posts, avatars | ✅ | ✅ |
| `16:9` | Landscape | Blog headers, YouTube | ✅ | ✅ |
| `9:16` | Portrait | Stories, Reels, TikTok | ✅ | ✅ |
| `4:3` | Landscape | Product shots | ✅ | ✅ |
| `3:4` | Portrait | Book covers | ✅ | ✅ |
| `2:3` | Portrait | Pinterest pins, posters | ✅ | ✅ |
| `3:2` | Landscape | DSLR standard | ✅ | ✅ |
| `4:5` | Portrait | Instagram portrait | ✅ | ✅ |
| `5:4` | Landscape | Large format photography | ✅ | ✅ |
| `21:9` | Ultra-wide | Cinematic, film-grade | ✅ | ✅ |
| `1:4` | Tall strip | Vertical banners | ✅ | ❌ |
| `4:1` | Wide strip | Website banners | ✅ | ❌ |
| `1:8` | Extreme tall | Narrow vertical strips | ✅ | ❌ |
| `8:1` | Extreme wide | Ultra-wide banners | ✅ | ❌ |

## Pricing

| Model | Resolution | Cost per Image |
|-------|-----------|----------------|
| NB2 (3.1 Flash) | 1K | ~$0.067 |
| NB2 (3.1 Flash) | 2K | ~$0.134 |
| NB2 (3.1 Flash) | 4K | ~$0.268 |
| NB (2.5 Flash) | 1K | ~$0.039 |

For more details, see the full documentation at: https://github.com/AgriciDaniel/banana-claude
