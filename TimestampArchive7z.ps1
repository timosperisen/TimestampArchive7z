$v = '%v'                                                   # input variable that comes from the Explorer context menu
                                                            # e.g c:\temp\foo
$a = $v.split('\')                                          # split the input by backslash                                                            
$l = $a.length-1                                            # save the length-1 to get the last part "foo"
$na = $a[0..($l-1)]                                         # create a new array that holds only c: and temp
$od = $na -join '\'                                         # join the new array back to get c:\temp output directory
$dn =$a[$l]                                                 # save last element (foo) from array to directory name variable
$ts = $(get-date -f yyyy-MM-dd_hhmmss)                      # create a nice timestamp for the filename
$fn = -join('archive_', $dn , '_', $ts, '.zip')             # create a nice filename like backup_oo_2016-09-28_0920.zip
$alias = -join($env:ProgramFiles, '\', '7-Zip\7z.exe')      # powershell doesn't like to call 7z directly...
set-alias sz $alias                                         # so ... let's create an alias for 7z
$cp = -join($od, '\', $fn)                                  # create complete path using output directory and filename
sz a  $cp $v                                                # run 7z command

# finally merge it in one line (remove comments)
# call it using 
# powershell.exe -NonInteractive -command "[code without comments and line breaks]"

# final oneliner to use in registry:
# powershell.exe -NonInteractive -command "$v = '%v';$a = $v.split('\');$l = $a.length-1;$na = $a[0..($l-1)];$od = $na -join '\';$dn =$a[$l];$ts = $(get-date -f yyyy-MM-dd_hhmmss);$fn = -join('archive_', $dn , '_', $ts, '.zip');$alias = -join($env:ProgramFiles, '\', '7-Zip\7z.exe');set-alias sz $alias;$cp = -join($od, '\', $fn);sz a  $cp $v"
