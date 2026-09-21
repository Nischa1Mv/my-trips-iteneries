# Scope notes — not architecture yet

Site: trip itinerary notes, static, GitHub Pages, repo Nischa1Mv/my-trips-iteneries.

## Current state
- `index.html` — list of trips, links out
- `deomali.html` — one trip page, redesigned with Tailwind CDN (play CDN, no build step), custom CSS kept only for: color tokens (light/dark), SVG elevation-profile styling, `<details>` marker, number-input spinner removal
- Interactive JS kept as-is: fuel calculator, budget calculator (localStorage), checkpoint/deadline tracker

## Wanted, not yet built
- Add images to trip pages (photos per stop/day) — need a place to host them (repo `/assets`? external?) and a layout pattern (gallery, inline, lightbox)
- **Photo map** — photos plotted on a map by place, click a point (Araku, Balda, Deomali...) to see its photos. Needs: a map library (Leaflet + OpenStreetMap tiles = free, no API key, vs. Google Maps JS API = needs a billed key), lat/lng per place, and photos tagged to a place id.
- **Generalize the whole concept** — not just "the Deomali page" but a reusable trip template: trip data (route, stops, elevations, timings, photos, budget defaults) separate from the page shell, so a new trip = fill in data, not rewrite HTML. Also implies: usable by other people, not just this repo — so the format/template should make sense to someone who isn't the original author.
- More trips over time — index page list grows
- File currently one long deomali.html — split into components/partials once page count grows and style is settled, so new trips don't mean copy-pasting 1000 lines
- Considered MagicUI (magicui.design) for animated/decorative React components — it's a React + Tailwind + Framer Motion component set, needs a real build (Next/Vite), not just a CDN script tag. Conflicts with current zero-build static setup. Options to weigh later: (a) stay static HTML + Tailwind CDN, skip MagicUI, hand-roll any flourish needed; (b) move whole site to a small React/Vite build to use MagicUI properly. Not decided.

## Decided
- **Map library: Leaflet + OpenStreetMap.** Free, no API key, no build step, fits static site. Built for Deomali: `data/deomali-places.json` holds `{id, name, lat, lng, photos: []}` per stop; `deomali.html` loads Leaflet from cdnjs, fetches that file, drops a pin per place, popup lists photos (or "No photos yet"). Coordinates are approximate — flagged in the data file, not verified against GPS.
- **Generalize via trip-as-data**, incrementally: each trip's places/photos live in their own `data/<trip>-places.json`, same shape, so the map/photo pattern is copy-paste-new-file, not rewritten per trip. NOT done yet: pulling the rest of the page (route, stops, elevations, timings, budget defaults) out of hand-written HTML into data — that stays hand-written for now, since Deomali's calculators/timeline already work and a full data-driven rewrite risks breaking them for a cosmetic-only gain. Revisit when a second trip page is actually added and the copy-paste pain is real.

## Far future — private notes, public page (single user — you, not a community)
Corrected: this is for one user, not multiple people sharing. That removes the need for accounts/auth entirely.
- **Public/private photos**: `"public": true/false` per photo in the trip JSON. On a static site "private" can only mean "not committed to the repo" — there's no server to gate access, so private photos just live outside the repo and never ship. No backend needed.
- **Comments**: a `notes`/`comment` field per place or photo in the same JSON, rendered on the page as your own annotation — you edit the file, it's not a live form + database. Not threaded, not multi-user — "talk about them" here means your own running commentary, not a Reddit thread.
- No Supabase/Firebase/custom API needed for this. That tier only becomes necessary if this ever turns into an actual multi-user product (other people posting their own trips) — not the current plan.
- See published roadmap artifact for the visual version of these four tiers (live now → more trips → whole page from data → this one).

## Still open
- Where actual photo files live (repo `/assets/<trip>/`? external host?) and how they get into the `photos` array
- Full page-from-data generation (route/stops/timings/elevations) — deferred, see above
- Static multi-page HTML (current) vs. a generator/framework (Next, Astro, 11ty) vs. React+Vite (only forced if MagicUI or a heavier map/gallery component gets pulled in)
