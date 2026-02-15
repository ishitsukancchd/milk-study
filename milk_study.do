


*main results

*milk intake energy-adjusted by density method

*total milk, milk intake
*SGA
putexcel set "result_milkR1.xlsx", sheet("regress") modify
local col "16"
foreach a in  milkMT2d5 { 
logistic SGA1 i.`a' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel D`col' = matrix(res)
local col = `col'+1
}

*LGA
local col "16"
foreach a in  milkMT2d5 { 
logistic LGA i.`a' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel G`col' = matrix(res)
local col = `col'+1
}


*bw, bh, head, taiban
local export_exposure "16 "
local export_outcome "J M P S"
local i=1
foreach care in milkMT2d5 {
local j=1
foreach problem in bw bh head taiban {
regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}


*full fat milk only
*SGA
local col "21"
foreach a in  milkMT2d5 { 
logistic SGA1 i.`a' dr0m_m_age i.education1 i.primipara i.smoking i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0
}
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel D`col' = matrix(res)
local col = `col'+1

*LGA
local col "21"
foreach a in  milkMT2d5 { 
logistic LGA i.`a' dr0m_m_age i.education1 i.primipara i.smoking i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel G`col' = matrix(res)
local col = `col'+1
}

*bw, bh, head, taiban
local export_exposure "21 "
local export_outcome "J M P S"
local i=1
foreach care in milkMT2d5 {
local j=1
foreach problem in bw bh head taiban {
regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}


*low fat milk only
local col "26"
foreach a in  milkMT2d5 { 
logistic SGA1 i.`a' dr0m_m_age i.education1 i.primipara i.smoking i.alcohol1  i.marital i.preBMI1 i.DSMT2  if nmilkMT2==0
}

mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel D`col' = matrix(res)
local col = `col'+1


local col "26"
foreach a in  milkMT2d5 { 
logistic LGA i.`a' dr0m_m_age i.education1 i.primipara i.smoking i.alcohol1  i.marital i.preBMI1 i.DSMT2  if nmilkMT2==0
mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
putexcel G`col' = matrix(res)
local col = `col'+1
}

*bw, bh, head, taiban
local export_exposure "26 "
local export_outcome "J M P S"
local i=1
foreach care in milkMT2d5 {
local j=1
foreach problem in bw bh head taiban {

regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if nmilkMT2==0

mat A = r(table)
mat res = A[1,2..5]\A[5,2..5]\A[6,2..5]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)

local j = `j'+1
}
local i = `i'+1

}



*frequency milk
putexcel set "result_milkR1.xlsx", sheet("frequency1") modify

*all
*SGA
local export_exposure "12 28"
local export_outcome "G"
local i=1
foreach care in fulfatmilkfreq1MT2 lowfatmilkfreq1MT2  {
local j=1
foreach problem in SGA1 {

logistic `problem' i. `care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 
mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}

*bw,bh, 
local export_exposure "12 28"
local export_outcome "J M P S"
local i=1
foreach care in fulfatmilkfreq1MT2 lowfatmilkfreq1MT2 {
local j=1
foreach problem in bw bh head taiban {

regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 

mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)

local j = `j'+1
}
local i = `i'+1

}


*full fat only
local export_exposure "20"
local export_outcome "D"
local i=1
foreach care in fulfatmilkfreq1MT2   {
local j=1
foreach problem in SGA1 {

logistic `problem' i. `care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0
mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}


*full fat only
local export_exposure "20"
local export_outcome "G"
local i=1
foreach care in fulfatmilkfreq1MT2   {
local j=1
foreach problem in LGA {

logistic `problem' i. `care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0
mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}

*bw,bh, 
local export_exposure "20"
local export_outcome "J M P S"
local i=1
foreach care in fulfatmilkfreq1MT2  {
local j=1
foreach problem in bw bh head taiban {

regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if lmilkMT2==0

mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)

local j = `j'+1
}
local i = `i'+1

}

*low fat only
local export_exposure "36"
local export_outcome "D"
local i=1
foreach care in  lowfatmilkfreq1MT2  {
local j=1
foreach problem in SGA1 {

logistic `problem' i. `care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 if nmilkMT2==0
mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}


*LGA
local export_exposure "36"
local export_outcome "G"
local i=1
foreach care in  lowfatmilkfreq1MT2  {
local j=1
foreach problem in LGA {
logistic `problem' i. `care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2 if nmilkMT2==0
mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}


*bw,bh, 
local export_exposure "36"
local export_outcome "J M P S"
local i=1
foreach care in  lowfatmilkfreq1MT2 {
local j=1
foreach problem in bw bh head taiban {

regress `problem' i.`care' dr0m_m_age i.education1 i.primipara i.smoking1 i.alcohol1  i.marital i.preBMI1 i.DSMT2  if nmilkMT2==0

mat A = r(table)
mat res = A[1,2..8]\A[5,2..8]\A[6,2..8]
mat res = res'
mat l res
local row : word `i' of `export_exposure'
local col : word `j' of `export_outcome'
putexcel `col'`row' = matrix(res)
local j = `j'+1
}
local i = `i'+1
}










