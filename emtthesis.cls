\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emtthesis}[2018/10/18 EMTthesis]

% We live in 2018.
\usepackage[utf8]{inputenc}

% {{{ Class options
\RequirePackage{scrbase}
\DefineFamily{emtthesis}
\DefineFamilyMember{emtthesis}

% Thesis acceptance flag
% For doctoral theses, two variants of the title page are required, depending
% on whether the thesis is being submitted ("Prüfungsexemplar") or has already
% been accepted and is now to be published ("Belegexemplar").
% Choices:
% * no: Typeset the submission variant / Prüfungsexemplar.
% * yes: Typeset the publishing variant / Belegexemplar.
\newcommand{\accepted}{no}
\FamilyNumericalKey{emtthesis}{accepted}{accepted}{%
    {no}{no},%
    {yes}{yes},%
}

% Line spacing mode
% Typically, theses are typeset with 1.5x line spacing for the text. The table
% of contents, lists of figures, tables and symbols and bibliography use
% regular single spacing.
% Choices:
% * auto: Use above rules (default).
% * mainmatter: Use 1.5x spacing for the mainmatter only. This means that
%               preface and abstracts are set with single spacing.
% * never: Never use 1.5x spacing, i.e. use single spacing everywhere.
\newcommand{\onehalfspacingmode}{auto}
\FamilyNumericalKey{emtthesis}{onehalfspacingmode}{onehalfspacingmode}{%
    {auto}{auto},%
    {mainmatter}{mainmatter},%
    {never}{never}%
}

% Preface display switch
% Choices:
% * auto: Display preface for doctoral theses, but not for Bachelor's or Master's theses.
% * never: Do not display the preface for any thesis type.
% * always: Display the preface for any thesis type.
\newcommand{\preface}{auto}
\FamilyNumericalKey{emtthesis}{preface}{preface}{%
    {auto}{auto},%
    {never}{never},%
    {always}{always}%
}

% Thesis type (default: bsc)
% * bsc: Bachelor of Science (B.Sc.)
% * msc: Master of Science (M.Sc.)
% * dring: Doktor-Ingenieur (Dr.-Ing.)
% * drrernat: Doktor der Naturwissenschaften (Dr. rer. nat.)
\newcommand{\thesistype}{bsc}
\FamilyNumericalKey{emtthesis}{thesistype}{thesistype}{%
    {bsc}{bsc},%
    {msc}{msc},%
    {dring}{dring},%
    {drrernat}{drrernat},%
}

% Fallback option (for all options not explicitly defined above)
\DeclareOption*{%
    \ClassError{emtthesis}{Unknown option '\CurrentOption'.}{Check the documentation for valid options.}
}

% End of options section
\FamilyProcessOptions{emtthesis}

% Define thesis name by type.
\ifstr{\thesistype}{bsc}{%
    \newcommand{\thesisname}{Bachelorarbeit}
}{}
\ifstr{\thesistype}{msc}{%
    \newcommand{\thesisname}{Masterarbeit}
}{}
\ifstrstart{\thesistype}{dr}{%
    \newcommand{\thesisname}{Dissertation}
}{}
% }}}

% {{{ Load base class.
\LoadClass[
    % Show bibliography in table of contents.
    % There is no distinct rule on this, but in the class author's opinion, the
    % bibliography should be listed because it is placed between the main
    % content and the appendix (which is usually present in theses) and might
    % otherwise be overlooked.
    bibliography=totoc,
    %
    % Format table captions assuming placement above (not below) the table.
    % Note: The actual placement of caption is still controlled by where you
    % put the \caption statement. This setting only controls spacing etc.
    captions=tableheading,
    %
    fontsize=12pt,
    %
    % Do not use a period/dot at the end of chapter/section numbers.
    % Note: This is in direct violation of DUDEN guidelines! Normally, ending
    % periods are required whenever non-arabic digits are used for numbering.
    % When using an appendix (with numbering A, B etc.), this rule applies.
    % However, the class author strongly dislikes ending periods and therefore
    % takes the liberty of intentionally violating the guidelines.
    numbers=noendperiod,
]{scrbook}
% }}}

