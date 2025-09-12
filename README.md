ETthesis
=========

ETthesis is a LaTeX class and template for academic theses and documents prepared at the Department of Electrical Engineering and Information Technology at Paderborn University, Germany.


Contents
--------

* `etthesis.cls`: Document class file, an extension to `scrbook`. Provides all structure, formatting and processing.
* `thesis.tex`: Main file of the exemplary document.
* `custom.sty`: Local package for user customization. Contents are suggestions, not required for the class to work.
* `thesis.bib`: Bibliography file. Multiple source files are supported.
* Files in `frontmatter`, `mainmatter`, and `backmatter`: Exemplary content with recommended formatting, e.g. for lists of symbols.


Features
--------

* Support for different document types
  * Student theses (Bachelor's, Master's)
  * Doctoral theses
  * Student projects and similar ("Projektarbeit", "Studienarbeit")
  * Generic reports (non-thesis)
* English and German language variants
* Support for different document states, e.g. "Prüfexemplar" and "Belegexemplar" for doctoral theses
* Compliance with university, faculty and work group requirements (no guarantees though)
* Metadata (author name, thesis title etc.) centrally defined in main document
* Page layout, fonts etc. according to typographical standards
* Configurable document structure:
  * Title page
  * Problem statement (default for student theses)
  * Preface (default for accepted doctoral theses)
  * Abstract (german and/or english)
  * Table of Contents
  * List of figures
  * List of tables
  * List of abbreviations and symbols
  * (Main content)
  * Bibliography
  * Appendices (if any)
  * CV (for submission variant of doctoral theses)
  * Own publications (for submission variant of doctoral theses)
  * Affirmation of own independent work (default for student theses)
* Common packages already included, e.g.
  * babel
  * biblatex
  * booktabs
  * hyperref
  * longtable
  * microtype
  * minted (optional)
* Custom BibLaTeX entry type `@norm` for citing norms and standards.
  * Supported fields: `type`, `number`, `title`, `year`, `publisher`
  * See `thesis.bib` for an example


Class options
-------------

The ETthesis document class supports the following options, which can be given via:

        \documentclass[option1=value1, option2=value2]{etthesis}

* **lang**: Template language:
  * `german`: German version [default]
  * `english`: English version
* **doctype**: Document type:
  * `bachelors`: Bachelor's thesis [default]
  * `dring`: Doctoral thesis (Dr.-Ing.)
  * `drrernat`: Doctoral thesis (Dr. rer. nat.)
  * `masters`: Master's thesis (M.Sc.)
  * `project`: Student project ("Projektarbeit")
  * `report`: Generic report
  * `sa`: "Studienarbeit"
* **docstate**: Document publication state:
  * `preliminary`: Like `submission`, but without the official-looking title page. [default]
  * `submission`: Typeset for submission / grading, e.g. with 1.5x line spacing by default. For doctoral theses, typeset "Prüfexemplar" (see above for details).
  * `accepted`: Typeset for print / publication, e.g. with single line spacing. For doctoral theses, typeset "Belegexemplar" (see above for details).
* **linespacing**: When to use 1.5x line spacing in the document:
  * `auto`: Use 1.5x line spacing for all `submission` documents and single spacing for `accepted` documents.
  * `single`: Use single line spacing.
  * `onehalf`: Use 1.5x line spacing.
* **paperformat**: Which paper format to use:
  * `a4`: Use DIN A4 paper format with 12pt font size. [default]
  * `a4onesided`: Use DIN A4 paper format with 12pt font size, one-sided layout, and no binding correction. Suggested for digital submission.
  * `a5`: Use DIN A5 paper format with 10pt font size for a more compact layout.
* **preface**: Whether to display the preface:
  * `auto`: Include for accepted doctoral theses only. [default]
  * `always`: Enable preface.
  * `never`: Disable preface.
* **problem**: Whether to display the problem statement:
  * `auto`: Include for student theses only. [default]
  * `always`: Enable problem statement.
  * `never`: Disable problem statement.
* **abstracts**: Whether to display the abstract(s):
  * `auto`: Include german and english abstract for doctoral theses, none for reports and only an abstract in the document's language for all other document types. [default]
  * `one`: Enable only the abstract in the document's language.
  * `both`: Enable both the german and english abstract.
  * `none`: Disable abstracts.
* **affirmation**: Whether to display the affirmation:
  * `auto`: Include for student theses only. [default]
  * `always`: Enable affirmation.
  * `never`: Disable affirmation.
* **singlecitelabel**: Toggle cite label format for multi-author sources.
  * `false`: Use up to three author's initials in label. For Mustermann and Doe, set [MD18]. [default]
  * `true`: Always use only the first author's name in label. For Mustermann and Doe, set [Mus18].
* **useminted**: Toggle package usage for `minted`.
  * `false`: Do not include `minted`, e.g. when using `listings` instead. [default]
  * `true`: Automatically include `minted` package.


Using with Git
--------------

If you use git to track changes in your thesis (which you should!), the following workflow is recommended:

1. (Optional) Create remote repository
2. Clone or create local repository
   * When using a remote repository as per Step 1, create a local clone:

         git clone https://YOUR.GIT.SERVER/git/YOUR_NAME/YOUR_REPO.git

   * Otherwise, create a new repository:

         git init

3. Add the thesis template as an alternate remote:

       git remote add template https://github.com/ei-upb/ETthesis.git

4. Pull the template:

       git pull template master

Now, you can start with a fresh template, with the following behaviour:
* Adding commits will add them to your own master.
* Pushing your changes with `git push` will push them to your own remote (not the template).
* Calling `git pull template master` again will update the template.
* Updating the template will *not* overwrite your local changes.
* As long as you do not change core files like `etthesis.cls`, no merge conflicts should occur.
