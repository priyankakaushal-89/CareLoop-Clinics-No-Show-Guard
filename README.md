# Clinic No-Show Project

## Findings
1. Part 1: 1020 -> 954 clean, 66 rejected (20 duplicate, 20 missing distance, 12 missing age, 6 invalid appt_date, 4 missing status, 4 invalid age). No-show 21.38% (204/954), attendance 78.62%.
2. Part 2: Reminder Yes 15.23% vs No 29.58%; lead 15+ days 32.74% vs 0-3 days 12.78%; distance 15km+ 30.77%; worst clinic C08 32.95%, best C05 13.39%.
3. Part 3: Chosen logistic regression (C=0.1), CV ROC-AUC 0.792, test AUC 0.731. At threshold 0.35: precision 0.50, recall 0.37, F1 0.43, flagged 38/239. Reminder No->Yes OR 0.43.
4. Part 4: Of 10 notes, forgot 2, distance 2, work 2. Both forgot notes (N001,N007) had reminder_sent=No (2/2). 5/10 notes had reminder_sent=No.

## Recommendation
Send reminders earlier + second reminder for lead 15+ days and distance 15km+ patients. Reminders associated with lower no-show odds (OR 0.43) and forgetting was joint-most-common in notes, both forgot cases had no reminder. Pilot on one clinic (e.g. C08) and re-measure - do not roll out clinic-wide on this evidence alone.

## Limitations
1. 10 notes are illustration, cannot show real reason clinic-wide.
2. Cleaning stats from all rows before split; split is random, same period - no true future test.
3. Observational data, associations are not causes.
4. Small subgroups (age <18 n=4); threshold/AUC from one split.

## Files
- 01_ingest_clean.ipynb, rejected_rows.json, appointments_clean.csv, clinics_enriched.csv
- 02_queries.sql, 02_queries.ipynb
- 03_model.ipynb, test_risk_scores.csv
- 04_genai.ipynb, notes_analysed.csv
- README.md
- data/ (3 original files)

## Reproduce
Run notebooks 01 -> 04. Part 4 needs Google AI Studio key (paste at runtime, never commit it).

## How to develop in GitHub
1. Create public repo, upload files (Add file > Upload files), or clone + git add . + git commit -m '...' + git push.
2. Edit in Colab, download .ipynb, re-upload to overwrite. For .sql/.md edit on github.com or press . for github.dev.
3. Every change = one commit with clear message. Check repo is Public in incognito before submitting link.
