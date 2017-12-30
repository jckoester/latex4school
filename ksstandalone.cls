% TODO Hyperrref sauber einbinden
% TODO Biber sauber einbinden (optional)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ksstandalone}[2017/12/23 Private standalone class]

%
% % Zähler für die A-Formate:
% \newcount\@format
% % A4 Papier:
% \newif\if@afourpaper\@afourpaperfalse
% \DeclareOption{a4paper}{%
%   \@afourpapertrue
%   \PassOptionsToClass{\CurrentOption}{scrartcl}
% }
% % A5 Papier
% \newif\if@afivepaper\@afivepaperfalse
% \DeclareOption{a5paper}{%
%   \@afivepapertrue  
%   \PassOptionsToClass{\CurrentOption}{scrartcl}
% }
% % A6 Papier
% \newif\if@asixpaper\@asixpaperfalse
% \DeclareOption{a6paper}{%
%   \@asixpapertrue  
%   \PassOptionsToClass{\CurrentOption}{scrartcl}
% }

% % Querformat
% \newif\if@landscape\@landscapefalse
% \DeclareOption{landscape}{
%   \@landscapetrue
%   \PassOptionsToClass{\CurrentOption}{scrartcl}
% }

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
% \ExecuteOptions{a4paper}
% Ende der Optionenverarbeitung:
\ProcessOptions\relax

% Basisklasse scrartcl laden mit Standardoptionen (werden ggf. überschrieben)
\LoadClass[class=scrartcl, crop=true, varwidth=true]{standalone}
% Das alles könnte in ein Paket ksgeneral...
% packages required for the template
\usepackage{codesection}
\usepackage{templatetools}


% TODO: Include switches in these files to leave out KOMAvariables when in standalone
% TODO: Create a file to contain all general ksstyles and include them in the classes, overwrite when necessary!
% Encoding and Language
\input{inc/general-encoding.tex}
% Fonts
\input{inc/general-fonts.tex}
% General layout packages
% \input{inc/general-layout.tex}
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
\input{inc/general-exercises.tex}
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
% \KOMAoptions{twoside=off} % Es gibt keine rechte bzw. linke Seite TODO: als Option für doppelseitigen Druck?
% Überschriften: TODO: Gilt das nicht evtl. für alle Dokumente?
% \KOMAoptions{%
%    headings=big, % Big Font Size, large spacing above and below
%    numbers=noenddot %
% }%
% % Titel-Kommando ändern (KOMA-verträglich)
% \usepackage{titling}
% % Stil des Titels
% \renewcommand{\maketitle}{
%   \noindent\Huge\textsf{\thetitle}\normalsize\newline
% }
% \setkomafont{title}{\normalfont\sffamily}

% Stil der Überschriften
% \setkomafont{section}{\LARGE\normalfont\sffamily}% Schriftart und -größe
% \RedeclareSectionCommand[afterskip=9pt]{section}% Abstände
% \setkomafont{subsection}{\Large\normalfont\sffamily}% Schriftart und -größe
% \RedeclareSectionCommand[afterskip=6pt]{subsection}% Abstände
% \setkomafont{paragraph}{\normalfont\sffamily}% Schriftart und -größe
% \RedeclareSectionCommand[afterskip=3pt]{paragraph}% Abstände
%

% Stil der Absätze
% Abstände zwischen Absätzen (sollte auf ABs nicht nötig sein...)
% \KOMAoptions{%
%    parskip=absolute, % do not change indentation according to fontsize
%    parskip=false,    % indentation of 1em
% }%
\setlength\parindent{0pt} % Keine Einrückung

% Spaltenabstand für multicols:
\setlength{\columnsep}{2em}

% Aufzählungen: %TODO: Definitiv für alle richtig!
\usepackage{paralist}
\setlength{\itemsep}{-2pt} % Abstand der items (funktioniert das überhaupt?)
%
% % Kopf und Fußzeilen
% \cfoot{}
% \ifoot{}
% \ofoot{Ks}