% {{{ Page layout
% Set main content's line spacing to be respected by the DIV-calculation.
\RequirePackage{setspace}
\ifstr{\onehalfspacingmode}{never}{\singlespacing}{\onehalfspacing}

% General page layout
\KOMAoptions{%
    % Default binding correction.
    % Users may override this by using e.g. \KOMAoptions{BCOR=15mm}.
    BCOR=12mm,
    %
    % Automatic calculation of type area.
    DIV=calc,
}

% Page header with UPB / EIM branding
\newcommand{\eimheader}{%
    \begin{minipage}{0.4\textwidth}
        \includegraphics[height=20mm]{logos/upb.pdf}
    \end{minipage}
    \hfill
    \begin{minipage}{0.4\textwidth}
        \flushright%
        \includegraphics[height=20mm]{logos/eim.pdf}
    \end{minipage}
    \vspace{10mm}
}

% Page footer with EMT branding
\newcommand{\emtfooter}{%
    \vfill
    \begin{minipage}{0.7\textwidth}
        \footnotesize
        Fachgebiet Elektrische Messtechnik \(\cdot\) EIM-E\\
        Warburger Straße 100 \(\cdot\) 33098 Paderborn
    \end{minipage}
    \hfill
    \begin{minipage}{0.25\textwidth}
        \flushright%
        \includegraphics[height=15mm]{logos/emt.pdf}
    \end{minipage}
}
% }}}

