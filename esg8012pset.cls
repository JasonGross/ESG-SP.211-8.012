%%
%% This is file `esg8012pset.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% esg8012pset.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2010 by Jason Gross
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{esg8012pset}
 [2010/09/07 v0.1 ESG PSet Template]
\LoadClass[notitlepage,11pt,twoside,letterpaper]{article}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xifthen}
\RequirePackage{verbatim}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{etoolbox,etextools}
\newboolean{esg8012pset@solutions}\newboolean{esg8012pset@problems}
\DeclareOption{problems}{\setboolean{esg8012pset@problems}{true}\setboolean{esg8012pset@solutions}{false}}
\DeclareOption{solutions}{\setboolean{esg8012pset@problems}{false}\setboolean{esg8012pset@solutions}{true}}
\ProcessOptions\relax
\ifthenelse{\boolean{esg8012pset@problems} \OR \boolean{esg8012pset@solutions}}{
}{
  \newwrite\esgpset@problemsout
  \newwrite\esgpset@solutionsout
  \newwrite\esgpset@tempout
  \newcommand{\esgpset@compilefile}[1]{\write18{pdflatex "#1.tex"}}
  \edef\esgpset@problemsfilename{\jobname\string_Problems.tex}
  \edef\esgpset@solutionsfilename{\jobname\string_Solutions.tex}
  \newcommand{\writetoboth}[1]{\writetoproblems{#1}%
    \writetosolutions{#1}}
  \newcommand{\writetoproblems}[1]{\immediate\write\esgpset@problemsout{#1}}
  \newcommand{\writetosolutions}[1]{\immediate\write\esgpset@solutionsout{#1}}

  \immediate\openout\esgpset@problemsout\esgpset@problemsfilename
  \immediate\openout\esgpset@solutionsout\esgpset@solutionsfilename

  \def\esgpset@end@hook{
    \begingroup
      \writetoboth{\string\end{document}}
    \endgroup
    \immediate\closeout\esgpset@problemsout
    \immediate\closeout\esgpset@solutionsout
    \write18{pdflatex "\esgpset@problemsfilename"}
    \write18{pdflatex "\esgpset@solutionsfilename"}
  }
  \expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter\enddocument
    \expandafter\expandafter\expandafter{\expandafter\esgpset@end@hook\enddocument}

  \begingroup
    \writetosolutions{%
      \string\documentclass[solutions]{esg8012pset}
    }
    \writetoproblems{%
      \string\documentclass[problems]{esg8012pset}
    }
  \endgroup

  \newenvironment{preamble}{%
    \begingroup% Lets Keep the Changes Local
      \@bsphack
      \let\do\@makeother\dospecials\catcode`\^^M\active
      \def\verbatim@processline{\writetoboth{\the\verbatim@line}}
      \verbatim@start
    }{\@esphack\endgroup}

  \AtBeginDocument{

    \begingroup
      \writetoboth{%
        \string\classname{\expandafter\unexpanded\expandafter{\@classname}}
      }
      \writetoboth{%
        \string\semester{\expandafter\unexpanded\expandafter{\@semester}}
      }
      \writetoboth{%
        \string\problemsetnumber{\expandafter\unexpanded\expandafter{\@problemsetnumber}}
      }
      \writetoboth{%
        \string\date{\expandafter\unexpanded\expandafter{\@date}}
      }
      \writetoboth{%
        \string\duedate{\expandafter\unexpanded\expandafter{\@duedate}}
      }
      \writetoboth{%
        \string\readingassignment{\expandafter\unexpanded\expandafter{\@readingassignment}}
      }
      \writetoboth{\string\begin{document}}
    \endgroup
  }
}

\AtBeginDocument{
  \pagestyle{fancy}
  \headheight 14.5pt
  \fancyhead{}
  \fancyfoot{}
  \ifthenelse{\boolean{esg8012pset@problems}}{%
    \chead{Problems}
  }{
    \ifthenelse{\boolean{esg8012pset@solutions}}{
      \chead{Solutions}
    }{
      \chead{}
    }
  }
  \cfoot{\thepage\ of \pageref{LastPage}}
  \ifthenelse{\boolean{esg8012pset@solutions}}{
    \title{Problem Set \@problemsetnumber\space Solutions}
  }{
    \title{Problem Set \@problemsetnumber}
  }
  \maketitle
  \global\let\duedate\relax
  \global\let\problemsetnumber\relax
  \global\let\semester\relax
  \global\let\classname\relax
  \global\let\readingassignment\relax
  \global\let\@duedate\relax
  \global\let\@problemsetnumber\relax
  \global\let\@semester\relax
  \global\let\@classname\relax
  \global\let\@readingassignment\relax
}
\newcommand*{\duedate}[1]{\gdef\@duedate{#1}}
\newcommand*{\problemsetnumber}[1]{\gdef\@problemsetnumber{#1}}
\newcommand*{\semester}[1]{\gdef\@semester{#1}}
\newcommand*{\classname}[1]{\gdef\@classname{#1}}
\newcommand*{\readingassignment}[1]{\gdef\@readingassignment{#1}}
\def\@maketitle{\begingroup%
  \cfoot{\thepage\ of \pageref{LastPage}}
  \newpage
  \pagestyle{fancy}
  \cfoot{\thepage\ of \pageref{LastPage}}
  \headheight 14.5pt
  \bf
  \null
  %\vskip 2em%
  \let \footnote \thanks
  \begingroup
    \bf
    \begin{center}%
      {\noindent  MASSACHUSETTS INSTITUTE OF TECHNOLOGY \par}%
      {\noindent  Experimental Study Group \par}%
    \end{center}%
    {\noindent  \@classname, \@semester \par}%
    \begin{center}%
      {\noindent \Large \@title \par}%
    \end{center}%
    {\noindent Due: \@duedate \\\\}%
    {\noindent Reading: \@readingassignment \par}%
  \endgroup
\endgroup}
\newcounter{esg8012pset@problem@counter}
\newenvironment{problem}[2][\relax]{%
  \ifthenelse{\equal{#1}{\relax}}{%
    \stepcounter{esg8012pset@problem@counter}%
    \writetoboth{\string\section*{Problem \arabic{esg8012pset@problem@counter}: #2}}%
  }{%
    \writetoboth{\string\section*{Problem #1: #2}}%
  }%
  \writetosolutions{\string\subsection*{Problem}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetoboth{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\endgroup}
\newenvironment{solution}{%
  \writetosolutions{\string\subsection*{Solution}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetosolutions{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\endgroup}%
\endinput
%%
%% End of file `esg8012pset.cls'.
