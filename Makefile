##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Sat Aug 21 14:20:30 CEST 2021
## Last Modified: Sat Aug 21 14:20:32 CEST 2021
## Syntax:        GNU Makefile
## Filename:      humdrum-polish-scores/Makefile
## vim:           ts=3
##
## Description:   Makefile for various actions in the
##                humdrum-polish-scores repository.
##


##############################
##
## update -- List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

u: update
update:
	bin/updateScores ../production-polish-scores/krn-diplomatic/out ./



##############################
##
## libraries -- List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

l: libraries
library: libraries
libraries:
	bin/updateScores -l ../production-polish-scores/krn-diplomatic/out ./



##############################
##
## count-files -- List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

count-files: libraries
cf: libraries
f: libraries
files: libraries



##############################
##
## count-files -- List the library sigla and file counts for
##     incoming files from the production repository.  This
##     can be used to check for errors in sigla or data files
##     that are not prefixed with a siglum.
##

notes: count-notes
cn: count-notes
n: count-notes
count-notes:
	@bin/countNotes


##############################
##
## composers -- List the composers represented in the
##     repository along with a count of the number of
##     digital scores for each composer.
##

composers:
	@grep -h COM pl-*/kern/*.krn | sed 's/^\!\!\!COM: //' | sort | uniq -c