% {{{ Document metadata
\newcommand{\@salutation}{}
\newcommand{\salutation}[1]{\gdef\@salutation{#1}}
\newcommand{\@nameprefix}{}
\newcommand{\nameprefix}[1]{\gdef\@nameprefix{#1}}
\newcommand{\@namesuffix}{}
\newcommand{\namesuffix}[2][,]{\gdef\@namesuffix{#1~#2}}
\newcommand{\@advisorA}{}
\newcommand{\advisorA}[1]{\gdef\@advisorA{#1}}
\newcommand{\@advisorB}{}
\newcommand{\advisorB}[1]{\gdef\@advisorB{#1}}
\newcommand{\@examdate}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\@thesisnumber}{}
\newcommand{\thesisnumber}[1]{\gdef\@thesisnumber{#1}}
\newcommand{\@birthdate}{}
\newcommand{\birthdate}[1]{\gdef\@birthdate{#1}}
\newcommand{\@birthplace}{}
\newcommand{\birthplace}[1]{\gdef\@birthplace{#1}}
% }}}

% {{{ Included file names
% This class includes a number of external files that the user should fill with
% their content, e.g. preface, abstract or CV. Including a file provides better
% separation of content and better formatted code, compared to using macros for
% setting the corresponding (potentially substantial) content.
% However, the class should not include hard-coded file names, but allow the
% user to configure file inclusion. Therefore, we provide macros for each file,
% to be redefined if the user so chooses.
\newcommand{\prefacefile}{frontmatter/preface}
\newcommand{\germanabstractfile}{frontmatter/abstract_de}
\newcommand{\englishabstractfile}{frontmatter/abstract_en}
\newcommand{\symbolsfile}{frontmatter/symbols}
\newcommand{\problemstatementfile}{frontmatter/problemstatement}
\newcommand{\cvfile}{backmatter/cv}
\newcommand{\keywordsfile}{backmatter/keywords}
% }}}

% {{{ Used Packages
% Essential packages
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}

% Language-related
\RequirePackage[english,ngerman]{babel}
\RequirePackage[autostyle=true]{csquotes}

% Figure handling
\RequirePackage{graphicx}
\RequirePackage{xcolor}

% Table formatting
\RequirePackage{booktabs}
\RequirePackage{longtable}

% Bibliography
\RequirePackage[
    backend=biber,
    style=alphabetic,
    sorting=nyt,
]{biblatex}

\RequirePackage[
    hidelinks,
]{hyperref}
% }}}

% {{{ Document start and structure
% The overall document structure is this:
% * Titlepage
% * Problem statement (B.Sc. and M.Sc. only)
% * Preface (default on for Dr., off for B.Sc. and M.Sc.)
% * Abstract
% * Abstract in english (only for Dr.)
% * Table of Contents
% * List of figures
% * List of tables
% * List of abbreviations
% * List of mathematical symbols / operators
% * List of mathematical variables
% * Mainmatter chapters (as decided by the author)
% * Bibliography
% * Appendix (optional)

\AtBeginDocument{%
    % Begin frontmatter (enable roman page numbering etc.)
    \frontmatter

% Titlepage
    \singlespacing\KOMAoptions{DIV=current}

    \ifstrstart{\thesistype}{dr}{%
        % Titlepage for doctoral theses.
        \begin{titlepage}
            \eimheader%

            \begin{center}
                \ifstr{\accepted}{yes}{%
                    % Accepted thesis title page ("Belegexemplar")
                    \vfill
                    {\Large\bfseries\sffamily\@title\par}
                    \vspace{15mm}

                    {Von der Fakultät für Elektrotechnik, Informatik und Mathematik\\ der Universität Paderborn}
                    \vspace{2mm}

                    zur Erlangung des akademischen Grades
                    \vspace{5mm}

                    {\large
                    \ifstr{\thesistype}{dring}{Doktor der Ingenieurswissenschaften (Dr.-Ing.)}{}
                    \ifstr{\thesistype}{drrernat}{Doktor der Naturwissenschaften (Dr.~rer.~nat.)}{}
                    }
                    \vspace{5mm}

                    genehmigte Dissertation
                    \vspace{2mm}

                    von
                    \vspace{5mm}

                    {\large\@nameprefix~\@author\@namesuffix}
                    \vspace{15mm}

                    \begin{tabular}{ll}
                        Erster Gutachter: & \@advisorA\\
                        Zweiter Gutachter: & \@advisorB\\[1em]
                        Tag der mündlichen Prüfung: & \@examdate\\
                    \end{tabular}
                    \vspace{10mm}

                    Paderborn, \@date
                    \vspace{10mm}

                    Diss. EIM-E/\@thesisnumber
                }{%
                    % To-be-submitted thesis title page ("Prüfexemplar")
                    \vspace{25mm}
                    {\Large\bfseries\sffamily\@title\par}
                    \vspace{15mm}

                    {Der Fakultät für Elektrotechnik, Informatik und Mathematik\\ der Universität Paderborn}
                    \vspace{2mm}

                    zur Erlangung des akademischen Grades
                    \vspace{5mm}

                    {\large
                    \ifstr{\thesistype}{dring}{Doktor der Ingenieurswissenschaften (Dr.-Ing.)}{}
                    \ifstr{\thesistype}{drrernat}{Doktor der Naturwissenschaften (Dr.~rer.~nat.)}{}
                    }
                    \vspace{5mm}

                    vorgelegte Dissertation
                    \vspace{2mm}

                    von
                    \vspace{5mm}

                    {\large\@nameprefix~\@author\@namesuffix}
                    \vspace{5mm}

                    geboren am \@birthdate~in \@birthplace
                }
            \end{center}
        \end{titlepage}
    }{%
        % Titlepage and problem statement for Bachelor's and Master's theses.
        \begin{titlepage}
            \eimheader%

            \vspace{10mm}

            \begin{center}
                \large
                {\thesisname}
                \vspace{10mm}

                % Note: \par at the end is required for proper line spacing.
                {\LARGE\bfseries\sffamily\@title\par}
                \vspace{10mm}

                von
                \vspace{5mm}

                {\Large \@author}
                \vspace{20mm}

                \begin{tabular}{ll}
                    Betreuer:   & \@advisorA\\
                                & \@advisorB
                \end{tabular}
                \vspace{10mm}

                Paderborn, im \@date
            \end{center}

            \emtfooter%
        \end{titlepage}
        \begin{titlepage}
            \eimheader%

            \begin{center}
                \large\thesisname%
                \vspace{3mm}

                für
                \vspace{3mm}

                \@salutation~\@author
            \end{center}

            \vspace{5mm}

            \noindent\textsf{\textbf{\@title}}

            \vspace{5mm}

            \noindent\input{\problemstatementfile}

            \vspace{10mm}

            \noindent\@advisorA

            \emtfooter%
        \end{titlepage}
    }

    % Apply user-selected line spacing for preface and abstract
    \ifstr{\onehalfspacingmode}{auto}{\onehalfspacing}{\singlespacing}
    \KOMAoptions{DIV=current}

% Preface
    \ifstr{\preface}{auto}{%
        \ifstrstart{\thesistype}{dr}{\input{\prefacefile}}{}
    }{%
        \ifstr{\preface}{always}{\input{\prefacefile}}{}
    }

% Abstracts
    % German abstract
    \input{\germanabstractfile}

    % English abstract (only for doctoral theses)
    \ifstrstart{\thesistype}{dr}{%
        \input{\englishabstractfile}
    }{}


% Table of contents and lists of figures, tables, abbreviations etc.
    \singlespacing\KOMAoptions{DIV=current}

    % Table of contents
    \tableofcontents

    % Lists of figures and tables
    \listoffigures
    \listoftables

    % Index of abbreviations and symbols
    \input{\symbolsfile}

% Begin mainmatter, i.e. author content
    \mainmatter%

    \ifstr{\onehalfspacingmode}{never}{\singlespacing}{\onehalfspacing}
    \KOMAoptions{DIV=current}
}
% }}}

% {{{ Bibliography
% Automatically mark own publications with keyword "own", for later filtering.
%
% Note: We want the user to be able to \addbibresource as desired, using their
% document preamble. Since the following mapping must execute *after* adding
% the resources, we use \AtBeginDocument.
\AtBeginDocument{%
    \DeclareSourcemap{%
        \maps[datatype=bibtex]{%
            \map{%
                \step[fieldsource=author,
                    match=\@author,
                    final]
                \step[fieldset=keywords, fieldvalue=own]
            }
        }
    }
}

% Define note describing bibliography sorting.
\defbibnote{bibsorting}{Die Literaturangaben sind alphabetisch nach dem Nachnamen des ersten Autors und anschließend nach dem Erscheinungsjahr sortiert.}

% The bibliography is typeset with single line spacing, while the previous
% content (mainmatter) is usually set with 1.5x spacing. So, spacing must
% be switched, followed by a re-calculation of the typearea.
% However, using \KOMAoptions{DIV=current} in \AtBeginBibliography results in
% an unwanted page break directly after the bibliography heading, so it cannot
% be used. The following command is defined to prevent cluttering of the
% actual document file (e.g. thesis.tex).
\newcommand{\insertbibliography}{%
    \singlespacing\KOMAoptions{DIV=current}
    \ifstrstart{\thesistype}{dr}{%
        \ifstr{\accepted}{yes}{%
            % Include everything for the accepted variant of doctoral theses.
            \printbibliography[title=Literaturverzeichnis, segment=0, prenote=bibsorting]
        }{%
            % Include only other's publications for submission variant of doctoral theses.
            % In this variant, the author's own publications are set in a separate bibliography.
            \printbibliography[title=Literaturverzeichnis, notkeyword=own, segment=0, prenote=bibsorting]
        }
    }{%
        % Include everything for B.Sc. and M.Sc. theses.
        \printbibliography[title=Literaturverzeichnis]
    }
    \ifstr{\onehalfspacingmode}{never}{}{\onehalfspacing}
}
% }}}

% {{{ Backmatter
% For the submission / non-accepted variant of doctoral theses, the backmatter
% includes the author's CV, their list of publications and some keywords.
\ifstrstart{\thesistype}{dr}{%
    \ifstr{\accepted}{no}{%
        \AtEndDocument{%
            \backmatter%
            \singlespacing\KOMAoptions{DIV=current}

            \input{\cvfile}

            % Automatically include all sources that are marked with the keyword "own".
            \begin{refsegment}
                \nocite{*}
            \end{refsegment}
            \printbibliography[title={Eigene Publikationen}, keyword=own, segment=1]

            \input{\keywordsfile}
        }
    }{}
}{}
% }}}}
% vim: foldmethod=marker
