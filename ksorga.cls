% TODO Hyperrref sauber einbinden
% TODO Biber sauber einbinden (optional)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ksorga}[2015/06/28 Private worksheet class]

% Querformat
\newif\if@landscape\@landscapefalse
\DeclareOption{landscape}{
  \@landscapetrue
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}

% Chemiepakete laden?
\newif\if@chem\@chemfalse
\DeclareOption{chem}{
  \@chemtrue
}

% TikZ laden?
\newif\if@tikz\@tikzfalse
\DeclareOption{tikz}{
  \@tikztrue
}
\newif\if@bib\@bibfalse
\DeclareOption{bib}{
  \@bibtrue
}
% Standardwerte:

% Ende der Optionenverarbeitung:
\ProcessOptions\relax

% Basisklasse scrartcl laden mit Standardoptionen (werden ggf. überschrieben)
\LoadClass[11pt, a4paper, oneside]{scrartcl}

% Paket für das Seitenlayout
\RequirePackage{geometry}

% Layout ausführen:
\if@landscape%
  % A4 quer:
  \areaset[0cm]{24cm}{15cm}% Großer Abstand oben für Löcher
  \geometry{left=2cm,
    right=2cm,
    top=3.5cm,
    bottom=2cm,
  }
  \setlength{\voffset}{1.5cm}
\else%
  % A4 hoch:
  \geometry{left=2.5cm,
    right=2cm,
    top=0cm,
    bottom=3cm,}
  \areaset[1cm]{16.cm}{24cm}% Großer Abstand rechts für Löcher
  \setlength{\voffset}{1cm}
\fi%

% Das alles könnte in ein Paket ksgeneral...
% packages required for the template
\usepackage{codesection}
\usepackage{templatetools}

% Encoding und Sprache
\input{inc/general-encoding.tex}
% Schrift und Fonts
\input{inc/general-fonts.tex}
% Allgemeines und Pakete für das Layout
\input{inc/general-layout.tex}
% Farben
\input{inc/general-colors.tex}
% Tabellen
\input{inc/general-table.tex}
% Grafiken
\input{inc/general-figures.tex}
% Captions
\input{inc/general-captions.tex}
% Fußnoten
\input{inc/general-footnotes.tex}
% Zitate
\input{inc/general-quote-cite.tex}
% PDF Goodies
\input{inc/general-pdf.tex}

% Mathematik
\input{inc/maths.tex}
%Einheiten
\input{inc/units.tex}
% TikZ
% \input{inc/tikz.tex} % Als Option oben erledigt
% Chemie
%\input{inc/chem.tex} % Als Option oben erledigt

\if@chem%
  \input{inc/chem.tex}
\fi

\if@bib%
  \input{inc/bib.tex}
\fi

\if@tikz%
  \input{inc/tikz.tex}
\fi
%TODO: References


% Klassenspezifische Stile
\KOMAoptions{twoside=off} % Es gibt keine rechte bzw. linke Seite TODO: als Option für doppelseitigen Druck?
% Überschriften: TODO: Gilt das nicht evtl. für alle Dokumente?
\KOMAoptions{%
   headings=big, % Big Font Size, large spacing above and below
   numbers=noenddot %
}%
% Stil des Titels
\renewcommand{\maketitle}{
  \noindent\Huge\textsf{\thetitle}\normalsize\newline
}
\setkomafont{title}{\normalfont\sffamily}

% Stil der Überschriften
\setkomafont{section}{\LARGE\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=9pt]{section}% Abstände
\setkomafont{subsection}{\Large\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=6pt]{subsection}% Abstände
\setkomafont{paragraph}{\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=3pt]{paragraph}% Abstände


% Stil der Absätze
% Abstände zwischen Absätzen (sollte auf ABs nicht nötig sein...)
\KOMAoptions{%
   parskip=absolute, % do not change indentation according to fontsize
   parskip=false,    % indentation of 1em
}%
\setlength\parindent{0pt} % Keine Einrückung

% Spaltenabstand für multicols:
\setlength{\columnsep}{2em}

% Aufzählungen: %TODO: Definitiv für alle richtig!
\usepackage{paralist}
\setlength{\itemsep}{-2pt} % Abstand der items (funktioniert das überhaupt?)

% Kopf und Fußzeilen
\cfoot{}
\ifoot{}
\ofoot{Ks}

% Linie für Ablagestruktur
\newcommand{\lkrule}[0]{\arrayrulecolor{red}\specialrule{.1em}{.0em}{.0em}\arrayrulecolor{black}}
