\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emtthesis}[2018/10/18 EMTthesis]

% Class Options
% Fallback option (for all options not explicitly defined above)
\DeclareOption*{%
    \ClassError{emtthesis}{Unknown option '\CurrentOption'.}{Check the documentation for valid options.}
}

% End of options section
\ProcessOptions\relax


% Load scrbook as the base class
\LoadClass[
    fontsize=12pt,
]{scrbook}

% General page layout
\KOMAoptions{%
    % Default binding correction.
    % Users may override this by using e.g. \KOMAoptions{BCOR=15mm}.
    BCOR=12mm,
    %
    % Automatic calculation of type area.
    DIV=calc,
}

% Essential packages
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
