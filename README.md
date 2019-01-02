EMTthesis
=========

EMTthesis is a LaTeX class and template for academic theses prepared at the Measurement Engineering Group at Paderborn University, Germany.


Contents
--------

* `emtthesis.cls`: Document class file, an extension to `scrbook`. Provides all structure, formatting and processing.
* `thesis.tex`: Main file of the exemplary document.
* `custom.sty`: Local package for user customization. Contents are suggestions, not required for the class to work.
* `thesis.bib`: Bibliography file. Multiple source files are supported.
* Files in `frontmatter`, `mainmatter`, and `backmatter`: Exemplary content with recommended formatting, e.g. for lists of symbols.


Features
--------

* Support for different thesis types:
  * Bachelor's thesis (pursuing B.Sc.)
  * Master's thesis (pursuing M.Sc.)
  * Doctoral thesis (pursuing Dr.-Ing. or Dr. rer. nat.)
* Support both variants of a doctoral thesis:
  * Pre-acceptance variant, for submission ("Prüfexemplar")
    * Required title page
    * CV
    * Separate list of all own publications (even if they have not been cited in the thesis)
    * Keywords
  * Accepted variant, for publication ("Belegexemplar")
    * Required title page
    * Preface enabled by default
    * Regular bibliography with other's and own publications.
    * No CV and keywords.
  * Preliminary variant, for reduced-anxiety editing
    * Unofficial-looking title page
* Compliance with university, faculty and work group requirements (no guarantees though)
* Metadata (author name, thesis title etc.) centrally defined in main document
* Page layout, fonts etc. according to typographical standards
* Document structure:
  * Title page
  * Preface (optional)
  * Abstract
  * Table of Contents
  * List of figures
  * List of tables
  * List of abbreviations and symbols
  * (Main content)
  * Bibliography
  * Appendixes (optional)
  * CV (doctoral, submission variant only)
  * Own publications (doctoral, submission variant only)
  * Keywords (doctoral, submission variant only)
* Common packages already included, e.g.
  * babel
  * biblatex
  * booktabs
  * hyperref
  * longtable
  * microtype
  * minted


Class options
-------------

The EMTthesis document class supports the following options, which can be given via:

        \documentclass[option1=value1, option2=value2]{emtthesis}

* **thesistype**: Thesis type, by pursued degree:
  * `bsc`: Bachelor of Science (B.Sc.) [default]
  * `msc`: Master of Science (M.Sc.)
  * `dring`: Doktor der Ingenieurwissenschaften (Dr.-Ing.)
  * `drrernat`: Doktor der Naturwissenschaften (Dr. rer. nat.)
* **preface**: Whether to include a preface in the document.
  * `auto`: Include for accepted doctoral theses only. [default]
  * `always`: Enable preface.
  * `never`: Disable preface.
* **onehalfspacingmode**: When to use 1.5x line spacing in the document.
  * `auto`: Use 1.5x spacing for all user-provided text, but single spacing for the table of contents, lists of figures etc. and bibliography. [default]
  * `mainmatter`: Use 1.5x spacing only for the mainmatter, i.e. keep preface and abstracts in single spacing.
  * `never`: Typeset the entire document with single spacing.
* **docstate**: Select document state / variant for doctoral theses.
  * `preliminary`: Typeset the `submission` variant with possible causes for author anxiety omitted. [default]
  * `submission`: Typeset the to-be-submitted variant ("Prüfexemplar") with the appropriate title page and a backmatter containing the CV, list of all own publications and keywords.
  * `accepted`: Typeset the accepted variant, for publishing ("Belegexemplar").
* **singlecitelabel**: Toggle cite label format for multi-author sources.
  * `false`: Use up to three author's initials in label. For Mustermann and Doe, set [MD18]. [default]
  * `true`: Always use only the first author's name in label. For Mustermann and Doe, set [Mus18].
* **useminted**: Toggle package usage for `minted`.
  * `true`: Automatically include `minted` package. [default]
  * `false`: Do not include `minted`, e.g. when using `listings` instead.


Using with Git
--------------

If you use git to track changes in your thesis (which you should!), the following workflow is recommended:

1. (Optional) Create remote repository (e.g. on [Gogs](https://gogs.emt.uni-paderborn.de/))
2. Clone or create local repository
   * When using a remote repository as per Step 1, create a local clone:

         git clone https://gogs.emt.uni-paderborn.de/gogs/<yourname>/<yourrepo>.git

   * Otherwise, create a new repository:

         git init

3. Add the thesis template as an alternate remote:

       git remote add template https://gogs.emt.uni-paderborn.de/emt/EMTthesis.git

4. Pull the template:

       git pull template master

Now, you can start with a fresh template, with the following behaviour:
* Adding commits will add them to your own master.
* Pushing your changes with `git push` will push them to your own remote (not the template).
* Calling `git pull template master` again will update the template.
* Updating the template will *not* overwrite your local changes.
* As long as you do not change core files like `emtthesis.cls`, no merge conflicts should occur.
