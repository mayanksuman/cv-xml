<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" omit-xml-declaration="yes" indent="no" encoding="UTF-8"/>
  <xsl:output doctype-public="-//W3C//DTD HTML 4.0//EN"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">

    \documentclass[a4paper,11pt]{article}
    %\usepackage{pslatex}
    %\usepackage[T1]{fontenc}
    %\usepackage[francais]{babel}
    \usepackage{ESIEEcv}
    %\usepackage[latin1]{inputenc}
    \usepackage[T1]{fontenc}
    \oddsidemargin -0.4in
    \evensidemargin -0.5in
    \textwidth \paperwidth
    \advance \textwidth by -1.2in

    \topmargin -0.0cm
    \textheight 0.7\paperheight
    \advance\textheight 2in
    \headheight 0pt
    \headsep 0pt
    \footskip 0pt

    \renewcommand{\PostApport}{. }
    % mes trucs perso
    \newcommand{\encadre}[1]{\begin{tabular}{|l|}\hline #1 \\ \hline \end{tabular}}
    \newlength{\larg}
    \setlength{\larg}{17.4cm}

    \begin{document}
    \begin{center}
    %\encadre{\textsc{\textbf{\LARGE{Graduate In engineering}}}}
    \textbf{{\Large Mahdi \textsc{Ben Hamida}}}
    \end{center}

    %coordonnes
    \noindent\hspace*{\tabcolsep}\begin{minipage}{0.4\linewidth}
    %\textbf{{\large Mahdi \textsc{Ben Hamida}}\\}
    \textbf{\textsf{Address:}}\hspace*{0.1cm}753 Neptune Lane\\
    \hspace*{1.6cm}Foster City, CA 94404, USA\\
    \textbf{\textsf{Phone~:}}\hspace*{0.1cm}  +1~650~293~7025\\
    \textbf{\textsf{Email~:}} \hspace*{0.2cm}\texttt{mahdouch\@gmail.com}
    \end{minipage}

    %age et infos diverses
    \begin{minipage}{1\linewidth}

    % align it
    \vspace*{1cm}
    \newlength{\shift}
    \setlength{\shift}{6cm}

    \hspace*{\shift}\textbf{\textsf{Permanent address:}}\\
    \hspace*{\shift}73 avenue Farhat Hached\\
    \hspace*{\shift}3000 Sfax\\
    \hspace*{\shift}Tunisia\\
    \hspace*{\shift}\textbf{\textsf{Phone~:}}\hspace*{0.1cm} +216 98 460748\\
    \end{minipage}
    \vspace{0.4cm}

    %titre actuel
    %\begin{center}
    %	\encadre{\textsc{\textbf{\LARGE{Graduate In engineering}}}}
    %\end{center}

    <xsl:for-each select="resume/body/section">
      \begin{rubrique}{<xsl:value-of select="title" />}
      <xsl:if test="description!=''">
	\begin{sousrubrique}
	\Titre{<xsl:value-of select="description" />}
	\Date{}
	\end{sousrubrique}
      </xsl:if>

      <xsl:for-each select="details/element">
	\begin{sousrubrique}
	<xsl:if test="left!=''">\Competence{\textbf{<xsl:value-of select="left" />}}</xsl:if>
	<xsl:if test="date!=''">\Date{<xsl:value-of select="date" />}</xsl:if>
	<xsl:if test="duration!=''">\Duree{<xsl:value-of select="duration" />}</xsl:if>
	\Titre{<xsl:if test="location/town!=''">
          \textbf{\textsc{<xsl:value-of select="location/title" />}, <xsl:value-of select="location/town" />/<xsl:value-of select="location/country" />}: <xsl:if test="title!=''"><xsl:value-of select="title" /></xsl:if></xsl:if>}
	<xsl:if test="description!=''">\Descr{<xsl:value-of select="description" />.}</xsl:if>
	<xsl:if test="apport!=''">
	  \Apport{<xsl:value-of select="apport" />}</xsl:if>
	\end{sousrubrique}
      </xsl:for-each><!-- element -->
      \end{rubrique}
    </xsl:for-each> <!-- section -->
    \end{document}
    \endinput
    %%
    %% End of file


  </xsl:template>
</xsl:stylesheet>
