

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



