\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emtthesis}[2018/10/18 EMTthesis]

% {{{ Class options
\RequirePackage{scrbase}
\DefineFamily{emtthesis}
\DefineFamilyMember{emtthesis}

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

% Fallback option (for all options not explicitly defined above)
\DeclareOption*{%
    \ClassError{emtthesis}{Unknown option '\CurrentOption'.}{Check the documentation for valid options.}
}

% End of options section
\FamilyProcessOptions{emtthesis}

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

% }}}

% {{{ Used Packages
% Essential packages
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}

% Language-related
\RequirePackage[english,ngerman]{babel}
\RequirePackage[autostyle=true]{csquotes}

% Table formatting
\RequirePackage{booktabs}
\RequirePackage{longtable}

% }}}

% {{{ Document start and structure
% The overall document structure is this:
% * Titlepage
% * Preface
% * Abstract
% * Abstract in english
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

    % Apply user-selected line spacing for preface and abstract
    \ifstr{\onehalfspacingmode}{auto}{\onehalfspacing}{\singlespacing}
    \KOMAoptions{DIV=current}

% Preface
    \input{frontmatter/preface}

% Abstracts
    % German abstract
    \input{frontmatter/abstract_de}

    % English abstract
    \input{frontmatter/abstract_en}

% Table of contents and lists of figures, tables, abbreviations etc.
    \singlespacing\KOMAoptions{DIV=current}

    % Table of contents
    \tableofcontents

    % Lists of figures and tables
    \listoffigures
    \listoftables

    % Index of abbreviations and symbols
    \input{frontmatter/symbols}

% Begin mainmatter, i.e. author content
    \mainmatter%

    \ifstr{\onehalfspacingmode}{never}{\singlespacing}{\onehalfspacing}
    \KOMAoptions{DIV=current}
}
% }}}

% {{{ Bibliography helper
% The bibliography is typeset with single line spacing, while the previous
% content (mainmatter) is usually set with 1.5x spacing. So, spacing must
% be switched, followed by a re-calculation of the typearea.
% However, using \KOMAoptions{DIV=current} in \AtBeginBibliography results in
% an unwanted page break directly after the bibliography heading, so it cannot
% be used. The following command is defined to prevent cluttering of the
% actual document file (e.g. thesis.tex).
\newcommand{\insertbibliography}{%
    \singlespacing\KOMAoptions{DIV=current}
    \printbibliography[title=Literaturverzeichnis]
    \ifstr{\onehalfspacingmode}{never}{}{\onehalfspacing}
}
% }}}

% vim: foldmethod=marker
