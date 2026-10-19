# Roadmap

Changes planned for future revisions of the CV. When an item is done,
remove it here and describe the change in its commit message.

Contents:

1. [Acceptance rates not reported](#acceptance-rates-not-reported-nr)
2. [Facts only the owner can give](#facts-only-the-owner-can-give)
3. [Content to research](#content-to-research)
4. [Links and identifiers](#links-and-identifiers)
5. [Layout and accessibility](#layout-and-accessibility)
6. [Build and upkeep](#build-and-upkeep)
7. [Website](#website)

## Acceptance rates not reported ("N.R.")

The proceedings entries end with the venue's acceptance rate, for
example `(31\% acceptance)`. Where no rate was found, they say
`(N.R. acceptance)`. Use only a rate that the venue itself reports for
that year (preface or front matter, editorial, or the program chairs'
report), not a general figure for the conference.

### C29–C33 (researched October 2026; no rate found)

| Item | Paper | Venue | What the official sources say |
|---|---|---|---|
| C33 | Lawson & Keegan, "Cross-Language Evolution of Divergent Collective Memory Around the Arab Spring" | ICWSM 2026, *Proc. ICWSM* vol. 20 | No preface or front matter on the [vol. 20 issue page](https://ojs.aaai.org/index.php/ICWSM/issue/view/735). The issue page says "approximately 20%" and icwsm.org/2026 says "approximately 20 to 30%"; the same text appears every year, so it is not a 2026 rate. |
| C32 | Smith et al., "Governance of the Black Experience on Reddit" | CSCW, *PACM HCI* vol. 8, CSCW2 (Nov 2024) | [Editorial](https://doi.org/10.1145/3686891): "171 papers, of which 117 were accepted from the July 2023 cycle, and 55 were accepted from the January 2024 cycle." No submission counts in the abstract. |
| C31 | Prinster et al., "Community Archetypes" | CSCW, *PACM HCI* vol. 8, CSCW1 (Apr 2024) | [Editorial](https://doi.org/10.1145/3637287): "209 papers, of which 175 were accepted from the Jan 2023 cycle, and 34 were accepted from the Jul 2023 cycle." No submission counts in the abstract. |
| C30 | Doyle et al., "Stories That Heal" | ICWSM 2024, *Proc. ICWSM* vol. 18 | No preface on the [vol. 18 issue page](https://ojs.aaai.org/index.php/ICWSM/issue/view/605); only the general "approximately 20%". The 2024 program PDF (icwsm.org/2024/icwsm-program.pdf) is gone. |
| C29 | Smith et al., "The Impact of Governance Bots on Sense of Virtual Community" | CSCW, *PACM HCI* vol. 6, CSCW2 (Nov 2022) | [Editorial](https://doi.org/10.1145/3555227): 293 papers, "94 … from the April 2021 cycle, 61 … from the July 2021 cycle, and 138 … from the January 2022 cycle." No submission counts in the abstract. |

Next steps:

- **CSCW (C29, C31, C32):** read the full text of the three editorials
  on the ACM Digital Library (scripts get 403; the open copy of the
  April 2024 editorial at <https://eprints.gla.ac.uk/325810/> has no
  full text). If an editorial gives the number of submissions for each
  cycle, the rate is accepted ÷ submitted for the cycles in that issue.
  Otherwise, ask the CSCW papers chairs for those years.
- **ICWSM (C30, C33):** ask the ICWSM program chairs for 2024 and 2026;
  the rate is often given only in the opening remarks or the reviewer
  mailing.
- Do not use these figures, found during the research:
  - "40.6% of 310 submissions": attributed to the 2022 editorial, but it
    is for the January 2020 cycle.
  - "26% (2,552 of 9,767)": shown for CSCW 2024 on the ACM Digital
    Library, but the same numbers appear for CSCW 2015, so it is a total
    for all years.

### C4, C6, C7, C8 (not yet researched)

| Item | Venue |
|---|---|
| C8 | ICWSM 2011 |
| C7 | IEEE SocialCom 2011 |
| C6 | WikiSym 2011 |
| C4 | IEEE SocialCom 2010 |

Check the prefaces of these proceedings (IEEE Xplore and the ACM
Digital Library list the front matter of each volume) with the same
rule as above.

## Facts only the owner can give

- **Teaching enrollments:** INFO 3401 (Spring 2026) and INFO 4617/5617
  (Fall 2026) have no `N=` count. Get the counts from the university.
- **Teaching in 2025:** the list goes from 2024 to 2026. Add the 2025
  courses, or confirm that there were none (for example, during the
  Harvard visiting appointment).
- **"Present" dates:** 21 entries end in "present" (appointments,
  students, service). Confirm each one is still current, and add end
  dates for students who finished.
- **Honors and awards:** the newest honor is from 2019. Add any honors
  from 2020 on (for example, best-paper awards or nominations).
- **Grants:** the newest grant (G9) ended in 2025. Add any new grants.
- **Invited talks:** the newest talk (T32) is from March 2026. Add any
  talks since then.
- **Press coverage:** three stories that quote or describe the work
  were found in October 2026 but not added; decide whether to add them:
  - *Denver Post*, 15 January 2026, "An apparent AI-generated Facebook
    post claimed a Broncos reporter died. He doesn't understand why."
  - *Boulder Weekly*, 26 May 2022, "The wrong labels" (the
    *PLoS ONE* cannabis labeling study).
  - *Colorado Sun*, 31 January 2020, "Where's the line between
    political speech and credible threats? A Colorado bill is asking the
    question."

## Content to research

- **Work in progress:** seven items say "(TBD)", and two are arXiv
  preprints from 2020 and 2022 (X1, X2). Check whether any of them is published or under review, and
  move published items to their final section. In October 2026,
  OpenAlex and DBLP blocked scripts and only Crossref was checked; an
  OpenAlex API key, or a person with a Google Scholar export, would
  cover preprints and venues without DOIs.
- **New publications:** check Google Scholar and the website's
  `papers.bib` against the CV at least once each semester.
- **Op-eds:** check the Boulder Reporting Lab author page and the other
  outlets each month; the website adds each op-ed to `_news/` and
  `_projects/civic_data_analysis.md`, so the CV must get the same line.

## Links and identifiers

- **Old links:** 13 URLs use `http://`: 12 in Press coverage
  (2011–2015) and one in Non-reviewed publications. Check each one; change it to `https://` where that
  works, or link to an archived copy (web.archive.org) where the page is
  gone.
- **Link check:** add a monthly workflow (for example, lychee) that
  lists broken links in `cv.tex`, so dead links are found before a
  reader finds them.

## Layout and accessibility

- **Tagged PDF:** the workflow now uses TeX Live 2026, which supports
  tagged, screen-reader-friendly PDFs (`\DocumentMetadata{tagging=on}`).
  Test it with the margin section titles and the numbered lists in
  `cv.cls`, and check the result with a PDF/UA checker (for example,
  veraPDF) before turning it on.
- **Header and footer:** two design ideas from October 2026 that were
  not adopted: the name at the left with an accent rule under it, and
  "Brian C. Keegan — CV · page *n* of *N*" in the footer of every page.
- **Footer date:** the date is the commit date in UTC, so a commit in
  the evening (Mountain time) shows the next day. Use the America/Denver
  time zone if this matters.

## Build and upkeep

- **TeX Live version:** each spring, after the new TeX Live is released,
  change `version` in `.github/workflows/build.yml` (2026 → 2027) and
  compare the new PDF with the old one.
- **Package list:** when `cv.cls` or `cv.tex` loads a new package, add
  it to `.github/texlive-packages.txt` (see README.md).

## Website

These items are in [brianckeegan/brianckeegan.github.io](https://github.com/brianckeegan/brianckeegan.github.io)
(roadmap item E-10 there):

- **One source for both CVs:** the web CV (`_data/cv.yml`) is edited by
  hand and is only a summary. Consider one data file that both
  `cv.tex` and the website read, which would also give a complete,
  accessible HTML CV.
