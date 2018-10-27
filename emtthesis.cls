\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emtthesis}[2018/10/18 EMTthesis]

% {{{ Class options
% Fallback option (for all options not explicitly defined above)
\DeclareOption*{%
    \ClassError{emtthesis}{Unknown option '\CurrentOption'.}{Check the documentation for valid options.}
}

% End of options section
\ProcessOptions\relax

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

% Preface
    \input{frontmatter/preface}

% Abstracts
    % German abstract
    \input{frontmatter/abstract_de}

    % English abstract
    \input{frontmatter/abstract_en}

% Table of contents and lists of figures, tables, abbreviations etc.
    % Table of contents
    \tableofcontents

    % Lists of figures and tables
    \listoffigures
    \listoftables

    % Index of abbreviations and symbols
    \input{frontmatter/symbols}

% Begin mainmatter, i.e. author content
    \mainmatter%
}
% }}}

% vim: foldmethod=marker
