
:- module(install, [install_gamehub/0]).
/** <module> this module ensures required packs are loaded
 *
 */

:- use_module(library(prolog_pack)).


pack_deps([func, lambda]).


install_gamehub :-
  search(Installs),
  install_packs(Installs).


list_packs(Packs) :-
  findall(Pack, prolog_pack:current_pack(Pack), Packs).


search(Installs) :-
  list_packs(Packs),
  pack_deps(Deps),
  subtract(Deps, Packs, Installs).

  
install_packs([]) :-
  writeln('Congratulations, all dependencies are met.').

install_packs([P|_]) :-
  pack_install(P),
  search(Remaining),
  install_packs(Remaining).
  

