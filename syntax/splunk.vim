" Vim syntax file
" Language: Splunk Query Language
" Maintainer: Robert Raftery
" Version: 0.1
" Release Date: 10/05/2014
" See: http://www.splunk.com for more information

if exists("b:current_syntax")
  finish
endif

" Splunk is case insensitive about most things
syn case ignore

" Splunk Special Fieldnames and Constants
syn keyword splunkSpecial  false null true _raw _time apache jboss siteminder

" Splunk Operators
syn keyword splunkOperator as by over size
syn case match
" This is the ONE thing that Splunk is VERY CASE SENSITIVE about...
" The Splunk SEARCH Operators are CASE SENSITIVE
syn keyword splunkOperator AND NOT OR
syn keyword splunkBadOp    and not or
syn case ignore

" Splunk Keywords - list is not exhaustive  TODO: add more as you discover them
syn keyword splunkKeyword  agg allnum bins bottom bucketing-option cont
syn keyword splunkKeyword  count delim earliest end field fixedrange format
syn keyword splunkKeyword  host in index latest limit minspan notin nullstr
syn keyword splunkKeyword  otherstr partial sep single-agg source span start
syn keyword splunkKeyword  top usenull useother

" not strictly keywords, these are commonly used fieldnames for Apache logs
syn keyword splunkKeyword  access_request clientip other referer status
syn keyword splunkKeyword  useragent

" Splunk Search Commands
" http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Abstract
syn keyword splunkCommand  ABSTRACT ACCUM ADDCOLTOTALS ADDINFO ADDTOTALS
syn keyword splunkCommand  ANALYZEFIELDS ANOMALIES ANOMALOUSVALUE APPEND
syn keyword splunkCommand  APPENDCOLS APPENDPIPE ASSOCIATE AUDIT
syn keyword splunkCommand  AUTOREGRESS BIN BUCKET BUCKETDIR CHART
syn keyword splunkCommand  CLUSTER COLLECT CONCURRENCY CONTINGENCY
syn keyword splunkCommand  CONVERT CORRELATE CRAWL DBINSPECT DEDUP
syn keyword splunkCommand  DELETE DELTA DIFF EREX EVAL EVENTCOUNT
syn keyword splunkCommand  EVENTSTATS EXTRACT FIELDFORMAT FIELDS
syn keyword splunkCommand  FIELDSUMMARY FILLDOWN FILLNULL FINDTYPES
syn keyword splunkCommand  FOLDERIZE FORMAT GAUGE GENTIMES HEAD
syn keyword splunkCommand  HIGHLIGHT HISTORY ICONIFY INPUT INPUTCSV
syn keyword splunkCommand  INPUTLOOKUP IPLOCATION JOIN KMEANS KVFORM
syn keyword splunkCommand  LOADJOB LOCALIZE LOCALOP LOOKUP
syn keyword splunkCommand  MAKECONTINUOUS MAKEMV MAP METADATA METASEARCH
syn keyword splunkCommand  MULTIKV MULTISEARCH MVCOMBINE MVEXPAND NOMV
syn keyword splunkCommand  OUTLIER OUTPUTCSV OUTPUTLOOKUP OUTPUTTEXT
syn keyword splunkCommand  OVERLAP PREDICT RANGEMAP RARE REGEX RELEVANCY
syn keyword splunkCommand  RELTIME RENAME REPLACE REST RETURN REVERSE
syn keyword splunkCommand  REX RTORDER RUN SAVEDSEARCH SCRIPT SCRUB
syn keyword splunkCommand  SEARCH SEARCHTXN SELFJOIN SET SETFIELDS
syn keyword splunkCommand  SENDEMAIL SICHART SIRARE SISTATS SITIMECHART
syn keyword splunkCommand  SITOP SORT SPATH STATS STRCAT STREAMSTATS
syn keyword splunkCommand  TABLE TAGS TAIL TIMECHART TOP TRANSACTION
syn keyword splunkCommand  TRANSPOSE TRENDLINE TYPEAHEAD TYPELEARNER
syn keyword splunkCommand  TYPER UNIQ UNTABLE WHERE X11 XMLKV
syn keyword splunkCommand  XMLUNESCAPE XPATH XYSERIES

