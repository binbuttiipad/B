# Prompt Engineering Reference -- Banana Claude

> Load this on-demand when constructing complex prompts or when the user
> asks about prompt techniques. Do NOT load at startup.

## The 5-Component Prompt Formula

Write as natural narrative paragraphs -- NEVER as comma-separated keyword lists.

### Component 1 -- SUBJECT
Who or what is the primary focus. Be specific about physical characteristics,
material, species, age, expression.

**Good:** "A weathered Japanese ceramicist in his 70s, deep sun-etched
wrinkles mapping decades of kiln work, calloused hands cradling a
freshly thrown tea bowl with an irregular, organic rim"

### Component 2 -- ACTION
What the subject is doing, or the primary visual state. Use strong present-tense verbs.

**Good:** "leaning forward with intense concentration, gently smoothing
the rim with a wet thumb, a thin trail of slip running down his wrist"

### Component 3 -- LOCATION / CONTEXT
Where the scene takes place. Include environmental details, time of day.

**Good:** "inside a traditional wood-fired anagama kiln workshop,
stacked shelves of drying pots visible in the soft background, late
afternoon light filtering through rice paper screens"

### Component 4 -- COMPOSITION
Camera perspective, framing, and spatial relationship.

**Good:** "intimate close-up shot from slightly below eye level,
shallow depth of field isolating the hands and bowl against the
soft bokeh of the workshop behind"

### Component 5 -- STYLE (includes lighting)
The visual register, aesthetic, medium, and lighting combined.

**Good:** "shot on a Fujifilm X-T4 with warm color science and natural
bokeh, warm directional light from a single high window camera-left
creating gentle Rembrandt lighting on the face with deep warm shadows.
Reminiscent of Dorothea Lange's documentary portraiture"

## ❌ BANNED PROMPT KEYWORDS -- NEVER USE THESE

NEVER include:
- "4k" / "8k" / "ultra HD" / "high resolution"
- "masterpiece"
- "highly detailed" / "ultra detailed"
- "trending on artstation"
- "hyperrealistic" / "ultra realistic"
- "photorealistic" (describe the camera/film instead)
- "best quality"
- "award winning"

USE THESE INSTEAD (prestigious context anchors):
- "Pulitzer Prize-winning cover photograph"
- "Vanity Fair editorial portrait"
- "National Geographic cover story"
- "WIRED magazine feature spread"
- "Architectural Digest interior"
- "Magnum Photos documentary"

## Positive Framing (No Negative Prompts)

Gemini does NOT support negative prompts. Rephrase exclusions:
- Instead of "no blur" → "sharp, in-focus, tack-sharp detail"
- Instead of "no people" → "empty, deserted, uninhabited"
- Instead of "no text" → "clean, uncluttered, text-free"
- Instead of "not dark" → "brightly lit, high-key lighting"

## Proven Prompt Templates

### Product / Commercial Photography

**Example (Beverage):**
```
Gatorade bottle with condensation dripping down the sides, surrounded by
lightning bolts and a burst of vibrant blue and orange light rays. The
Gatorade logo is prominently displayed on the bottle, with splashes of
water frozen in mid-air. Commercial food photography for an advertising
campaign, vibrant complementary colors. Bon Appetit magazine cover aesthetic.
```

### Fashion / Editorial

**Example:**
```
A 24-year-old female posing confidently in an urban cityscape during golden hour.
Flawless sun-kissed skin, long wavy brown hair, deep green eyes. Wearing a chic
streetwear outfit -- oversized beige blazer, white top, high-waisted jeans.
Captured with Sony A7R IV at 85mm f/1.4, shallow depth of field with warm
golden bokeh.
```

For more templates and detailed guidance, see: https://github.com/AgriciDaniel/banana-claude
