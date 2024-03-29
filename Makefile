##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Sat Aug 21 14:20:30 CEST 2021
## Last Modified: Fri Aug 12 11:14:28 CEST 2022
## Syntax:        GNU Makefile
## Filename:      humdrum-polish-scores/Makefile
## vim:           ts=3
##
## Description:   Makefile for various actions in the
##                humdrum-polish-scores repository.
##

DIR1 = ../production-polish-scores/krn-diplomatic/out
DIR2 = ../production-polish-scores/krn-final/out

.PHONY: sic


all:
	@echo
	@echo "make note-count      -- Count the number of notes by library."
	@echo "make composers       -- List composers and counts of files for each."
	@echo "make files           -- Count files by library."
	@echo "make file-composers  -- List composer components of filenames."
	@echo
	@echo "Maintenance targets:"
	@echo "   make update       -- Copy scores from production repository."
	@echo "   make source-files -- Count files by library in prod. repo."
	@echo



##############################
##
## update: List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

u: update
update: clear copyscores readme



##############################
##
## copyscores: Copy scores from production repository.
##

copyscores:
	bin/updateScores $(DIR1) ./
	bin/updateScores $(DIR2) ./



##############################
##
## readme: Generate a new README file based on updated scores.
##

readme:
	@bin/makeReadme > README.md


##############################
##
## clear: Remove old kern files in preparation for copying
##     updated files from production repository.
##

clear:
	bin/clearScores



##############################
##
## libraries: List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

l: libraries
library: libraries
libraries:
	bin/updateScores -l $(DIR1) ./
	bin/updateScores -l $(DIR2) ./



##############################
##
## source-files: List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

sf: source-files
source-files: libraries



##############################
##
## note-count: Count the number of notes by library.
##

n: note-count
nc: note-count
notes: note-count
cn: note-count
count-notes: note-count
count-note: note-count
note-counts: note-count
notecount: note-count
notecounts: note-count
countnotes: note-count
countnote: note-count
note-count:
	@bin/countNotes



##############################
##
## composers: List the composers represented in the
##     repository along with a count of the number of
##     digital scores for each composer.
##

c: composers
composer: composers
composers:
	@grep -h COM pl-*/kern/*.krn | sed 's/^\!\!\!COM: //' | sort | uniq -c



##############################
##
## file-composers: List the composers names found in files.
##     Filenames should be structured:
##        id_composer--title.krn
##     So this command removes everything before the (last) underscore, and
##     then removes everything after the first -- that is left.  This should
##     result in the composer.
##

fc: file-composers
file-composer: file-composers
file-composers:
	@ls pl-*/kern/* | sed 's/.*_//; s/--.*//' | sort | uniq -c



##############################
##
## reference-keys: List all reference record keys in database.
##

rk: reference-keys
reference-keys:
	@grep -rh "^\!\!\![^\!:]*:" */kern | sed 's/:.*//; s/^\!*//' | sort | uniq


###########################################################################
##
## Derivative files: Create variants of data in kern directories.
##
## */sic       == Apply sic corrections to Humdrum scores.
## */keyscapes == Generate keyscapes for Humdrum scores.
## */modern    == Apply modernization filters to Humdrum scores.
## */midi      == Generate MIDI files from Humdrum scores.
## */mei       == Generate MEI files from Humdrum scores.
##
###########################################################################

##############################
##
## derivatives -- Create derivative files from original kern files.
##

d: derivatives
derivatives: sic keyscape modern midi mei



##############################
##
## clean: Remove derived files.
##

clean: clean-keyscape clean-modern clean-sic clean-midi clean-mei



##############################
##
## keyscape: Create keyscapes for each score in [rismid]/keyscape,
##    with index in [rismid]/keyscape/index.html.  These keyscapes
##    are showing functional harmonic structure, where green is tonic,
##    blue is dominant, yellow is subdominant, purple is submediant,
##    red is mediant, supertonic is dark blue and subtonic is orange.
##    These keyscapes can be used to check the key designation for each
##    score, since keyscapes that do not have green as their primary color
##    most likely have an incorrect key designation in the file.
##

k: keyscape
ks: keyscape
keyscapes: keyscape
keyscape:
	bin/makeKeyscape



##############################
##
## clean-keyscape: Delete [rismid]/keyscape directories.
##

clean-keyscapes: clean-keyscape
clean-keyscape:
	rm -rf *-*/keyscape



##############################
##
## modern: Create modern scores for the data.
##

m: modern
modernize: modern
modern:
	bin/makeModern



##############################
##
## clean-modern: Delete [rismid]/modern directories.
##

modern-clean: clean-modern
clean-modern:
	-rm -rf *-*/modern



##############################
##
## midi: Create MIDI files from kern files (implicitly applying sic first).
##

mid: midi
midi:
	bin/makeMidi



##############################
##
## clean-midi: Delete [rismid]/midi directories.
##

midi-clean: clean-midi
clean-midi:
	-rm -rf *-*/midi



##############################
##
## mei: Create MEI files.
##

mei:
	bin/makeMei



##############################
##
## clean-mei: Delete [rismid]/mei directories.
##

mei-clean: clean-mei
clean-mei:
	-rm -rf *-*/mei



##############################
##
## sic: Apply sic corrections to scores, saving output data in "sic"
##     directory by rism source archive.
##

sic:
	bin/makeSic



##############################
##
## clean-sic: Delete sic directory if it exists.
##

sic-clean: clean-sic
clean-sic:
	-rm -rf *-*/sic


##############################
##
## unicode: List all UTF-8 characters in digital scores if not ASCII.
##

unicode:
	@bin/listUnicodeCharacters

#
# list only UTF-8 characters in **text spines:
#

unicode-lyrics: unicode-text
unicode-text:
	@bin/listUnicodeCharacters --text

#
# list only UTF-8 characters in local comments:
#

unicode-local:
	@bin/listUnicodeCharacters --local



##############################
##
## verse-check: Check for verse numbers embedded in data
##     rather than in a tandem interpretation.
##

checkVerse: verse-check
checkverse: verse-check
check-verse: verse-check
cv: verse-check
vc: verse-check
verse-check:
	@bin/verseCheck





