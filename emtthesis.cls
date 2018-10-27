\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emtthesis}[2018/10/18 EMTthesis]

% {{{ Class options
\RequirePackage{scrbase}
\DefineFamily{emtthesis}
\DefineFamilyMember{emtthesis}

% Line spacing mode
% Typically, theses are typeset with 1.5x line spacing for the text. The table
% of contents, lists of figures, tables and symbols use regular single spacing.
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

% Line spacing
\RequirePackage{setspace}
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

% vim: foldmethod=marker
