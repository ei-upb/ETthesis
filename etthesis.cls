\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{etthesis}[2025 ETthesis]

% {{{ Class options
\RequirePackage{scrbase}
\DefineFamily{etthesis}
\DefineFamilyMember{etthesis}

% Ensure compatibility with KOMA Script before version 3.28
% (as per https://komascript.de/faq_deprecatedif)
\providecommand*{\Ifstr}{\ifstr}
\providecommand*{\Ifstrstart}{\ifstrstart}

% Language
% Choose between english or german to adjust titles, logos, etc.
% Choices:
% * german (default)
% * english
\newcommand*{\lang}{german}
\FamilyNumericalKey{etthesis}{lang}{lang}{%
    {german}{german},%
    {english}{english},%
}

% Document type
% Choices:
% * bachelors: Bachelor's thesis (default).
% * dring: Doctoral thesis (Dr.-Ing.).
% * drrernat: Doctoral thesis (Dr. rer. nat.).
% * masters: Master's thesis.
% * project: Project ("Projektarbeit").
% * report: ET-branded report.
% * sa: "Studienarbeit".
\newcommand*{\doctype}{bachelors}
\FamilyNumericalKey{etthesis}{doctype}{doctype}{%
    {bachelors}{bachelors},%
    {dring}{dring},%
    {drrernat}{drrernat},%
    {masters}{masters},%
    {project}{project},%
    {report}{report},%
    {sa}{sa},%
}

% Document state
% Publication state of the document. This affects the default line spacing for
% all documents as well as the title page and backmatter of doctoral theses
% ("Prüfungsexemplar" and "Belegexemplar", as per the official requirements).
% For reduced-anxiety editing, a preliminary mode is also available, providing
% document like the "submission" variant, but with scary parts like the very
% officially-looking title page removed.
%
% Choices:
% * preliminary: Like "submission", but eliminate possible sources of author
%                anxiety.
% * submission: Typeset the submission variant / Prüfungsexemplar (default).
% * accepted: Typeset the publishing variant / Belegexemplar.
\newcommand*{\docstate}{submission}
\FamilyNumericalKey{etthesis}{docstate}{docstate}{%
    {submission}{submission},%
    {accepted}{accepted},%
    {preliminary}{preliminary},%
}

% Line spacing
% By default, when documents are typeset for submission and grading, we use
% 1.5x line spacing, while for publishing, we use regular single spacing (the
% latter usually occurring for doctoral theses only).
% Note that this rule only applies to the author's own written text, i.e. the
% main body of the document. Conversely, the table of contents, list of figures
% and tables, list of symbols, bibliography, problem statement and affirmation
% are always typeset with single spacing, if present.
% Choices:
% * auto: Use above rules, according to the value of \docstate (default).
% * single: Use single spacing everywhere.
% * onehalf: Use 1.5x line spacing for author text.
\newcommand*{\linespacing}{auto}
\FamilyNumericalKey{etthesis}{linespacing}{linespacing}{%
    {auto}{auto},%
    {single}{single},%
    {onehalf}{onehalf}%
}

% Paper format
% Choices:
% * a4: Use DIN A4 paper format with 12pt font size (default).
% * a4onesided: Use DIN A4 paper format with 12pt font size, one-sided
%               layout and no binding correction for digital submission.
% * a5: Use DIN A5 paper format with 10pt font size for a more compact layout.
\newcommand*{\paperformat}{a4}
\FamilyNumericalKey{etthesis}{paperformat}{paperformat}{%
    {a4}{a4},%
    {a4onesided}{a4onesided},%
    {a5}{a5},%
}

% Preface display switch
% Choices:
% * auto: Display preface for doctoral theses only (default).
% * never: Do not display the preface.
% * always: Display the preface.
\newcommand*{\preface}{auto}
\FamilyNumericalKey{etthesis}{preface}{preface}{%
    {auto}{auto},%
    {never}{never},%
    {always}{always}%
}

% Problem statement display switch
% Choices:
% * auto: Display problem statement for student theses only (default).
% * never: Do not display the problem statement.
% * always: Display the problem statement.
\newcommand*{\problem}{auto}
\FamilyNumericalKey{etthesis}{problem}{problem}{%
    {auto}{auto},%
    {never}{never},%
    {always}{always}%
}

% Abstract display switch
% Typically, abstracts in german and english are required for doctoral theses.
% For student theses, it is an abstract in the theses' language. Reports have
% no abstract by default.
% Choices:
% * auto: Use above rules, according to the value of \docstate (default).
% * one: Display only one abstract.
% * both: Display both abstracts (german and english).
% * none: Do not display abstracts.
\newcommand*{\abstracts}{auto}
\FamilyNumericalKey{etthesis}{abstracts}{abstracts}{%
    {auto}{auto},%
    {one}{one},%
    {both}{both},%
    {none}{none},%
}

% Affirmation display switch
% For student theses, this is to affirm that the submitting author is the
% original author of the content and all external content has been fully
% declared.
% Choices:
% * auto: Display for student theses only (default).
% * always: Display affirmation.
% * never: Do not display affirmation.
\newcommand*{\affirmation}{auto}
\FamilyNumericalKey{etthesis}{affirmation}{affirmation}{%
    {auto}{auto},%
    {always}{always},%
    {never}{never},%
}

% Single author cite labels
% If enabled, publications are always represented by a single-name cite label,
% even if multiple authors are defined. For authors Mustermann and Doe, the
% result would e.g. be [Mus18], not [MD18].
% Choices:
% * false: Disable single-author labels (default).
% * true: Enable single-author labels.
\newcommand*{\singlecitelabel}{false}
\FamilyNumericalKey{etthesis}{singlecitelabel}{singlecitelabel}{%
    {false}{false},%
    {true}{true},%
}

% Minted package loading
% Source code listings are often required in theses. Typically, they are
% typeset with either the listings package or the newer minted package.
% Because of sub-dependencies on packages required by this class, minted cannot
% be loaded by the user in their preamble, so it must be supported here.
% Choices:
% * false: Do not load the minted package (default).
% * true: Do load the minted package.
\newcommand*{\useminted}{false}
\FamilyNumericalKey{etthesis}{useminted}{useminted}{%
    {false}{false},%
    {true}{true},%
}

% Fallback option (for all options not explicitly defined above)
\DeclareOption*{%
    % Show error if using obsolete class options
    \Ifstrstart{\CurrentOption}{thesistype}{%
        \ClassError{etthesis}{Using obsolete option 'thesistype', use 'doctype' instead}{The 'thesistype' option is obsolete and can no longer be used. Use 'doctype' instead.}
    }{}
    \Ifstrstart{\CurrentOption}{onehalfspacingmode}{%
        \ClassError{etthesis}{Using obsolete option 'onehalfspacingmode', use 'linespacing' instead}{The 'onehalfspacingmode' option is obsolete and can no longer be used. Use 'linespacing' instead.}
    }{}
    % Show error if using invalid class options
    \ClassError{etthesis}{Unknown option '\CurrentOption'.}{Check the documentation for valid options.}
}

% End of options section
\FamilyProcessOptions{etthesis}
% }}}

% {{{ Class option handling

% Load translations
\input{translate.sty}

% Default options
\newcommand*{\includepreface}{}
\newcommand*{\includeabstracts}{\etAbstract}
\newcommand*{\includeproblemstatement}{}
\newcommand*{\includeaffirmation}{}
\newcommand*{\hasbackmatter}{false}

% Decisions by document type
\Ifstr{\doctype}{bachelors}{%
    \newcommand*{\doctypename}{\bachelorsthesis}
    \newcommand*{\includetitlepage}{\etTitleStudent}
    \renewcommand*{\includeproblemstatement}{\etProblemStatement}
    \renewcommand*{\includeaffirmation}{\etAffirmation}
    \renewcommand*{\hasbackmatter}{true}
}{}
\Ifstr{\doctype}{masters}{%
    \newcommand*{\doctypename}{\mastersthesis}
    \newcommand*{\includetitlepage}{\etTitleStudent}
    \renewcommand*{\includeproblemstatement}{\etProblemStatement}
    \renewcommand*{\includeaffirmation}{\etAffirmation}
    \renewcommand*{\hasbackmatter}{true}
}{}
\Ifstr{\doctype}{project}{%
    \newcommand*{\doctypename}{\projectreport}
    \newcommand*{\includetitlepage}{\etTitleStudent}
}{}
\Ifstr{\doctype}{report}{%
    \newcommand*{\doctypename}{\report}
    \newcommand*{\includetitlepage}{\etTitleReport}
    \renewcommand*{\includeabstracts}{}
}{}
\Ifstr{\doctype}{sa}{%
    \newcommand*{\doctypename}{\studentpaper}
    \newcommand*{\includetitlepage}{\etTitleStudent}
    \renewcommand*{\includeproblemstatement}{\etProblemStatement}
    \renewcommand*{\includeaffirmation}{\etAffirmation}
    \renewcommand*{\hasbackmatter}{true}
}{}
\Ifstrstart{\doctype}{dr}{%
    \newcommand*{\doctypename}{Dissertation}
    \Ifstr{\doctype}{dring}{\newcommand*{\doctoraltitle}{Doktor der Ingenieurwissenschaften (Dr.-Ing.)}}{}
    \Ifstr{\doctype}{drrernat}{\newcommand*{\doctoraltitle}{Doktor der Naturwissenschaften (Dr.~rer.~nat.)}}{}
    \Ifstr{\docstate}{accepted}{%
        \newcommand*{\includetitlepage}{\etTitleDocAccepted}
        \renewcommand*{\includepreface}{\etPreface}
    }{%
        \newcommand*{\includetitlepage}{\etTitleDocSubmission}
        \renewcommand*{\hasbackmatter}{true}
    }
    \renewcommand*{\includeabstracts}{\etAbstract\etAbstractAdd}
}{}

% Decide citation label format
\Ifstr{\singlecitelabel}{true}{%
    \newcommand*{\citelabelauthornum}{1}
}{%
    \newcommand*{\citelabelauthornum}{3}
}

% Decide on line spacing in the main body of the document
\newcommand*{\bodylinespacing}{\singlespacing}
\Ifstr{\linespacing}{auto}{%
    \Ifstr{\docstate}{accepted}{}{\renewcommand*{\bodylinespacing}{\onehalfspacing}}
}{}
\Ifstr{\linespacing}{onehalf}{\renewcommand*{\bodylinespacing}{\onehalfspacing}}{}

% Explicit / independent settings
\Ifstr{\docstate}{preliminary}{\renewcommand*{\includetitlepage}{\etTitlePrelim}}{}
\Ifstr{\preface}{always}{\renewcommand*{\includepreface}{\etPreface}}{}
\Ifstr{\preface}{never}{\renewcommand*{\includepreface}{}}{}
\Ifstr{\abstracts}{one}{\renewcommand*{\includeabstracts}{\etAbstract}}{}
\Ifstr{\abstracts}{both}{\renewcommand*{\includeabstracts}{\etAbstract\etAbstractAdd}}{}
\Ifstr{\abstracts}{none}{\renewcommand*{\includeabstracts}{}}{}
\Ifstr{\problem}{always}{\renewcommand*{\includeproblemstatement}{\etProblemStatement}}{}
\Ifstr{\problem}{never}{\renewcommand*{\includeproblemstatement}{}}{}
\Ifstr{\affirmation}{always}{%
    \renewcommand*{\includeaffirmation}{\etAffirmation}%
    \renewcommand*{\hasbackmatter}{true}%
}{}
\Ifstr{\affirmation}{never}{%
    \renewcommand*{\includeaffirmation}{}%
    \renewcommand*{\hasbackmatter}{false}%
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
    % Do not use a period/dot at the end of chapter/section numbers.
    % Note: This is in direct violation of DUDEN guidelines! Normally, ending
    % periods are required whenever non-arabic digits are used for numbering.
    % When using an appendix (with numbering A, B etc.), this rule applies.
    % However, the class author strongly dislikes ending periods and therefore
    % takes the liberty of intentionally violating the guidelines.
    numbers=noendperiod,
    %
    % New versions of the KOMA classes use the bookmark package, which causes
    % issues with hyperref. This feature is thus currently disabled.
    bookmarkpackage=false,
]{scrbook}
% }}}

% Default binding correction.
% Users may override this by using e.g. \KOMAoptions{BCOR=15mm}.
\KOMAoptions{    % Default binding correction.
	% Users may override this by using e.g. \KOMAoptions{BCOR=15mm}.
	BCOR=12mm,
	}%
%
% {{{ Page layout
% Set paper format
\Ifstr{\paperformat}{a4}{%
    \KOMAoptions{
        paper=a4,
        fontsize=12pt,
    }%
}{}
\Ifstr{\paperformat}{a4onesided}{%
    \KOMAoptions{
        paper=a4,
        fontsize=12pt,
        twoside=false,
        BCOR=0mm,
    }%
}{}
\Ifstr{\paperformat}{a5}{%
    \KOMAoptions{
        paper=a5,
        fontsize=10pt,
        headinclude=true,
    }%
}{}

% Load setspace package for easy use of \singlespacing, \onehalfspacing and \doublespacing commands
\RequirePackage{setspace}

% General page layout
\KOMAoptions{%
    % Automatic calculation of type area.
    DIV=calc,
}

% Set main content's line spacing to be respected by the DIV-calculation.
\bodylinespacing
\KOMAoptions{%
	% Recalculation of type area.
	DIV=last,
}

% Page header with UPB / EIM branding
\newcommand*{\eimheader}{%
    \begin{minipage}[t]{0.4\textwidth}
        \includegraphics[height=4em]{\upblogopath}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.4\textwidth}
        \flushright%
        \includegraphics[height=1.5em]{\eimlogopath}
    \end{minipage}
}

% Page footer with group branding
\newcommand*{\etfooter}{%
    \vfill
    \begin{minipage}{0.7\textwidth}
        \footnotesize
        \@group{} \(\cdot\) EIM-E\\
        Warburger Straße 100 \(\cdot\) 33098 Paderborn
    \end{minipage}
    \hfill
    % Create mini page only if group logo path is not empty
    \Ifstr{\@grouplogo}{}{}{%
        \begin{minipage}{0.25\textwidth}
            \flushright%
            \includegraphics[width=\linewidth]{\@grouplogo}
        \end{minipage}
    }
}
% }}}

