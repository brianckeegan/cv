% cv.cls -- an academic CV with section titles in the left margin.
%
% The layout follows res.cls with the [margin] option (Michael DeCorte,
% 1988; LaTeX2e port by Venkat Krishnamurthy, 2001), rebuilt on
% standard packages. See README.md for usage.
%
% Notice from res.cls, kept as its terms ask:
%   Copyright (c) 1988 by Michael DeCorte
%   Permission to copy all or part of this work is granted, provided
%   that the copies are not made or distributed for resale, and that
%   the copyright notice and this notice are retained.
%   THIS WORK IS PROVIDED ON AN "AS IS" BASIS. THE AUTHOR PROVIDES NO
%   WARRANTY WHATSOEVER, EITHER EXPRESS OR IMPLIED, REGARDING THE WORK,
%   INCLUDING WARRANTIES WITH RESPECT TO ITS MERCHANTABILITY OR FITNESS
%   FOR ANY PARTICULAR PURPOSE.
%
% Commands
%   \name{text}             your name, printed centered at the top
%   \address{text}          an address block; call once for the left
%                           block and again for the right block.
%                           Use \\ to break lines.
%   \makeheader             prints the name and addresses
%   \section{text}          a section title in the left margin.
%                           Use \\ to break the title into lines.
%   \note{text}             a bold "NOTE:" line under a section title
%   \subhead{text}          a bold run-in heading inside a section
%
% Environments
%   \begin{entries}{J} ... \end{entries}
%       A list numbered with the prefix J, counting down, so the newest
%       (first) item has the highest number: J13, J12, ..., J1. The
%       count comes from the previous run (.aux file), so a change in
%       the number of items needs one more LaTeX run; latexmk does
%       this for you. Use \awarditem in place of \item to put an award
%       icon before the label.
%
% The footer shows the page number and the date of the build. To show
% the date of the last commit instead, set SOURCE_DATE_EPOCH and
% FORCE_SOURCE_DATE=1 (.latexmkrc and the GitHub workflow do this).

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2026/10/18 v2.0 Academic CV with margin section titles]

\LoadClass[10pt,letterpaper]{article}

% ---------------------------------------------------------------
% Page layout: a 1.3in title column to the left of a 5.125in text
% block, with 1in margins outside them.
\newlength\sectionwidth
\setlength\sectionwidth{1.3in}
\RequirePackage[
  letterpaper,
  left=2.3in, textwidth=5.125in,
  top=1in, textheight=9in,
  headheight=0pt, headsep=0pt, footskip=30pt,
]{geometry}

\setlength\parindent{0pt}
\setlength\parskip{\baselineskip}

% ---------------------------------------------------------------
% Fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{fbb}
\RequirePackage{fontawesome5}
\RequirePackage{microtype}

% ---------------------------------------------------------------
% Color: one accent for links and section titles. #7A6A3A is the
% website's link color; it has a 5.3:1 contrast ratio on white, which
% passes WCAG 2.2 AA for text.
\RequirePackage{xcolor}
\definecolor{accent}{HTML}{7A6A3A}
\definecolor{rule}{gray}{0.75}

% ---------------------------------------------------------------
% Links, in the accent color so that readers can see them. xurl lets
% long URLs break at any character, so they do not run into the right
% margin. hyperref must load last.
\RequirePackage{xurl}
\renewcommand\UrlFont{\fontfamily{lmtt}\selectfont\small}  % Latin Modern: always installed
\RequirePackage[colorlinks, allcolors=accent, pdflang=en-US,
  pdfdisplaydoctitle]{hyperref}
\pdfstringdefDisableCommands{\def\\{ }}  % "\\" in section titles

