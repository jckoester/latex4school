% TODO Hyperrref sauber einbinden
% TODO Biber sauber einbinden (optional)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ksab}[2015/06/28 Private worksheet class]

% Zähler für die A-Formate:
\newcount\@format
% A4 Papier:
\newif\if@afourpaper\@afourpaperfalse
\DeclareOption{a4paper}{%
  \@afourpapertrue
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}
% A5 Papier
\newif\if@afivepaper\@afivepaperfalse
\DeclareOption{a5paper}{%
  \@afivepapertrue  
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}
% A6 Papier
\newif\if@asixpaper\@asixpaperfalse
\DeclareOption{a6paper}{%
  \@asixpapertrue  
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}

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
\ExecuteOptions{a4paper}
% Ende der Optionenverarbeitung:
\ProcessOptions\relax

% Basisklasse scrartcl laden mit Standardoptionen (werden ggf. überschrieben)
\LoadClass[11pt, oneside]{scrartcl}

% Paket für das Seitenlayout
\RequirePackage{geometry}

% Layout ausführen:
\if@afourpaper
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
\fi%

\if@afivepaper
  \if@landscape%
  % A5 quer:
  \areaset[1cm]{16cm}{10cm}% Großer Abstand rechts für Löcher
  \geometry{left=2cm,
    right=2cm,
    top=1cm,
    bottom=4cm,}
  \setlength{\voffset}{1cm}
  \else%
  % A5 hoch:
    \areaset[1cm]{10cm}{15cm}% Großer Abstand rechts für Löcher
  \geometry{left=2.5cm,
    right=2cm,
    top=1cm,
    bottom=4cm,}
  \setlength{\voffset}{1cm}
  \fi%
\fi%

\if@asixpaper
  \if@landscape%
  % A6 quer:
  \areaset[0cm]{9cm}{5cm}% Ab A6 kein Lochrand mehr (-> für Kärtchen gedacht)
  \geometry{left=1cm,
    right=1cm,
    top=1cm,
    bottom=3cm,}
  \setlength{\voffset}{0.5cm}
  \else%
  % A6 hoch:
    \areaset[0cm]{4cm}{9cm}% Ab A6 kein Lochrand mehr (-> für Kärtchen gedacht)
%   \setlength{\textwidth}{4cm}
%   \setlength{\textheight}{8cm}
  \geometry{left=1cm,
    right=1cm,
    top=0cm,
    bottom=4cm
    }
  \setlength{\voffset}{0.5cm}
  \fi%
\fi%

% Das alles könnte in ein Paket ksgeneral...
% packages required for the template
\usepackage{codesection}
\usepackage{templatetools}



% Encoding and Language
\input{inc/general-encoding.tex}
% Fonts
\input{inc/general-fonts.tex}
% General layout packages
\input{inc/general-layout.tex}
% Colours
\input{inc/general-colors.tex}
% Tables
\input{inc/general-table.tex}
% Graphics
\input{inc/general-figures.tex}
% Captions
\input{inc/general-captions.tex}
% Footnotes
\input{inc/general-footnotes.tex}
% Citation
\input{inc/general-quote-cite.tex}
% General mathematic packages
\input{inc/general-maths.tex}

\if@tikz%
  \input{inc/tikz.tex}
\fi

% Rahmen
\input{inc/general-frames.tex}
% PDF Goodies
\input{inc/general-pdf.tex}

% Exercisesheets:
%TODO: move to seperate class and configure
% \let\vary\relax
% \RequirePackage[load-headings]{exsheets}
% \SetupExSheets{
%   totoc ,
%   headings = block-rev
% }
%

% Mathematik
\input{inc/maths.tex}
%Einheiten
\input{inc/units.tex}
% TikZ
% \input{inc/tikz.tex} % Als Option oben erledigt
% Chemie
%\input{inc/chem.tex} % Als Option oben erledigt
% Symbole
\input{inc/general-symbols.tex}


\if@chem%
  \input{inc/chem.tex}
\fi

\if@bib%
  \input{inc/bib.tex}
\fi



%TODO: References
% eigene Commands:
\input{inc/commands.tex}

% Klassenspezifische Stile
\KOMAoptions{twoside=off} % Es gibt keine rechte bzw. linke Seite TODO: als Option für doppelseitigen Druck?
% Überschriften: TODO: Gilt das nicht evtl. für alle Dokumente?
\KOMAoptions{%
   headings=big, % Big Font Size, large spacing above and below
   numbers=noenddot %
}%
% Titel-Kommando ändern (KOMA-verträglich)
\usepackage{titling}
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
