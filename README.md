# Robust Momentum on US Equities

Applied Investments (Prof. Amit Goyal), HEC Lausanne, Fall 2026, portfolio strategy project.

**Research question:** Can a momentum strategy we design keep the momentum premium, reduce its crashes, and still earn alpha after costs, out of sample?

The strategy starts from standard 12-1 momentum and adds (i) a signal chosen in-sample among 12-1, 12-7, 6-2 and residual momentum, (ii) our own crash-protection rule that scales down the short leg in bear markets with high loser volatility, and (iii) a turnover buffer. Real-time Moreira-Muir volatility scaling is the competitor to beat. Design period: 1963–2011. Out-of-sample test: 2012–2025.

## Repository structure

```
momentum-project/
├── README.md
├── .gitignore
├── Momentum_Robust_Notebook.ipynb   main notebook (Parts 0–15)
├── data/                            NOT on GitHub, each member keeps a local copy
└── output/                          figures and tables exported by the notebook
```

## Data (not in the repo)

The data are not pushed to GitHub: the CRSP files are too large (several GB) and are licensed through WRDS, so they cannot be redistributed. Each member gets the data folder from the group's shared drive and places it in `data/` inside the repo folder. Do not rename the files: the notebook finds them by name.

| File | Source | Content |
|------|--------|---------|
| `Monthly.csv` | CRSP (WRDS), CIZ format | Monthly stock file: PERMNO, MthCalDt, MthRet, MthPrc, ShrOut, MthVol, PrimaryExch, SecurityType, SecuritySubType, ShareType, USIncFlg |
| `1959.12.31_1964.12.31.csv` … `2010.01.04_2025.12.31.csv` (5 files) | CRSP (WRDS), CIZ format | Daily stock file: PERMNO, DlyCalDt, DlyPrc, DlyRet |
| `F-F_Research_Data_Factors.csv` | Kenneth French Data Library | FF3 factors and risk-free rate (monthly) |
| `F-F_Research_Data_5_Factors_2x3.csv` | Kenneth French Data Library | FF5 factors (monthly) |
| `F-F_Momentum_Factor.csv` | Kenneth French Data Library | UMD (monthly) |
| `ME_Breakpoints.csv` | Kenneth French Data Library | NYSE market-cap breakpoints |
| `Prior_2-12_Breakpoints.csv` | Kenneth French Data Library | NYSE momentum breakpoints |
| `10_Portfolios_Prior_12_2.csv` | Kenneth French Data Library | Momentum decile portfolios (validation) |
| `q5_factors_monthly_2025.csv` | global-q.org | q and q5 factors (monthly) |
| `USREC.csv` | FRED | NBER recession indicator |

## Setup

1. Clone the repo **outside iCloud Drive** (e.g. `~/Projects/`): iCloud offloads large files and can corrupt Git folders.
2. Copy the data files into `data/`.
3. Open `Momentum_Robust_Notebook.ipynb` and run from Part 0.

## Working rules

- **Pull before you start, push when you stop.**
- **Clear notebook outputs before committing** (Kernel → Restart & Clear Output) to avoid merge conflicts.
- **One person per Part at a time.** Agree in the group chat who works on which Part.
- **Never commit data.** If GitHub Desktop shows a `.csv` from `data/` in the changes list, stop and check `.gitignore`.
- **Design freeze:** once Part 9 is complete, tag the commit `design-freeze`. No in-sample parameter changes after that tag.

## Group

- Member 1
- Member 2
- Member 3