% \doi{10.1145/3359135} prints "doi:10.1145/3359135" and links to
% https://doi.org/10.1145/3359135.
\newcommand*\doi[1]{\href{https://doi.org/#1}{\textsc{doi}:\nolinkurl{#1}}}

% ---------------------------------------------------------------
% Section titles: small capitals in the accent color, ragged right, in
% the margin column, under a thin rule across the full width. The first
% line of the title is on the same baseline as the first line of the
% text. The title is a zero-height box, so the text (or list) that
% follows moves up beside it. Each title is also a PDF bookmark.
\setcounter{secnumdepth}{0}
\newskip\sectionskip
\setlength\sectionskip{3.5ex plus 1ex minus .2ex}
\newcommand\sectionfont{\normalfont\scshape\color{accent}}
\newcounter{cv@section}
\renewcommand\section[1]{%
  \par
  \addpenalty{-500}%
  \addvspace{\sectionskip}%
  \hbox to \z@{\hskip-\sectionwidth
    \textcolor{rule}{\rule{\dimexpr\sectionwidth+\textwidth}{0.4pt}}\hss}%
  \nobreak
  \vskip 0.6\baselineskip
  \stepcounter{cv@section}%
  \pdfbookmark[1]{#1}{section.\arabic{cv@section}}%
  % \leavevmode starts the paragraph before \sectionfont: a \color
  % at the top of the \vtop would take the place of the first line,
  % and the title would drop one line below the text.
  \hbox to \z@{\hss\vtop to \z@{%
    \hsize\sectionwidth \parindent\z@ \parskip\z@
    \raggedright\leavevmode\sectionfont #1\par\vss}}%
  \nobreak
  \vskip-\baselineskip
  \vskip-\parskip
  \@afterheading}

\newcommand\note[1]{\textbf{NOTE:} #1\par}
\newcommand\subhead[1]{\par\textbf{#1}\par\nobreak\@afterheading}

% ---------------------------------------------------------------
% Lists. First-level labels hang to the left of the text.
\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[itemize,1]{leftmargin=0pt}
\setlist[itemize,2]{topsep=0pt}

% Numbered entries that count down.
\newlist{cv@entries}{enumerate}{1}
\newif\ifcv@award
\newcommand\awarditem{\global\cv@awardtrue\item}
\protected\def\cv@label{%
  \ifcv@award\faAward~\global\cv@awardfalse\fi
  \cv@prefix\cv@number}
\newcommand\cv@number{%
  \@ifundefined{cv@total@\cv@prefix}
    {??}
    {\number\numexpr\csname cv@total@\cv@prefix\endcsname
       - \value{cv@entriesi} + 1\relax}}
\setlist[cv@entries]{leftmargin=0pt, label=\cv@label}

\newenvironment{entries}[1]
  {\def\cv@prefix{#1}\begin{cv@entries}}
  {\cv@savetotal\end{cv@entries}}

% Write this run's count to the .aux file and ask for another run if
% it differs from the count of the last run.
\newcommand\cv@savetotal{%
  \immediate\write\@auxout{%
    \gdef\expandafter\noexpand\csname cv@total@\cv@prefix\endcsname
      {\the\value{cv@entriesi}}}%
  \@ifundefined{cv@total@\cv@prefix}
    {\cv@rerun}
    {\ifnum\csname cv@total@\cv@prefix\endcsname=\value{cv@entriesi}\else
       \cv@rerun\fi}}
\newcommand\cv@rerun{\AtEndDocument{%
  \@latex@warning@no@line{Entry counts have changed.
    Rerun to get the numbers right}}}

% ---------------------------------------------------------------
% Header: the name centered over the full width (title column and
% text), the first address at the left, the second at the right.
\newcommand\namefont{\LARGE\bfseries}
\newcommand*\name[1]{\def\cv@name{#1}}
\let\cv@name\@empty
\let\cv@addressone\@empty
\let\cv@addresstwo\@empty
\newcommand\address[1]{%
  \ifx\cv@addressone\@empty\def\cv@addressone{#1}\else\def\cv@addresstwo{#1}\fi}
\newcommand\cv@block[1]{\begin{tabular}[t]{@{}l@{}}#1\end{tabular}}
\newcommand\makeheader{%
  \begingroup
    \parskip\z@
    \noindent\hspace*{-\sectionwidth}%
    \makebox[\dimexpr\textwidth+\sectionwidth][c]{\namefont\cv@name}\par
    \vspace{12pt}%
    \noindent\hspace*{-\sectionwidth}%
    \makebox[\dimexpr\textwidth+\sectionwidth][s]{%
      \cv@block\cv@addressone\hfill\cv@block\cv@addresstwo}\par
  \endgroup}

% ---------------------------------------------------------------
% Footer: page number centered, date at the right.
\newcommand\cvdate{\number\day~\ifcase\month\or
  January\or February\or March\or April\or May\or June\or July\or
  August\or September\or October\or November\or December\fi
  ~\number\year}
\def\ps@cv{%
  \let\@oddhead\@empty \let\@evenhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil\llap{\cvdate}}%
  \let\@evenfoot\@oddfoot}
\pagestyle{cv}

\endinput
