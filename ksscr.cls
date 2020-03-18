% TODO Hyperrref sauber einbinden
% TODO Biber sauber einbinden (optional)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ksscr}[2015/06/28 Private class for planning units]


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
\LoadClass[11pt, a4paper]{scrreprt}

% Paket für das Seitenlayout
\RequirePackage{geometry}

% Layout ausführen:
\if@landscape%
  % A4 quer:
  \areaset[0cm]{24cm}{15cm}% Großer Abstand oben für Löcher
  \geometry{left=2cm,
    right=2cm,
    top=2.5cm,
    bottom=2.5cm,
  }
  \setlength{\voffset}{1.5cm}
\else%
  % A4 hoch:
  \geometry{
    left=2.5cm,
    right=2.5cm,
    top=0cm,
    bottom=3cm,}
  \areaset[1cm]{16.cm}{24cm}% Großer Abstand rechts für Löcher
  \setlength{\voffset}{1cm}
\fi%

% Das alles könnte in ein Paket ksgeneral...
% packages required for the template
\usepackage{codesection}
\usepackage{templatetools}
% Listen, Inhaltsverszeichnisse (nur ue und script)
%\usepackage{tocloft}

% TEST
\usepackage{scrextend}

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

% General mathematic packages
\input{inc/general-maths.tex}

% Mathematik
\input{inc/maths.tex}
%Einheiten
\input{inc/units.tex}

\if@chem%
  \input{inc/chem.tex}
\fi

\if@bib%
  \input{inc/bib.tex}
\fi

\if@tikz%
  \input{inc/tikz.tex}
\fi

% Rahmen
\input{inc/general-frames.tex}
%TODO: References

% eigene Commands:
\input{inc/commands.tex}
\input{inc/commands-ksue.tex}

% Klassenspezifische Stile
%\KOMAoptions{twoside=off} % Es gibt keine rechte bzw. linke Seite TODO: als Option für doppelseitigen Druck?
% Überschriften: TODO: Gilt das nicht evtl. für alle Dokumente?
\KOMAoptions{%
   headings=big, % Big Font Size, large spacing above and below
   numbers=noenddot, %
   chapterprefix=true, %
%    autooneside=false, %
   twoside %Zweiseitige Ausgabe für das Skript (???) evtl. nur PDF??? OPTION???
%    automark,
%    open=right
}%
% Stil des Titels
% \renewcommand{\maketitle}{
%   \noindent\Huge\textsf{\thetitle}\normalsize\newline
% }
\setkomafont{title}{\normalfont\sffamily}

% Stil der Überschriften
\setkomafont{section}{\LARGE\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=9pt]{section}% Abstände
\setkomafont{subsection}{\Large\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=6pt]{subsection}% Abstände
\setkomafont{paragraph}{\normalfont\sffamily}% Schriftart und -größe
\RedeclareSectionCommand[afterskip=3pt]{paragraph}% Abstände

% Stil der Kapitelseiten:
% Setup background
\usepackage[some]{background}
\definecolor{chapterpagecolor}{cmyk}{0,0,0,0.5}
\backgroundsetup{
  scale=1,
  angle=0,
  opacity=1,
  contents={\begin{tikzpicture}[remember picture,overlay]
   \path [fill=chapterpagecolor] (-0.5\paperwidth,5) rectangle (0.5\paperwidth,10);  
  \end{tikzpicture}}
}
% \usepackage[automark]{scrlayer-scrpage}
% Define a new style for chapter headings
\newpairofpagestyles[scrheadings]{chapter}{
  % No header or footer
  \KOMAoptions{
    headsepline=0pt,
    %footsepline=0pt, 
  }
  \ihead*{}
  \ohead*{}
  \chead*{}
  % Add background
  \BgThispage
  \cfoot*{}
  \ofoot*{\pagemark}
  \ifoot*{Ks}
%   \ofoot*{}
%   \ifoot*{}
} 
% Set previously defined page style
\renewcommand*{\chapterpagestyle}{chapter}

% Customize chapter prefix
\renewcommand*{\chapterformat}{%
     \LARGE\textbf{\textsf{\chapappifchapterprefix{\nobreakspace}\thechapter}\autodot\enskip%\\[2ex]
     }}%
% Customize space between chapter prefix and chapter title
\RedeclareSectionCommand[
  innerskip=-\parskip
]{chapter}  
% Style chapter title
\addtokomafont{chapter}{\Huge\textbf\textsf\color{white}}
% Set space before chapter heading
\renewcommand\chapterheadstartvskip{%
  \vspace*{2.2cm}
}
% Set space after chapter heading
\appto\chapterheadendvskip{%
  \vspace{5cm}
}


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


% Numerierungen
% Auch Absätze brauchen Nummern, um korrekt referenziert werden zu können:
% Oder auch nicht, denn 6.5.1.2.1 ist definitiv nicht schön!
%  \setcounter{secnumdepth}{6}
% \renewcommand\thepart{\arabic{part}}
% \renewcommand{\theequation}{\thepart.\arabic{equation}}
\renewcommand{\thereaction}{\thechapter.\arabic{reaction}}
\chemsetup[reactions]{
  before-tag = R ,
  tag-open = [ ,
  tag-close = ]
}
% Kopf und Fußzeilen
% \renewcommand{\pagestyle}{scrheadings}
\pagestyle{scrheadings}
% \clearscrheadfoot% voreingestellte Einträge löschen
%
% % nummerierte Kapitel:
% \renewcommand{\chaptermark}[1]{%
% \markboth{\chapapp\ \thechapter\autodot}{#1}}
% % nicht nummerierte Kaptitel:
% \renewcommand{\addchapmark}[1]{\markboth{#1}{#1}}
%
% \cehead{\leftmark}
% \cohead{\rightmark}
  \ofoot[\pagemark]{\pagemark}% Seitenzahl immer
% \ohead*{\leftmark \rightmark}
% \cfoot{}
%  \lofoot{\pagemark}
% \ifoot{Ks}

 \KOMAoption{listof}{leveldown}