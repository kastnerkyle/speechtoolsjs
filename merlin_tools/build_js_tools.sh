bin_dir="SPTK-3.9/bin"
lib_dir="SPTK-3.9/lib"

lib_o_files=`ls "$lib_dir"/*.o | tr "\n" " "`
echo $lib_o_files

for i in `ls -d $bin_dir/*/`; do
    echo $i
    target_dir=$i
    name=`basename $target_dir`
    target_o_files=`ls "$target_dir"/*.o | tr "\n" " "`

    # common to many binaries
    fftextras=`ls "$bin_dir"/fft/_*.o | tr "\n" " "`
    fftrextras=`ls "$bin_dir"/fftr/_*.o | tr "\n" " "`
    fftrextras="$fftextras $fftrextras"

    ifftextras=`ls "$bin_dir"/ifft/_*.o | tr "\n" " "`
    ifftrextras=`ls "$bin_dir"/ifftr/_*.o | tr "\n" " "`
    ifftrextras="$ifftextras $ifftrextras"

    if [ $name == "acep" ]; then
        extras=`ls "$bin_dir"/lmadf/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras"
    elif [ $name == "agcep" ]; then
        extras1=`ls "$bin_dir"/glsadf/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras1 $extras2"
    elif [ $name == "amcep" ]; then
        extras1=`ls "$bin_dir"/mlsadf/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/b2mc/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras1 $extras2"
    elif [ $name == "c2acr" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "c2ndps" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "c2sp" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "dct" ]; then
        target_o_files="$fftextras"
    elif [ $name == "delta" ]; then
        extras=`ls "$bin_dir"/mlpg/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras"
    elif [ $name == "df2" ]; then
        extras=`ls "$bin_dir"/dfs/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras"
    elif [ $name == "excite" ]; then
        extras=`ls "$bin_dir"/nrand/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras"
    elif [ $name == "fft2" ]; then
        target_o_files="$fftextras"
    elif [ $name == "fftcep" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "fftr" ]; then
        target_o_files="$fftextras"
    elif [ $name == "fftr2" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "gc2gc" ]; then
        extras1=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        target_o_files="$target_o_files $extras1 $extras2"
    elif [ $name == "gcep" ]; then
        extras1=`ls "$bin_dir"/gc2gc/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3 $fftrextras $ifftrextras"
    elif [ $name == "glsadf" ]; then
        extras1=`ls "$bin_dir"/zerodf/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/poledf/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        extras4=`ls "$bin_dir"/lmadf/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3 $extras4"
    elif [ $name == "grpdelay" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "idct" ]; then
        extras=`ls "$bin_dir"/dct/_*.o | tr "\n" " "`
        target_o_files="$extras $iffrextras $fftrextras"
    elif [ $name == "ifft" ]; then
        target_o_files="$fftextras"
    elif [ $name == "ifft2" ]; then
        target_o_files="$ifftextras"
    elif [ $name == "ifftr" ]; then
        target_o_files="$ifftextras"
    elif [ $name == "imsvq" ]; then
        extras=`ls "$bin_dir"/ivq/_*.o | tr "\n" " "`
        target_o_files="$extras $iffrextras $fftrextras"
    elif [ $name == "lpc" ]; then
        extras1=`ls "$bin_dir"/acorr/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/levdur/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2"
    elif [ $name == "mcep" ]; then
        extras=`ls "$bin_dir"/freqt/_*.o | tr "\n" " "`
        target_o_files="$extras $fftrextras $ifftrextras"
    elif [ $name == "mfcc" ]; then
        extras1=`ls "$bin_dir"/dct/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/window/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $fftrextras"
    elif [ $name == "mgc2mgc" ]; then
        extras1=`ls "$bin_dir"/gc2gc/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/freqt/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        extras4=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3 $extras4"
    elif [ $name == "mgc2sp" ]; then
        extras1=`ls "$bin_dir"/mgc2mgc/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/c2sp/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3"
    elif [ $name == "mgcep" ]; then
        extras1=`ls "$bin_dir"/gc2gc/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/b2mc/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/mc2b/_*.o | tr "\n" " "`
        extras4=`ls "$bin_dir"/ignorm/_*.o | tr "\n" " "`
        extras5=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3 $extras4 $extras5 $ifftrextras $fftrextras"
    elif [ $name == "mglsadf" ]; then
        extras1=`ls "$bin_dir"/mlsadf/_*.o | tr "\n" " "`
        extras2=`ls "$bin_dir"/mc2b/_*.o | tr "\n" " "`
        extras3=`ls "$bin_dir"/gnorm/_*.o | tr "\n" " "`
        target_o_files="$extras1 $extras2 $extras3"
    elif [ $name == "mlsacheck" ]; then
        target_o_files="$fftrextras $ifftrextras"
    elif [ $name == "mlsadf" ]; then
        extras1=`ls "$bin_dir"/mc2b/_*.o | tr "\n" " "`
        target_o_files="$extras"
    elif [ $name == "ndps2c" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "pitch" ]; then
        extras1=`ls "$bin_dir"/pitch/snack/*.o | tr "\n" " "`
        target_o_files="$extras1"
        #extras2=`ls "$bin_dir"/pitch/swipe/*.o | tr "\n" " "`
        #target_o_files="$extras1 $extras2"
    elif [ $name == "phase" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "smcep" ]; then
        target_o_files="$ifftrextras $fftrextras"
    elif [ $name == "spec" ]; then
        target_o_files="$fftrextras"
    elif [ $name == "uels" ]; then
        target_o_files="$ifftrextras $fftrextras"
    fi

    emcc -O0 $lib_o_files $target_o_files -o out.js
    echo "complete"
done
