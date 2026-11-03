#!/bin/bash
cd "$(dirname "$0")/data" || { echo "data/ folder not found next to this script"; exit 1; }

echo "== MONTHLY RANGE =="
awk -F',' 'NR==1{for(i=1;i<=NF;i++){h=$i;gsub(/"/,"",h); if(h=="MthCalDt")c=i; if(h=="PERMNO")p=i}; next}
{d=$c; gsub(/"/,"",d); if(min==""||d<min)min=d; if(d>max)max=d; if(d>last[$p])last[$p]=d}
END{n=0;dead=0; for(k in last){n++; if(last[k]<"2025-12")dead++};
print "Monthly:",min,"to",max,"|",NR-1,"rows |",n,"PERMNOs |",dead,"stop before Dec 2025"}' Monthly.csv

echo
echo "== APPLE SPLIT CHECK (Jul-Sep 2020) =="
grep '^14593,' Monthly.csv | grep '2020-0[789]'

echo
echo "== DAILY FILES =="
for f in 19*.csv 20*.csv; do
  awk -F',' -v f="$f" 'NR==1{for(i=1;i<=NF;i++){h=$i;gsub(/"/,"",h); if(h=="DlyCalDt")c=i}; next}
  {d=$c; gsub(/"/,"",d); if(min==""||d<min)min=d; if(d>max)max=d}
  END{print f,":",min,"to",max,"|",NR-1,"rows"}' "$f"
done

echo
echo "== OTHER FILES =="
for f in F-F_*.csv ME_Breakpoints.csv Prior_2-12_Breakpoints.csv 10_Portfolios_Prior_12_2.csv q5_factors_monthly_2025.csv USREC.csv; do
  echo "--- $f"
  head -6 "$f" | cut -c1-150
  echo "(last line)"
  tail -1 "$f" | cut -c1-150
done

echo
echo "== DONE =="