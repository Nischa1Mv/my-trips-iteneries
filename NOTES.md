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

## Architecture — decide later
Open questions once there's more than one trip page:
- Static multi-page HTML (current) vs. a generator/framework (Next, Astro, 11ty) vs. React+Vite (needed if MagicUI in, or for a photo map component)
- Trip-as-data: what shape (JSON/YAML/MD frontmatter?) holds route/stops/elevations/timings/photos so the page is generated, not hand-written
- Photo map: Leaflet/OSM (free, static-friendly) vs. Google Maps (paid key) — leans Leaflet given zero-build preference so far, not decided
- Where images live and how they're referenced (repo, or external host)
- Shared layout/header/nav across trip pages — templated or copy-pasted
- "Usable by other people" — does this mean open-sourcing a template repo, a CLI/scaffold, or just a clean enough data format to copy?
