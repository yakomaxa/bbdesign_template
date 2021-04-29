n=${1}
sed -i "s/VAL/ALA/g" ${n}
cp ${n} input.pdb
/home/lab/software/Rosetta/main/source/bin/make_blueprint.static.linuxgccrelease -s ${n} -database /home/lab/software/Rosetta/main/database
cat default.blueprint | grep -v SSP  | sed "s/ \./ R/g" | sed "s/ A / V /g"> input1.bbskel
cat default.blueprint | grep -v SSP  | sed "s/ \./ R/g" | sed "s/ A / V /g"> input2.bbskel

/home/lab/software/Rosetta/main/source/bin/rosetta_scripts.static.linuxgccrelease -database /home/lab/software/Rosetta/main/database  -s ./input.pdb -parser:protocol ./input.xml -nstruct 2500 -restore_talaris_behavior
