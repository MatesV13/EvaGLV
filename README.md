# EvaGLV
Sustav za brzo i jednostavno testiranje velikog broja kodova (kao nakon testa)

Postupak za evaluator:

0. Sam folder EvaGLV staviti direktno u C:\
1. Folder s testnim podacima stavlja se u folder C:\EvaGLV\test
2. Foldere učenika staviti u C:\EvaGLV\ucenici
3. Win + R -> cmd
   pomoću naredbi "cd\" i "cd EvaGLV" dođe se do foldera C:\EvaGLV
   (ili na bilo koji drugi način ući u cmd i doći do C:\EvaGLV)

Naglasak:
U folder test stavljaju se folderi nazvani po zadacima, u kojim su testni primjeri u obliku 1.in -> 1.out, 2.in -> 2.out...
U folder ucenici stavljaju se folderi s imenima učenika i rješenjima unutra. Rješenja moraju biti nazvana ime_zadatka.p

Opis funkcija:

T [ime_ucenika]
Vraća evaluaciju svih zadataka iz foldera ime_učenika 
Dodatno, u folder ucenici/ime_ucenika stavlja se eval.txt s rezultatima evaluacije (na dnu se nalazi kumulativni rezultat)
Dodatno, u folder ucenici stavlja se eval.txt s rezultatima evaluacije svih učenika. Ako postoji argument ime_ucenika, sadržaj se samo nadoda, dok se sadržaj resetira ako se T zove bez dodatnih argumenata.

p [ime_ucenika] [zadatak] [testni_primjer]
Testira zadatak.py unutar ucenici/ime_ucenika na testnom_primjeru

ispravljac
Staviti ga u folder s testnim primjerima oblika ime.in.tp odnosno ime.out.tp
Sve testne primjere pretvorit će u tp.in odnosno tp.out kako bi na njima pravilno radio ovaj evaluator!


Dodatne napomene:
1. Ispravljač popravlja službene testne podatke sa službenih natjecanja u RH, tako da se i oni mogu koristiti.
2. Ukoliko sami stvarate testne podatke, možete sve testne podatke stvoriti ručno u npr. notepadu i fileove prigodno nazvati 
   - Neka je X broj testnog primjera. Tada ulaz mora biti u fileu X.in, a izlaz u X.out. 
3. "Cheat": Stvorite ulaz i rješenje. Linija "C:\Windows\py.exe rjesenje.py < X.in > X.out" (gdje X zamjenite brojem testnog primjera) (pokrenuti u command lineu)
Gornja linija dati će vam sve potrebne izlaze, umjesto da copy pasteate ulaz i izlaz u/iz shella.
4. Alternativno, možete testne podatke stvoriti i uređivati unutar Hightaila (https://codeforces.com/blog/entry/13141)
