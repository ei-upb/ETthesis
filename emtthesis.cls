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
\RequirePackage{csquotes}

% }}}

% {{{ Document start and structure
% {{{ Preface
\AtBeginDocument{%
    \input{frontmatter/preface}
}
% }}}
% }}}

% vim: foldmethod=marker