" Splunk Functions for EVAL command
" http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/CommonEvalFunctions
syn keyword splunkFuncEval  abs case ceil cidrmatch coalesce
syn keyword splunkFuncEval  commands exact exp floor if isbool isint
syn keyword splunkFuncEval  isnotnull isnull isnum isstr len like
syn keyword splunkFuncEval  ln log lower ltrim match max md5 min
syn keyword splunkFuncEval  mvappend mvcount mvfilter mvfind
syn keyword splunkFuncEval  mvindex mvjoin mvrange mvzip now null
syn keyword splunkFuncEval  nullif pi pow random relative_time
syn keyword splunkFuncEval  replace round rtrim searchmatch sha1
syn keyword splunkFuncEval  sha256 sha512 sigfig spath split sqrt
syn keyword splunkFuncEval  strftime strptime substr time tonumber
syn keyword splunkFuncEval  tostring tostring tostring tostring
syn keyword splunkFuncEval  trim typeof upper urldecode validate

" Splunk Functions for STATS, GEOSTATS, CHART, TIMECHART commands
" http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/CommonStatsFunctions
syn keyword splunkFuncStats  avg avg c count sparkline dc
syn keyword splunkFuncStats  distinctcount earliest estdc
syn keyword splunkFuncStats  estdc_error exactperc first last latest
syn keyword splunkFuncStats  list max max mean median min mode p
syn keyword splunkFuncStats  perc50 perc95 per_day per_hour
syn keyword splunkFuncStats  per_minute per_second range stdev
syn keyword splunkFuncStats  stdevp sum sumsq upperperc values var
syn keyword splunkFuncStats  varp

" Strings and characters:   (snarfed from oracle sql syntax file)
syn region splunkString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region splunkString		start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:   (also, snarfed from oracle sql syntax file)
syn match splunkNumber		"-\=\<\d*\.\=[0-9_]\>" display

" Splunk Date Constants  (not snarfed from anywhere)
syn match splunkDateTime "\<\d\d\?/\d\d\?/\d\d\d\d:\d\d\?:\d\d\?:\d\d\?\>" display contains=splunkNumber

" Splunk Relative Time => TODO: optimize the regex's, 
" (lovingly handcrafted, based on the Splunk docs)
" http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/SearchTimeModifiers#How_to_specify_relative_time_modifiers
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(seconds\|second\|secs\|sec\|s\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(minutes\|minute\|mins\|min\|m\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(hours\|hour\|hrs\|hr\|h\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(days\|day\|d\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(weeks\|week\|w\)\([0-7]\|\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(months\|month\|mon\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(quarters\|quarter\|qtrs\|qtr\|q\)\(\s\|$\|+\|-\|@\)\@="  display
syn match splunkRelativeTime "\([-+]\?\(\d\+\)\|@\|+\|-\)\(years\|year\|yrs\|yr\|y\)\(\s\|$\|+\|-\|@\)\@="  display

" Todo.
syn keyword splunkTodo  contained TODO FIXME XXX DEBUG NOTE

" As of 8.1.0, Splunk now has comments.
" https://docs.splunk.com/Documentation/Splunk/8.1.0/Search/Comments
syn region splunkComment start="```" end="```" extend contains=splunkTodo

syn sync ccomment splunkComment


let b:current_syntax = "splunk"

hi link splunkComment      Comment
hi link splunkOperator     Special
hi link splunkSpecial      Special
hi link splunkKeyword      Identifier
hi link splunkCommand      Statement
hi link splunkNumber       Constant
hi link splunkString       Constant
hi link splunkDateTime     Constant
hi link splunkRelativeTime Constant
hi link splunkTodo         Todo
hi link splunkFuncEval     Type
hi link splunkFuncStats    Type
hi link splunkBadOp        Error
" eof
