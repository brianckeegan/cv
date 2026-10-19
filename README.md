# cv

The curriculum vitae of Brian C. Keegan, Ph.D., in LaTeX.

**Newest PDF:** <https://github.com/brianckeegan/cv/releases/latest/download/cv.pdf>

This link always gives the newest build. The CV page of
[brianckeegan.com](https://www.brianckeegan.com/cv/) links to it.

## Files

| File | What it is |
|---|---|
| `cv.tex` | The content of the CV. |
| `cv.cls` | The layout: page size, fonts, the accent color, margin section titles, numbered lists, header, and footer. |
| `.latexmkrc` | Build settings for `latexmk`, including the footer date. |
| `.github/workflows/build.yml` | Builds the PDF on GitHub and publishes it as a release. |
| `.github/texlive-packages.txt` | The TeX Live packages that the workflow installs. |

## How the PDF is published

1. Push a change to `cv.tex` or `cv.cls` on the `main` branch.
2. The **Build CV** workflow (GitHub Actions) installs TeX Live, runs
   `latexmk`, and fails if the log has an overfull line or an
   undefined reference. It installs only the packages in
   `.github/texlive-packages.txt` and caches them, so a run takes about
   20 seconds (about 1 minute when the cache is empty).
3. If the build passes, the workflow attaches `cv.pdf` to the release
   with the tag `cv-latest` and marks that release as the latest. The
   link above then gives the new PDF.

Pull requests only build the PDF, to catch errors before a merge. To
build again without a change, open **Actions → Build CV → Run
workflow**.

## Build on your computer

You need TeX Live (or MacTeX) with `latexmk`. On Debian or Ubuntu:

```bash
sudo apt-get install texlive-latex-recommended texlive-latex-extra texlive-fonts-extra latexmk
```

Then, in this folder:

```bash
latexmk        # builds cv.pdf
latexmk -c     # removes the build files, but keeps cv.pdf
```

The build files and `cv.pdf` are in `.gitignore`; do not commit them.

## TeX Live in the workflow

The workflow uses [setup-texlive-action](https://github.com/TeX-Live/setup-texlive-action)
to install a small TeX Live: `scheme-basic` and the packages listed in
`.github/texlive-packages.txt`. `tlmgr` does not install dependencies,
so the list must name every package that the CV loads.

- **New package in `cv.cls` or `cv.tex`:** add its TeX Live name to
  `.github/texlive-packages.txt`. If you do not, the workflow fails
  with "File `name.sty' not found". To find the TeX Live name of a file:
  `tlmgr search --global --file /name.sty`.
- **New TeX Live release (each spring):** change `version` in
  `.github/workflows/build.yml` (for example, `2026` to `2027`). The
  first run after the change installs everything again and is slower.
- **Check the TeX package list:** install TeX Live with the
  `scheme-infraonly` scheme, run `tlmgr install` with the names in the
  file, and run `latexmk` with only that TeX Live on your `PATH`.

## Edit the CV

### Add an item to a numbered list

Most sections are numbered lists. The newest item goes first and
gets the highest number:

```latex
\begin{entries}{J}
	\item Newest article ...      % prints J15
	\item Older article ...       % prints J14
\end{entries}
```

The numbers count down automatically. Do not type them. When the
number of items changes, LaTeX needs a second run to get the numbers
right; `latexmk` does this for you. Use `\awarditem` in place of `\item`
to put an award icon before the number.

| Prefix | Section |
|---|---|
| G | Awards and funding |
| B | Books |
| J | Journal articles |
| C | Archival conference proceedings |
| BC | Book chapters |
| X | Work in progress |
| Z | Non-reviewed publications |
| W | Workshops, panels, posters, consortia |
| P | Conference presentations |
| T | Invited talks and lectures |
| SU, SP, SC | Service to university, profession, and public |
| N | Press coverage |
| O | Op-eds and invited articles |

### Conventions

- **Authors:** `Lastname, F.I.`, with `\textbf{Keegan, B.C.}`. Mark
  student authors with `\textbf{*}` and post-doctoral authors with
  `\textbf{$\dagger$}`, after the comma.
- **Links:** `\doi{10.1145/3359135}` for a DOI (it prints
  "doi:10.1145/3359135" and links to doi.org); otherwise
  `\url{...}` with the canonical URL. Do not escape `%` or `/` inside
  `\url{}`. Links are in the accent color (`#7A6A3A`, the website's
  link color), so that readers can see them.
- **Dates:** `9 July 2026` (day, month, year).
- **Quotes and dashes:** ` ``double'' `, `` `single' ``, `--` for number
  ranges, `---` for a dash in a title. Use plain ASCII: no curly quotes
  or special hyphens pasted from a web page.
- **Op-ed titles:** the headline on the article page, without the
  outlet's "Opinion:" or author-name prefix.
- **Names that changed:** use the person's current name in all items
  (for example, H.L. Lawson, formerly H.L. Jones).

### Footer date

The footer shows the date of the last commit that changed `cv.tex` or
`cv.cls`, not the date of the build. The workflow and `.latexmkrc` set
`SOURCE_DATE_EPOCH` from `git log`; pdfTeX then takes `\today` from it.
The date is in UTC, so a commit in the evening (Mountain time) can show
the next day. Outside a git checkout, the footer shows the build date.

## Where the content comes from

When you update the CV, check these sources.

| Section | Sources |
|---|---|
| Journal articles, proceedings, book chapters | [Google Scholar](https://scholar.google.com/citations?user=zkxrDS8AAAAJ&hl=en) (sort by year); `_bibliography/papers.bib` in [brianckeegan.github.io](https://github.com/brianckeegan/brianckeegan.github.io); [Crossref](https://search.crossref.org/) for volume, pages, and DOI. Crossref has other people named Brian Keegan (for example, at TU Dublin); check co-authors and topics before you add an item. |
| Work in progress | arXiv, SSRN, and OSF preprints; papers under review. Move an item to its final section when it is published. |
| Op-eds | [Boulder Reporting Lab author page](https://boulderreportinglab.org/author/brian-c-keegan/); *Daily Camera*, *Colorado Sun*, *Boulder Weekly*, and *The Conversation*; the news items in `_news/` and the list in `_projects/civic_data_analysis.md` on the website. |
| Press coverage | Stories that quote or describe the work. Op-eds go under Op-eds, not here. |
| Teaching | The course pages in `_teaching/` on the website ("Past offerings" tables). Enrollment counts come from the university. |

Scripts cannot read Google Scholar (it shows a CAPTCHA), and OpenAlex
and DBLP limit or block automated requests. Crossref works without a key.

## Website

The website ([brianckeegan/brianckeegan.github.io](https://github.com/brianckeegan/brianckeegan.github.io))
links to the PDF from its CV page (`cv_pdf` in `_pages/cv.md`). Its
web CV (`_data/cv.yml`) is a short summary that is edited by hand. When
you change education, appointments, funding, or honors here, change
`cv.yml` too.

## License

The layout (`cv.cls`) is based on `res.cls` by Michael DeCorte (1988),
ported to LaTeX2e by Venkat Krishnamurthy (2001); its copyright notice is in the header of `cv.cls`. The rest of the repository is under the MIT License (`LICENSE`).
