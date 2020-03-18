% TODO Hyperrref sauber einbinden
% TODO Biber sauber einbinden (optional)

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ksbeamer}[2018/01/16 Private class for presentations]


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

%% Defining slides as in http://tug.org/pracjourn/2010-2/hofert/scientific_presentations_practex.pdf
% and https://www.latextemplates.com/template/koma-script-presentation
% TODO: Rework! Urgently!

\PassOptionsToPackage{landscape, paper=128mm:96mm}{typearea}
\LoadClass[
% landscape,
% paper=128mm:96mm, % The same paper size as used in the beamer class
fontsize=11pt, % Font size
pagesize, % Write page size to dvi or pdf
parskip=half-, % Paragraphs separated by half a line
]{scrartcl} % KOMA script (article)


\linespread{1.12} % Increase line spacing for readability

%------------------------------------------------
% Margins
\usepackage[ % Page margins settings
% total={128mm,96mm},
includeheadfoot,
top=3.5mm,
bottom=1.5mm,
left=5.5mm,
right=5.5mm,
headsep=6.5mm,
footskip=8.5mm
]{geometry}
% %------------------------------------------------


%
% % Das alles könnte in ein Paket ksgeneral...
% % packages required for the template
\usepackage{codesection}
\usepackage{templatetools}
% % % Listen, Inhaltsverszeichnisse (nur ue und script)
\usepackage{tocloft}
% % % Encoding und Sprache
\input{inc/general-encoding.tex}
% % Schrift und Fonts
\input{inc/general-fonts.tex}
% % Allgemeines und Pakete für das Layout
% \input{inc/general-layout.tex}
\usepackage{multicol}
% % Farben
\input{inc/general-colors.tex}
% % Tabellen
\input{inc/general-table.tex}
% % Grafiken
\input{inc/general-figures.tex}
% % Captions
\input{inc/general-captions.tex}
% % Fußnoten
\input{inc/general-footnotes.tex}
% % Zitate
\input{inc/general-quote-cite.tex}
% % PDF Goodies
\input{inc/general-pdf.tex}
%
% % General mathematic packages
\input{inc/general-maths.tex}
%
% % Mathematik
\input{inc/maths.tex}
% %Einheiten
\input{inc/units.tex}
%
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
% \renewcommand{\thereaction}{\thechapter.\arabic{reaction}}
\chemsetup[reactions]{
  before-tag = R ,
  tag-open = [ ,
  tag-close = ]
}

% Various required packages
\usepackage{amsthm} % Required for theorem environments
\usepackage{bm} % Required for bold math symbols (used in the footer of the slides)
\usepackage{graphicx} % Required for including images in figures
\usepackage{tikz} % Required for colored boxes
\usepackage{booktabs} % Required for horizontal rules in tables
\usepackage{multicol} % Required for creating multiple columns in slides
\usepackage{lastpage} % For printing the total number of pages at the bottom of each slide
\usepackage{microtype} % Better typography
\usepackage{tocstyle} % Required for customizing the table of contents
%------------------------------------------------
% Slide layout configuration
\usepackage{scrpage2} % Required for customization of the header and footer
\pagestyle{scrheadings} % Activates the pagestyle from scrpage2 for custom headers and footers
\clearscrheadfoot % Remove the default header and footer
\setkomafont{pageheadfoot}{\normalfont\color{black}\sffamily} % Font settings for the header and footer

% Sets vertical centering of slide contents with increased space between paragraphs/lists
\makeatletter
\renewcommand*{\@textbottom}{\vskip \z@ \@plus 1fil}
\newcommand*{\@texttop}{\vskip \z@ \@plus .5fil}
\addtolength{\parskip}{\z@\@plus .25fil}
\makeatother

% Remove page numbers and the dots leading to them from the outline slide
\makeatletter
\newtocstyle[noonewithdot]{nodotnopagenumber}{\settocfeature{pagenumberbox}{\@gobble}}
\makeatother
\usetocstyle{nodotnopagenumber}

% \AtBeginDocument{\renewcaptionname{german}{\contentsname}{\Large Outline}} % Change the name of the table of contents
%------------------------------------------------

%------------------------------------------------
% Header configuration - if you don't want a header remove this block
\ihead{
\hspace{-2mm}
\begin{tikzpicture}[remember picture,overlay]
\node [xshift=\paperwidth/2,yshift=-\headheight] (mybar) at (current page.north west)[rectangle,fill,inner sep=0pt,minimum width=\paperwidth,minimum height=2\headheight,
% top color=chapterpagecolor!64,bottom color=chapterpagecolor
color=chapterpagecolor
]{}; % Colored bar
\node[below of=mybar,yshift=3.3mm,rectangle,shade,inner sep=0pt,minimum width=128mm,minimum height =1.5mm,top color=black!50,bottom color=white]{}; % Shadow under the colored bar shadow
\end{tikzpicture}
\color{white}\runninghead} % Header text defined by the \runninghead command below and colored white for contrast
%------------------------------------------------

%------------------------------------------------
% Footer configuration
\setlength{\footheight}{4mm} % Height of the footer
\addtokomafont{pagefoot}{\tiny} % Small font size for the footnote

\ifoot{% Left side
\hspace{-4mm}
\begin{tikzpicture}[remember picture,overlay]
\node [xshift=\paperwidth/2] at (current page.south west)[rectangle,fill,inner sep=0pt,minimum width=\paperwidth,minimum height=\footheight*2,color=hellgrau!30]{}; % Gray box

\node [xshift=\paperwidth/2,yshift=\footheight] at (current page.south west)[rectangle,fill,inner sep=0pt,minimum width=\paperwidth,minimum height=1pt,top color=chapterpagecolor,bottom color=chapterpagecolor]{}; % Green bar

\end{tikzpicture}
\myauthor\ \raisebox{0.2mm}{$\bm{\vert}$}\ \myuni % Left side text
}

\ofoot[\pagemark/\pageref{LastPage}\hspace{-2mm}]{\pagemark/\pageref{LastPage}\hspace{-2mm}} % Right side
%------------------------------------------------

%------------------------------------------------
% Section spacing - deeper section titles are given less space due to lesser importance
%\usepackage{titlesec} % Required for customizing section spacing
%\titleformat{\section}{\Large\normalfont\sffamily\bfseries}{\thesection}{0}{}
%\titlespacing{\section}{0mm}{0mm}{0mm}[] % Lengths are: left, before, after
% \titlespacing{\subsection}{0mm}{0mm}{-1mm} % Lengths are: left, before, after
% \titlespacing{\subsubsection}{0mm}{0mm}{-2mm} % Lengths are: left, before, after
\setcounter{secnumdepth}{0} % How deep sections are numbered, set to no numbering by default - change to 1 for numbering sections, 2 for numbering sections and subsections, etc
% %------------------------------------------------
\setlength\parindent{0pt} % Keine Einrückung