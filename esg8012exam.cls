%%
%% This is file `esg8012exam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% esg8012exam.dtx  (with options: `class')
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
\ProvidesClass{esg8012exam}
 [2010/10/08 v0.1 ESG Exam Template]
\LoadClass[notitlepage,11pt,twoside,letterpaper]{article}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xifthen}
\RequirePackage{verbatim}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{etoolbox,etextools}
\RequirePackage[T1]{fontenc}
\RequirePackage{sectsty}
\sectionfont{\large}
\newboolean{esg8012exam@solutions}\newboolean{esg8012exam@problems}
\DeclareOption{problems}{\setboolean{esg8012exam@problems}{true}\setboolean{esg8012exam@solutions}{false}}
\DeclareOption{solutions}{\setboolean{esg8012exam@problems}{false}\setboolean{esg8012exam@solutions}{true}}
\ProcessOptions\relax
\ifthenelse{\boolean{esg8012exam@problems} \OR \boolean{esg8012exam@solutions}}{
}{
  \newwrite\esgexam@problemsout
  \newwrite\esgexam@solutionsout
  \newwrite\esgexam@tempout
  \newcommand{\esgexam@compilefile}[1]{\write18{pdflatex "#1.tex"}}
  \edef\esgexam@problemsfilename{\jobname\string_Problems.tex}
  \edef\esgexam@solutionsfilename{\jobname\string_Solutions.tex}
  \edef\esgexam@tempfilename{\jobname.tmp}
  \newcommand{\writetoboth}[1]{\writetoproblems{#1}%
    \writetosolutions{#1}}
  \newcommand{\writetoall}[1]{\writetoboth{#1}\writetothis{#1}}
  \newcommand{\writetoproblems}[1]{\immediate\write\esgexam@problemsout{#1}}
  \newcommand{\writetosolutions}[1]{\immediate\write\esgexam@solutionsout{#1}}
  \newcommand{\writetothis}[1]{{\edef\temp{#1}\expandafter}\expandafter\scantokens\expandafter{\temp}}

  \immediate\openout\esgexam@problemsout\esgexam@problemsfilename
  \immediate\openout\esgexam@solutionsout\esgexam@solutionsfilename

  \def\esgexam@end@hook{
    \begingroup
      \writetoboth{\string\end{document}}
    \endgroup
    \immediate\closeout\esgexam@problemsout
    \immediate\closeout\esgexam@solutionsout
    %\write18{pdflatex "\esgexam@problemsfilename"}
    %\write18{pdflatex "\esgexam@solutionsfilename"}
  }
  \expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter\enddocument
    \expandafter\expandafter\expandafter{\expandafter\esgexam@end@hook\enddocument}

  \global\let\esgexam@begin@hook\relax
  \expandafter\def\expandafter\begin
    \expandafter#\expandafter1\expandafter{\expandafter\esgexam@begin@hook\begin{#1}}% This is a terrible, terrible hack.

  \begingroup
    \writetosolutions{%
      \string\documentclass[solutions]{esg8012exam}
    }
    \writetoproblems{%
      \string\documentclass[problems]{esg8012exam}
    }
  \endgroup

  \newenvironment{preamble}{%
    \begingroup% Lets Keep the Changes Local
      \immediate\openout\esgexam@tempout\esgexam@tempfilename
      \@bsphack
      \let\do\@makeother\dospecials\catcode`\^^M\active
      \def\verbatim@processline{\writetoboth{\the\verbatim@line}\immediate\write\esgexam@tempout{\the\verbatim@line}}
      \verbatim@start
    }{\@esphack
      \immediate\closeout\esgexam@tempout\endgroup
      \gdef\esgexam@begin@hook{\input{\esgexam@tempfilename}\global\let\esgexam@begin@hook\relax}%
    }

  \AtBeginDocument{

    \begingroup
      \writetoboth{%
        \string\classname{\expandafter\unexpanded\expandafter{\@classname}}
      }
      \writetoboth{%
        \string\semester{\expandafter\unexpanded\expandafter{\@semester}}
      }
      \writetoboth{%
        \string\examnumber{\expandafter\unexpanded\expandafter{\@examnumber}}
      }
      \writetoboth{%
        \string\date{\expandafter\unexpanded\expandafter{\@date}}
      }
      \writetoboth{\string\begin{document}}
    \endgroup
  }
}

\pagestyle{fancy}
\headheight 14.5pt
\fancyhead{}
\fancyfoot{}
\cfoot{\thepage\space of \pageref{LastPage}}

\let\@seccntformat\@gobble

\AtBeginDocument{
  \begingroup
    \ifthenelse{\boolean{esg8012exam@problems}}{%
      \edef\@cheader{Exam \@examnumber\space}
    }{
      \ifthenelse{\boolean{esg8012exam@solutions}}{
        \edef\@cheader{Exam \@examnumber\space - Solutions}
      }{
        \edef\@cheader{Exam \@examnumber\space}
      }
    }
  \expandafter\endgroup
  \expandafter\chead\expandafter{\@cheader}
  \begingroup
    \bf
    \begin{center}%
      {\noindent  \textsc{Massachusetts Institute of Technology} \par}%
      {\noindent  Experimental Study Group \par}%
    \end{center}%
    {\noindent  \@classname \hfill \@semester \par}%
    \begin{center}%
      {\noindent \Large
        Exam \@examnumber
        \ifthenelse{\boolean{esg8012exam@solutions}}{% \OR \NOT \boolean{esg8012exam@problems}{%
          \space Solutions%
        }{}%
      \par}%
    \end{center}%
  \endgroup
  \global\let\examnumber\relax
  \global\let\semester\relax
  \global\let\classname\relax
  \global\let\@examnumber\relax
  \global\let\@semester\relax
  \global\let\@classname\relax
}
\newcommand*{\examnumber}[1]{\gdef\@examnumber{#1}}
\newcommand*{\semester}[1]{\gdef\@semester{#1}}
\newcommand*{\classname}[1]{\gdef\@classname{#1}}
\newenvironment{problem}[2][\relax]{%
  \ifthenelse{\equal{#1}{\relax}}{%
    \writetoall{\string\section{Problem \string\thesection \string\space #2}}%
  }{%
    \writetoall{\string\section*{Problem #1: #2}}%
  }%
  \writetosolutions{\string\subsection{Problem}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \immediate\openout\esgexam@tempout\esgexam@tempfilename
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetoboth{\the\verbatim@line}\immediate\write\esgexam@tempout{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\immediate\closeout\esgexam@tempout\endgroup
  \input{\esgexam@tempfilename}%
}
\newenvironment{solution}{%
  \writetosolutions{\string\subsection{Solution}}%
  \begingroup% Lets Keep the Changes Local
    \@bsphack
    \let\do\@makeother\dospecials\catcode`\^^M\active
    \def\verbatim@processline{\writetosolutions{\the\verbatim@line}}%
    \verbatim@start
}{\@esphack\endgroup\writetosolutions{\string\clearpage}}%
\endinput
%%
%% End of file `esg8012exam.cls'.