% {{{ General formatting (only native and KOMA-Script settings)
% Fix overfull hboxes in TOC with three-digit page numbers
\renewcommand*{\@pnumwidth}{1.8em}

% Display TOC in PDF bookmarks (without adding an entry in itself)
\BeforeTOCHead[toc]{{\cleardoublepage\pdfbookmark[0]{\contentsname}{toc}}}
\BeforeTOCHead[lof]{{\cleardoublepage\pdfbookmark[0]{\listfigurename}{listoffigures}}}
\BeforeTOCHead[lot]{{\cleardoublepage\pdfbookmark[0]{\listtablename}{listoftables}}}
% }}}

% {{{ Document metadata
\newcommand*{\@group}{}
\newcommand*{\group}[1]{\gdef\@group{#1}}
\newcommand*{\@grouplogo}{}
\newcommand*{\grouplogo}[1]{\gdef\@grouplogo{#1}}
\newcommand*{\@salutation}{}
\newcommand*{\salutation}[1]{\gdef\@salutation{#1}}
\newcommand*{\@nameprefix}{}
\newcommand*{\nameprefix}[1]{\gdef\@nameprefix{#1}}
\newcommand*{\@namesuffix}{}
\newcommand*{\namesuffix}[2][,]{\gdef\@namesuffix{#1~#2}}
\newcommand*{\@advisorA}{}
\newcommand*{\advisorA}[1]{\gdef\@advisorA{#1}}
\newcommand*{\@advisorB}{}
\newcommand*{\advisorB}[1]{\gdef\@advisorB{#1}}
\newcommand*{\@examdate}{}
\newcommand*{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand*{\@thesisnumber}{}
\newcommand*{\thesisnumber}[1]{\gdef\@thesisnumber{#1}}
\newcommand*{\@birthdate}{}
\newcommand*{\birthdate}[1]{\gdef\@birthdate{#1}}
\newcommand*{\@birthplace}{}
\newcommand*{\birthplace}[1]{\gdef\@birthplace{#1}}
\newcommand*{\@abstract}{}
\newcommand*{\abstract}[1]{\gdef\@abstract{#1}}
\newcommand*{\@keywords}{}
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}}
% }}}

% {{{ Included file names
% This class includes a number of external files that the user should fill with
% their content, e.g. preface, abstract or CV. Including a file provides better
% separation of content and better formatted code, compared to using macros for
% setting the corresponding (potentially substantial) content.
% However, the class should not include hard-coded file names, but allow the
% user to configure file inclusion. Therefore, we provide macros for each file,
% to be redefined if the user so chooses.
\newcommand*{\prefacefile}{frontmatter/preface}
\newcommand*{\abstractfile}{frontmatter/abstract}
\newcommand*{\addabstractfile}{frontmatter/abstract_add}
\newcommand*{\symbolsfile}{frontmatter/symbols}
\newcommand*{\problemstatementfile}{frontmatter/problemstatement}
\newcommand*{\cvfile}{backmatter/cv}
\newcommand*{\affirmationfile}{backmatter/affirmation}
% }}}

% {{{ Used Packages
% LaTeX engine detection
\RequirePackage{iftex}

% Packages for font formatting
\ifpdftex
    \RequirePackage[T1]{fontenc}
\fi
\RequirePackage{lmodern}
\RequirePackage{microtype}

% Source code listings
% Note: minted must be loaded before csquotes because of a sub-dependency.
\Ifstr{\useminted}{true}{%
    \RequirePackage[
        chapter,
        newfloat=true,
    ]{minted}

    % Default options for code listings.
    \setminted{%
        autogobble=true, % Remove common leading whitespace.
        breaklines=true, % Break lines if too long.
        fontsize=\scriptsize,
        frame=lines, % Lines above and below the code.
        linenos=true,
    }

    % Default options for inline code.
    \setmintedinline{%
        fontsize=\normalsize,
    }

    % Name to be used for floating listings in german documents.
    \Ifstr{\lang}{german}{
        \SetupFloatingEnvironment{listing}{name={Codebeispiel}}
    }{}
}{}

% Language-related
\Ifstr{\lang}{german}{
    \RequirePackage[english,main=ngerman]{babel}
}{}
\Ifstr{\lang}{english}{
    \RequirePackage[main=english,ngerman]{babel}
}{}
\RequirePackage[autostyle=true]{csquotes}

% Figure handling
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}

% Table formatting
\RequirePackage{booktabs}
\RequirePackage{longtable}

% Figure/table counting for conditional "list of" inclusion
\RequirePackage[figure,table]{totalcount}

% Bibliography
\RequirePackage[
    backend=biber,
    style=alphabetic,
    sorting=nyt,
    giveninits=true, % Shorten given names to initials.
    maxnames=10, % For more than maxnames authors, shorten bibliography entry to minnames plus "et al".
    minnames=1,
    maxalphanames=\citelabelauthornum, % For more than maxalphanames authors, shorten the cite label to minalphanames.
    minalphanames=\citelabelauthornum,
    datamodel=biblatex_custom,
]{biblatex}
\renewcommand*{\labelalphaothers}{} % Remove plus-sign for more than maxalphanames authors.
\DefineBibliographyStrings{ngerman}{%
    % When truncating author lists, put "et al." instead of "u.a.".
    andothers={et\addabbrvspace{}al\adddot},
}
\AtBeginBibliography{%
    % Typeset URLs/DOIs in regular font instead of monospace to prevent overly
    % emphasizing that part of the entry.
    \renewcommand*{\UrlFont}{}
}
\DeclareFieldFormat{eprint:arxiv}{%
    % Typeset arXiv eprintclass entries in regular font instead of monospace
    arXiv\addcolon\space%
    \ifhyperref{%
        \href{https://arxiv.org/\abx@arxivpath/#1}{%
            \nolinkurl{#1}%
            \iffieldundef{eprintclass}{}{%
                \addspace\mkbibbrackets{\thefield{eprintclass}%
            }%
        }%
        }%
    }{%
        \nolinkurl{#1}
        \iffieldundef{eprintclass}{}{%
            \addspace\mkbibbrackets{\thefield{eprintclass}}%
        }%
    }
}

% To be able to use properly formatted physical units throughout the complete
% document siunitx is provided in this class.
\RequirePackage{textcomp} % avoid warnings e.g. when using \micro
\RequirePackage{siunitx}


% Automatically mark publications containing the given author name with the
% keyword "own", for later filtering.
\newcommand*{\autodetectOwnPubs}[1]{%
    \DeclareSourcemap{%
        \maps[datatype=bibtex]{%
            \map[overwrite=true]{%
                \step[fieldsource=author, match={#1}, final]
                \step[fieldset=keywords, fieldvalue=own]
            }
        }
    }
}
% }}}

% {{{ PDF/A-2b compliance measures
% Based on a guide by Tampere University: https://webpages.tuni.fi/latex/pdfa-guide.pdf

% Populate \@abstract macro to allow access for metadata.
\input{\abstractfile}
% Create metadata file (*.xmpdata) only if it does not already exist. Creating
% it on every build seems to cause a race condition leading to empty metadata
% fields in the output PDF file.
\IfFileExists{\jobname.xmpdata}{}{
% Use low level file output method because the "filecontents" environment is
% only good for verbatim output and can not expand macros like \@title.
% Backslashes and line feeds need a workaround, though.
    \newwrite\xmpoutput
    \immediate\openout\xmpoutput=\jobname.xmpdata
    %
    \write\xmpoutput{%
        \@backslashchar Title{\@title}^^J%
        \@backslashchar Author{\@author}^^J%
        \@backslashchar Language{\langid}^^J%
        \@backslashchar Subject{\@abstract}^^J%
        \@backslashchar Keywords{\@keywords}%
    }
}

% PDF/A-2 is based on PDF 1.7, so we want the document to be in that version.
\ifluatex
    \directlua{pdf.setminorversion(7)}
\else
    \pdfminorversion=7
\fi
% Although colorprofiles will be loaded by the pdfx package, loading is
% skipped if colorprofiles is not installed. Loading it explicitly ensures
% that we have it present.
\RequirePackage{colorprofiles}
% Specify the standard we want to adhere to as PDF/A-2b. The mathxmp option
% is used to allow mathematical expressions the the metadata. The option
% (2018/12/22) ensures that a version not older that the specified date is used
% because earlier versions have some shortcomings.
\RequirePackage[a-2b,mathxmp]{pdfx}[2018/12/22]

% pdfx already imports hyperref, so we pass the options here. The empty
% pdfstartview= ensures no illegal values are passed to that option.
\hypersetup{pdfstartview=, hidelinks}
% }}}

% {{{ Bibliography
% Define note describing bibliography sorting.
\defbibnote{bibsorting}{\bibnote}

% The bibliography is typeset with single line spacing, while the previous
% content (mainmatter) is usually set with 1.5x spacing. So, spacing must
% be switched, followed by a re-calculation of the typearea.
% However, using \KOMAoptions{DIV=current} in \AtBeginBibliography results in
% an unwanted page break directly after the bibliography heading, so it cannot
% be used. The following command is defined to prevent cluttering of the
% actual document file (e.g. thesis.tex).
\newcommand{\insertbibliography}{%
    \singlespacing\KOMAoptions{DIV=current}
    \Ifstrstart{\doctype}{dr}{%
        \Ifstr{\docstate}{accepted}{%
            \etBibAll
        }{%
            \etBibOthers
        }
    }{%
        \etBibAll
    }
    \bodylinespacing\KOMAoptions{DIV=current}
}
% }}}

% {{{ Document components
% Predefined document parts, such as the title page, are defined here as
% commands. In the following section, they are patched together as needed
% according to the selected document type and class options.
%
% Titlepages
% - Doctoral theses, accepted variant ("Belegexemplar")
\newcommand*{\etTitleDocAccepted}{%
    \begin{titlepage}
        \begin{center}
            \eimheader%
            \vspace{4.5em}

            {\Large\bfseries\sffamily\@title\par}
            \vspace{3em}

            {Von der Fakultät für Elektrotechnik, Informatik und Mathematik\\ der Universität Paderborn}
            \vspace{0.5em}

            zur Erlangung des akademischen Grades
            \vspace{1.5em}

            {\large\doctoraltitle}
            \vspace{1.5em}

            genehmigte Dissertation
            \vspace{0.5em}

            von
            \vspace{1.5em}

            {\large\@nameprefix~\@author\@namesuffix}
            \vspace{1.5em}

            \vfill
            \begin{tabular}{ll}
                Erster Gutachter: & \@advisorA\\
                Zweiter Gutachter: & \@advisorB\\[0.5em]
                Tag der mündlichen Prüfung: & \@examdate\\
            \end{tabular}
            \vspace{1.5em}

            Paderborn, \@date
            \vspace{1.5em}

            Diss. EIM-E/\@thesisnumber
        \end{center}
    \end{titlepage}
}

% - Doctoral theses, submission variant ("Belegexemplar")
\newcommand*{\etTitleDocSubmission}{%
    \begin{titlepage}
        \begin{center}
            \eimheader%
            \vspace{8em}

            {\Large\bfseries\sffamily\@title\par}
            \vspace{3em}

            {Der Fakultät für Elektrotechnik, Informatik und Mathematik\\ der Universität Paderborn}
            \vspace{0.5em}

            zur Erlangung des akademischen Grades
            \vspace{1.5em}

            {\large\doctoraltitle}
            \vspace{1.5em}

            vorgelegte Dissertation
            \vspace{0.5em}

            von
            \vspace{1.5em}

            {\large\@nameprefix~\@author\@namesuffix}
            \vspace{1.5em}

            geboren am \@birthdate~in \@birthplace
        \end{center}
    \end{titlepage}
}

% - Student theses (Bachelor's and Master's)
\newcommand*{\etTitleStudent}{%
    \begin{titlepage}
        \eimheader%

        \vspace{3em}

        \begin{center}
            {\doctypename}
            \vspace{3em}

            % Note: \par at the end is required for proper line spacing.
            {\Large\bfseries\sffamily\@title\par}
            \vspace{3em}

            \by
            \vspace{1.5em}

            {\large \@author}
            \vspace{1.5em}

            \vfill
            \begin{tabular}{ll}
                \advisor    & \@advisorA\\
                            & \@advisorB
            \end{tabular}
            \vspace{3em}

            \placedate
        \end{center}

        \etfooter%
    \end{titlepage}
}

% - Report (not actually a thesis, oh well...)
\newcommand*{\etTitleReport}{%
    \begin{titlepage}
        \eimheader%

        \vspace{3em}

        \begin{center}
            {\doctypename}
            \vspace{3em}

            % Note: \par at the end is required for proper line spacing.
            {\Large\bfseries\sffamily\@title\par}
            \vspace{3em}

            \by
            \vspace{1.5em}

            {\large \@author}
            \vspace{1.5em}

            \vfill
            \placedate
        \end{center}

        \etfooter%
    \end{titlepage}
}

% - Preliminary mode (reduced-anxiety title page)
\newcommand*{\etTitlePrelim}{%
    \begin{titlepage}
        \begin{center}
            \preliminarynote
        \end{center}
    \end{titlepage}
}

% Problem statement
\newcommand*{\etProblemStatement}{%
    \begin{titlepage}
        \eimheader%
        \vspace{3em}

        \begin{center}
            \large\doctypename%
            \vspace{0.5em}

            \for
            \vspace{0.5em}

            \@salutation~\@author
        \end{center}
        \vspace{1.5em}

        \noindent\textsf{\textbf{\@title}}
        \vspace{0.5em}

        \noindent\input{\problemstatementfile}
        \vspace{1.5em}

        \noindent\@advisorA
        \vspace{4.5em}

        \etfooter%
    \end{titlepage}
}

% Preface
\newcommand*{\etPreface}{\input{\prefacefile}}

% Abstracts
\newcommand*{\etAbstract}{\chapter{\abstracttitle}\@abstract}
\newcommand*{\etAbstractAdd}{\chapter{\addabstracttitle}\input{\addabstractfile}}

% Bibliography
% - All cited sources (accepted doctoral and student theses)
\newcommand*{\etBibAll}{%
    \printbibliography[title=\bibtitle, segment=0, prenote=bibsorting]
}
% - Cited sources by others (i.e. not the thesis author), to be combined with \etBibOwn
\newcommand*{\etBibOthers}{%
    \printbibliography[title=\bibtitle, notkeyword=own, segment=0, prenote=bibsorting]
}
% - Author's own sources, even if not cited in the document
\newcommand*{\etBibOwn}{%
    % Automatically include all sources that are marked with the keyword "own".
    \begin{refsegment}
        \nocite{*}
    \end{refsegment}

    % Sort author's own publications chronologically (i.e. by year, name instead of name, year)
    \newrefcontext[sorting=ynt]

    \printbibliography[title=\authorspublications, keyword=own, segment=1]
}

% Affirmation
\newcommand*{\etAffirmation}{\input{\affirmationfile}}
% }}}

% {{{ Frontmatter composition
% The overall structure of the frontmatter is this:
% * Titlepage
% * Problem statement (default for student theses)
% * Preface (default for doctoral theses)
% * Abstract (default for all except reports)
% * Abstract in english (default for doctoral theses)
% * Table of Contents
% * List of figures
% * List of tables
% * List of abbreviations
% * List of mathematical symbols / operators
% * List of mathematical variables

\newcommand*{\etFront}{%
    % Begin frontmatter (enable roman page numbering etc.)
    \frontmatter

    \singlespacing\KOMAoptions{DIV=current}

    % Title page
    \includetitlepage

    % Problem statement (Student theses only)
    \includeproblemstatement

    \bodylinespacing\KOMAoptions{DIV=current}

    % Preface
    \includepreface

    % Abstract
    \includeabstracts

    \singlespacing\KOMAoptions{DIV=current}

    % Table of contents
    \tableofcontents

    % Lists of figures and tables
    % Conditionally included, i.e. the list is not shown if it is empty.
    \iftotalfigures
        \listoffigures
    \fi
    \iftotaltables
        \listoftables
    \fi

    % Index of abbreviations and symbols
    \input{\symbolsfile}

    \mainmatter%

    \bodylinespacing\KOMAoptions{DIV=current}
}
% }}}

% {{{ Backmatter composition
% The structure of the backmatter is this:
% * CV (doctoral theses for submission only)
% * Bibliography of own publications (doctoral theses for submission only)
% * Affirmation (default for student theses)
\newcommand*{\etBack}{%
    \backmatter%

    \singlespacing\KOMAoptions{DIV=current}

    \Ifstrstart{\doctype}{dr}{%
        % Doctoral theses
        \Ifstr{\docstate}{accepted}{}{%
            % CV
            \input{\cvfile}

            % Bibliography of own publications
            \etBibOwn
        }
    }{}
    \includeaffirmation
}
% }}}

% {{{ Include frontmatter and backmatter in the document
\AtBeginDocument{%
    \providecommand\tikzifexternalizing[2]{#2} % Prevent errors if not using tikz.
    \tikzifexternalizing{}{\etFront}
}
\AtEndDocument{%
    \Ifstr{\hasbackmatter}{true}{\etBack}{}
}
% }}}
% vim: foldmethod=marker
