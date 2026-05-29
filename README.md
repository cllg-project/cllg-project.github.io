# CLLG Project Website

Source for [cllg-project.github.io](https://cllg-project.github.io) — the public website of the **Corpus Liberatum Linguæ Graecæ** project.

Built with [Hugo](https://gohugo.io). Deployed automatically to GitHub Pages on every push to `main`.

---

## Run locally

Hugo must be installed at `~/.local/bin/hugo`. If you need to install it:

```bash
HUGO_VERSION="0.147.2"
curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
  | tar -xz -C ~/.local/bin hugo
chmod +x ~/.local/bin/hugo
```

Then start the dev server:

```bash
make serve
```

The site is available at <http://localhost:1313> with live reload.

---

## Editing content

All content is in plain Markdown and YAML — no knowledge of Hugo or HTML required.

| What to edit | File |
|---|---|
| Main body text (About, Legal, Funding) | `content/_index.md` |
| Team members | `data/team.yaml` |
| Resources (HuggingFace, repos, software) | `data/resources.yaml` |
| Publications | `data/papers.yaml` |
| Site title, URLs, ANR grant ref | `hugo.toml` |

### Adding a team member

Open `data/team.yaml` and append:

```yaml
- name: "First Last"
  role: "Their role"
  photo: "/images/filename.jpg"   # place the photo in static/images/
  url: "https://..."              # optional personal/lab URL
```

### Adding a paper

Open `data/papers.yaml` and append:

```yaml
- title: "Full paper title"
  authors: "Author A, Author B, ..."
  year: 2026
  venue: "Conference / arXiv preprint"
  arxiv: "XXXX.XXXXX"            # arXiv ID only, without the prefix
  url: "https://arxiv.org/abs/XXXX.XXXXX"
  abstract: "One or two sentences summarising the contribution."
```

### Adding a software tool or dataset

Open `data/resources.yaml` and add to the relevant section (`software`, `repositories`, etc.):

```yaml
- name: "Tool name"
  url: "https://github.com/..."
  description: "Short description."
  icon: "github"   # github | gitlab
```

---

## Deployment

Pushing to `main` triggers the GitHub Actions workflow in `.github/workflows/deploy.yml`, which:

1. Installs Hugo 0.147.2 (extended)
2. Runs `hugo --minify`
3. Deploys the `public/` output to GitHub Pages

**First-time setup:** in the repository Settings → Pages, set the source to **GitHub Actions**.

---

## Project structure

```
.
├── hugo.toml                   # site config and global parameters
├── content/
│   └── _index.md               # homepage prose (About, Legal, Funding)
├── data/
│   ├── team.yaml               # team members
│   ├── papers.yaml             # publications
│   └── resources.yaml          # HuggingFace, repos, software
├── layouts/
│   ├── index.html              # homepage template
│   └── partials/               # nav, head, footer
├── static/
│   ├── css/main.css            # all styling
│   └── images/                 # team photos, logos
├── .github/
│   └── workflows/deploy.yml    # GitHub Pages CI
└── Makefile                    # serve / build / clean
```
