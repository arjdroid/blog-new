#let bib-data = bytes("
  hedden_options_2015:
    type: article
    title: Options and {Diachronic} {Tragedy}
    author: Hedden, Brian
    date: 2015-03
    page-range: 423-451
    url:
      value: https://onlinelibrary.wiley.com/doi/10.1111/phpr.12048
      date: 2026-02-12
    serial-number:
      doi: 10.1111/phpr.12048
      issn: 0031-8205, 1933-1592
    parent:
      type: periodical
      title: Philosophy and Phenomenological Research
      issue: 2
      volume: 90
  bartha_satan_2014:
    type: article
    title:
      value: 'Satan, {Saint} {Peter} and {Saint} {Petersburg}: {Decision} theory and discontinuity at infinity'
      short: Satan, {Saint} {Peter} and {Saint} {Petersburg}
    author:
    - Bartha, Paul
    - Barker, John
    - Hájek, Alan
    date: 2014-03
    page-range: 629-660
    url:
      value: http://link.springer.com/10.1007/s11229-013-0379-9
      date: 2026-03-06
    serial-number:
      doi: 10.1007/s11229-013-0379-9
      issn: 0039-7857, 1573-0964
    parent:
      type: periodical
      title: Synthese
      issue: 4
      volume: 191
  beckstead_paradox_2024:
    type: article
    title: A paradox for tiny probabilities and enormous values
    author:
    - Beckstead, Nick
    - Thomas, Teruji
    date: 2024-06
    page-range: 431-455
    url:
      value: https://onlinelibrary.wiley.com/doi/10.1111/nous.12462
      date: 2026-03-06
    serial-number:
      doi: 10.1111/nous.12462
      issn: 0029-4624, 1468-0068
    abstract: Abstract We begin by showing that every theory of the value of uncertain prospects must have one of three unpalatable properties. Reckless theories recommend giving up a sure thing, no matter how good, for an arbitrarily tiny chance of enormous gain; timid theories permit passing up an arbitrarily large potential gain to prevent a tiny increase in risk; non‐transitive theories deny the principle that, if is better than and is better than , then must be better than . Having set up this trilemma, we study its horns. Non‐transitivity has been much discussed; we focus on drawing out the costs and benefits of recklessness and timidity when it comes to axiology, decision theory, and normative uncertainty.
    parent:
      type: periodical
      title: Noûs
      issue: 2
      volume: 58
  pettigrew_open_2019:
    type: book
    title: The {Open} {Handbook} of {Formal} {Epistemology}
    date: 2019
    editor:
    - Pettigrew, Richard
    - Weisberg, Jonathan
    publisher: PhilPapers Foundation
  buchak_risk_2009:
    type: manuscript
    title: Risk and {Rationality}
    author: Buchak, Lara
    date: 2009-07
  hajek_waging_2003:
    type: article
    title: Waging {War} on {Pascal}'s {Wager}
    author: Hájek, Alan
    date: 2003
    page-range: 27-56
    serial-number:
      doi: 10.1215/00318108-112-1-27
    parent:
      type: periodical
      title: Philosophical Review
      issue: 1
      volume: 112
")

#let post = (
  slug: "satan-apple",
  bib: bib-data,
  title: "Just Say No? (to Satan's Apple)",
  date: datetime(year: 2026, month: 3, day: 21),
  tags: ("philosophy", "decision theory"),
  summary: "Infinite decision theory is weird.",
  body: [
= Introduction
Suppose you are going about your day when suddenly Satan comes by to offer you a deal: /**(really a test?)**/ he has an apple of infinite slices, and you can choose with each slice -- including the first -- whether to take that slice or to end the bonanza. If you manage to take a _finite_ number of slices, then you get to go to heaven upon death.
However, if you end up taking _infinite_ slices you will go to hell.
/*(also isnt it already a kind of hell or at least purgatory to just be stuck eating apple slice after apple slice? maybe I need to add some caveats to this like no diminishing marginal utility?????? or maybe that sorts itself out when you're in a local state of no matter what $n$, $n+1 succ n$).*/
Your goals are twofold: get as many apple slices as you can, but not infinitely many since you prefer heaven to hell. This infinite decision problem is known as Satan's Apple.
What should you do?

It seems that only way to avoid going to hell when faced with Satan's Apple is to stop at an arbitrary point. The problem is, at arbitrary point it seems like one more apple slice can't hurt, but that pattern of thought leads to consuming infinitely many. I will explore the use of risk aversion to avoid the diachronic tragedy of this problem.
//This is a case of extreme risk aversion, or timidity as @beckstead_paradox_2024 puts it.

// TODO tighten the prose, feedback and word count will weigh in on this

= Dominance and Diachronic Tragedy

Satan's Apple seems paralysing since, from the perspective of utility maximisation, there is a simple dominance argument in favour of eating the next apple slice at each synchronous (instantaneous) decision point. //Two potential ways of viewing the problem
Suppose you've eaten $n$ slices so far, where $0 <= n << oo$. You then face the following choices:

+ Eat the $(n+1)^"th"$ apple slice
+ Reject the $(n+1)^"th"$ apple slice
// if $(n) != oo$, then $(n+1) != oo$
// $(n) != oo => (n+1) != oo$

An action is deemed to dominate another if it always provides _at least as much_ utility as the other in every possible state of the world.
If you always prefer going to heaven or going to hell, i.e the utility of heaven is always greater than hell, then going to heaven dominates going to hell, and we notate $("go to heaven") succ ("go to hell")$. // is this i.e appropriate here? could I clarify it further...

However, if we consider that for some finite natural number $n$, $(n) != oo => (n+1) != oo$, and that you always prefer to have more apple slices than you already have, it seems very compelling to say that
$("eat" n+1 "slices") succ ("eat" n "slices")$. So, for every possible $n$, it is always preferrable to take $(n+1)$ apple slices over merely $(n)$ since just one more apple slice does not push you over the brink to infinity. However, if you were to follow this line of dominance reasoning for every apple slice offered, it will undoubtedly lead to hell since you end up choosing every apple slice offerred!

//If we subscribe to unbounded utilities, perhaps more specifically unbounded value is that more specific? or even applicable?: we may suppose there is infinite positive utility in reaching heaven, infinite negative utility in reaching hell, and finite positive value in eating finite apple slices.
/*Accordingly, why not eat zero slices and guarantee heaven?
There is the simple dominance argument on the synchronic decision to eat or not to eat, where utility(heaven + $(n+1)$slices) $succ$ utility(heaven + $n$ slices). However, it falls apart if we put it into the diachronic perspective. We see that such a line of reasoning would inevitably lead to hell which is highly undesirable.*/
//since $-infinity prec +infinity$
// could I take risk aversion with respect to size of payoffs into this account, and use integrals and limits? Well, they do broach upon the use of infinitesimals.
// Write a paragraph extending or defending something,
// figure out who is on my side and who isn't.
// could I make the case that this is a case wherein preference for dominant options is a case of fanaticism? are all preferences for dominant options a case of fanaticism?
//Why not eat zero slices and guarantee heaven?
	//#cite(<bartha_satan_2014>, supplement: [sec. 3]) evaluates the dominance arguments relating to the synchronic decision to eat or not to eat, where utility(heaven + $(n+1)$slices) $succ$ utility(heaven + $n$ slices). However, it falls apart if we put it into the diachronic perspective. We see that such a line of reasoning would inevitably lead to hell which is highly undesirable./*since $-infinity prec +infinity$.*/

This pattern of behaviour has been dubbed by @hedden_options_2015 as _diachronic tragedy_. This is because a series of decisions that synchronically seem rational (such as taking $n+1$ slices) ends up leading to a course of action that diachronically (through time) seems undesirable, yet entirely predictable, hence the tragedy. The problem might lie in accounting for the contribution of individual actions towards the diachronic tragedy.
// might need some more clarity on what I mean by rationality and behaviour (distinguishing between synchronic behaviours and a plan of action)?
// TODO briefly lay out the decision theoretic distinction between acts and states so that I may refer to it willy nilly, and WHY IS IT RELEVANT TO DELIBERATIVE DYNAMICS
/*@hedden_options_2015 argues that a behaviour is not inherently irrational just because it leads to diachronic tragedy, yet this does not seem a desirable feature of any sort of guidance towards how to approach Satan's Apple. With this dominance argument, how can we ever justify stopping? The $(n+1)^"th"$ apple slice always seems more desirable than the $n$ slices one already has. However, */
If we notice that each choice to take an apple slice entails the possibility of taking all (i.e hell), whereas ending the deal will guarantee avoiding hell, there may be a way to counter the dominance argument.
/*s specific to this tragic attitude.as the question of infinities.*/


= Acts and Utilities
At the start of the problem, we can divide the possible _sequences_ of actions as being either
$
	A L L &equiv "Take all the slices,"
	//\ S_n &equiv "Take exactly" n "slices" \
/*$

Then, for individual, sequential decisions, the possible actions are
// why do I need this distinction? $S_n and S_n$ seem the exact same in the way I've framed it right?
$*/
	"or" S_n &equiv "Take" n "slices" "where" 0 <= n << ∞
$

We may then consider two possible ways of assigning utilities to these actions.

// somehow tie these together?= What about diminishing marginal utility
== Unbounded Utility
//$#text(fill: gray)[Citation Needed]$ #cite(<bartha_satan_2014>, supplement: [sec. 3])
Based on @hajek_waging_2003's invalidating Pascal's wager, assigning infinite positive utility to heaven, infinite negative utility to hell, and any other infinite utility assignment, is untenable. It would lead to an inability to decide between actions.
In the case of Satan's Apple, consider the following:

If we assign $U("heaven") = +oo$, $U("hell") = -oo$, and
the utility of taking the next $(n+1)^"th"$ apple slice $U(n+1)=1$,
//$U(S_(n+1) | S_1 ∧ S_2 ∧ ... ∧ S_(n)) = U(n) = 1$,
then the utility of $U(0) = U("heaven") = +oo$.
Yet, $U(A L L) = U("hell") + sum^∞_(i=0) U(i) = -∞ + ∞ = "undefined"$. It would be arbitrary to assign infinite utility to only one of heaven or hell, so that does not seem like a desirable route to arriving at a decision (say if only $U("hell") = -oo$ and $U("heaven") = 0$ utility instead).
Thus, it seems necessary that to arrive at any sort of decision that is rationally justified by expected utility maximisation, we must assume bounded utility.
//?risk aversion is insufficient in the case of infinities?

== Diminishing Marginal Utility

/*One might think diminishing marginal utility could aid the cause of stopping, but it does not.*/
In @bartha_satan_2014 the authors lay the utilities as follows:
 Taking $0$ apple slices and guaranteeing heaven is the status quo so $U(S_0) = 0$, and
 $U("hell") = -1000$. The actual number doesn't matter as long as $U("hell") < U("heaven")$.
 $U(S_n) = 10 - 5/n$ so that $limits(lim)_(n -> oo) (U(S_n)) = limits(lim)_(n -> oo) (10 - 5/n) = 10 - limits(lim)_(n -> oo) (5/n) = 10 - 0 = 10$.
 With these we get the utility of taking all to be $U(A L L) = " " 10 - 1000 = -990$.

This implements bounded utility through diminishing marginal utility, so each additional slice gives less additional utility than the previous slice. For example, $U(S_2) - U(S_1) = 10-5/2 - 10-5/1 = #((10-5/2) - (10-5/1))$ whereas $U(S_3)-U(S_2) = 0.8overline(3) < 2.5$ //#calc.round((10-5/3) - (10-5/2),digits: 2)$
The reason diminishing marginal utility alone doesn't give a rationale for stopping at any $n$ is that the marginal utility never goes below zero, so there is still always the dominance argument for taking an additional apple slice, thus succumbing to the problem of diachronic tragedy. //Also, unbounded utility will make it impossible to actually arrive at a decision.

= Deliberative dynamics
/*@bartha_satan_2014 evaluates many approaches for rational agents to successfully navigate the problem of  Satan's Apple.*/ /*Binding seems like an attractive strategy (choosing a stopping point beforehand and sticking to it) but I agree with the authors that it seems to fundamentally alter the decision problem.*/
The most successful approach to Satan's Apple presented by @bartha_satan_2014 is deliberative dynamics.
As /*@bartha_satan_2014*/ the authors describe it, deliberative dynamics involves making a decision using calculations of _future expected utilities_ as evidence about future choices, and revising credences / calculations until reaching an equilibrium where one can finally carry out their decision:
    + First assign credences (degrees of belief) $q_n$ to the occurrence of all possible sequences $S_n$. \ One possible way of assigning credences is based on cardinalities as follows:

      $ q_n = P(S_n | S_1 ∧ S_2 ∧ ... ∧ S_(n-1))  "if" n>1 "otherwise "q_1 = P(S_1) $

      //$#text(fill: gray)[I think putting the |S_n| makes it clearer that it's about cadinality, but is that correct?]$

      Since $S_n$ occurring depends on choosing to continue at each previous state $S_1, ..., S_(n-1)$

    + For each $n$, compute expected utilities for the two choices: //, where the simpler expected utility to calculate is that of not taking $n$ slices:

      $
        E U (not S_n) &= 10 - 5 / (n-1) "if" n>1 "otherwise" E U (not S_n) = 0 "if" n = 1
      $

      These expected utility calculations come from the traditional expected utility formula multiplying probabilities of outcomes with their utilities. We also say $T_k equiv "take exactly" k "slices"$, more precise than $S_n equiv "Take" n "slices"$.
      For $E U (S_n)$ the relevant probabilities are:

      $
  			P(T_n/S_n) = (1 - q_(n+1)),
        P(T_(n+1)/S_n) = q_(n+1) (1 - q_(n+2)), ...,
        P((A L L) / S_n) = product_(i=n+1)^oo q_i
        // I need to check whether this limit actually holds TODO
  		$

      $ E U (S_n) &= sum_(k>=n) P(T_k/S_n) dot U(T_k) + P((A L L)/S_n) dot U(A L L) $

      // this is finally starting to make some sense

      The status quo will have the following expected utility at the outset:

      $
        E U (S Q_n) = q_N times E U (S_n) + (1-q_n) times E U (not S_n)
      $

      // wait, so now the expected utility of the status quo is NOT the same as the expected utility of stopping?
      // might be a TODO to figure this one out

  + Revision of each credence $q_n$ is done as per the following revision rule $phi.alt$//, applied $forall n$ ?sequentially over and over? as part of the deliberation process
		  // what would the ordering of these sub-problems be? does it matter? I would think so...
	  	  $
	  			phi.alt (q_n) = q_n′  = q_n times ((E U (S_n))/(E U (S Q_n))) $

					Which is repeated by applying these updated credences to update expected utility calculations.

  + The agent stops deliberating after reaching an equilibrium (the status quo stops changing) so

      $
        phi.alt(q_n) = q_n′ = q_n forall n
      $

    //- extreme credences $(0,1)$ are unchanged

== Rational credences

The way deliberative dynamics works, the only initial credences that reach any equilibria are $0$ and $1$ #cite(<bartha_satan_2014>, supplement: "Appendix 2"),
since those are the only credences that remain unaltered by the updating rule, just like with Bayesian updating of credences. @bartha_satan_2014 also points out that these equilibria are _unstable_ since relatively small changes to degrees of belief that led to landing at an equilibrium credence $1$, could lead to an equilibrium credence of $0$, and vice versa. So, reaching equilibrium requires extreme credences, and raises the question of whether the problem of Satan's Apple necessitates extreme degrees of belief.

/*@bartha_satan_2014 elaborates on stability and why there are no stable equilibria /* FACT CHECK */
but the bottom line is that only extreme starting credences $0,1$ lead to any sort of equilibria whatsoever.
So, these*/

// - there is an assumption that computation would be of negligible time cost; problem??

//- extremes are unstable equilibria, there are no stable ones; so it seems extreme credences about taking / not taking apple slices are the only ones that lead to actual / actionable decisions under this system

One intuitively appealing constraint on rational credences is what @bartha_satan_2014 calls _practically consistent_. I would prefer not have a set of credences (like $q_n = 0 forall n >= 1$) that would lead me to perform directly contradictory actions i.e, taking every apple slice while believing I certainly won't.

It is also pragmatically undesirable since $q_n = 0 forall n >= 1$ will guarantee the lowest utility outcome of hell. On this basis, holding credence $q_n = 0$ for any $n$ seems undesirable as it would lead to contradictory action if one were to maximise expected utility, as is widely assumed to be required for rationality.

//Considering practical consistency, and the equilibria of deliberative dynamics, it seems like the only credence to hold would be $q_n = 1 forall n$. Then does deliberative dynamics shift the problem from deciding on what number of slices to decide to stop on, to one of what credences to hold? It does not immediately seem irrational to believe that if one were to take just one additional apple slice, they could still quit while they're ahead and guarantee heaven.

Thus, if deliberative dynamics provides a local expected utility maximising justification for a stopping point based on one's credences, then it can be used to reduce Satan's Apple down to a problem of holding rationally permissible credences. If an agent doesn't hold initial credences $" " q_n = 1 forall n$, are they unable to reach any equilibria, and thus unable to act out on any decision?
//Even if one doesn't have an initial $q_n = 1$, if they are sufficiently risk averse, then they may operate as though they are certain taking any $n$ will lead to taking all $n$ so $r(q_n) = 1$. This could guarantee reaching an equilibrium, perhaps even one that is stable through the risk function.

//- it provides a local justification for the stopping point, and seems to solve the issue of deciding on the correct equilibrium (since it would just be the one arrived at by the process)
// this almost seems vaccuous FIXME

= Risk aversion

@buchak_risk_2009 defines risk aversion to be a global sensitivity and aversion to a higher degree of variance between outcomes, and introduces risk-weighted-expected-utility as an improvement over traditional expected utility theory. Briefly, it allows for rational agents to have their own risk function $r$ which applies to their probabilities and maps them to a value still between $0$ and $1$. This risk function reflects how an agent might perceive the expected utility of an outcome differently if it is offered next to a riskier or surer bet, instead of in isolation.


For example, risk aversion allows for a rational agent to prefer a bet that surely pays out $\$50$ over one that has a $1/2$ chance of paying $\$0$ and a $1/2$ chance of paying $\$100$, even though the traditional expected utility of both is the same. Traditional expected utility theory dictates any preference between these two would be impermissible.

// $ E U ("Bet 1") = 1/1 times \$50 = E U ("Bet 2") = 1/2 times \$0 + 1/2 times \$100 = \$50 $

Any sufficiently risk averse agent /*(someone that _really_ prefers surer outcomes)*/ may have their risk function such that even extremely low probabilities are mapped to $1$ in their expected utility calculation. It is also assumed that their risk function would never be decreasing, so that an increase in the probability of an outcome never decreases their risk weighted credence in an outcome.
This would be especially useful for Satan's Apple, since each decision point involves choosing between a guarantee of heaven and a greater utility with a risk of hell.
/*we may quantify a risk in the prospect of taking an additional apple slice through an agent's risk function, as it is associated with the possibility of going to hell whereas ending the sequence guarantees heaven.*/

// definitely need some more elaboration on how it is distinct from EUT, hence providing greater insight about EUT itself
// prof said I am to assume _very little_ about prior knowledge of expected utility theory, so I will probably need to lay out how it plays into dominance arguments, etc.

Suppose an agent doesn't hold $q_n = 1 forall n$ at the start of Satan's Apple, so ordinary deliberative dynamics would not help them reach a decision. However, they are globally sensitive to the property of Satan's Apple that choosing $n+1$ slices over ending at $n$ slices carries a chance of ending up in hell whereas foregoing the increase in utility will result in heaven for sure.
This could be represented by a risk function that maps their credences such that they reach a deliberative dynamical equilibrium and can justify foregoing the $(n+1)^"th"$ slice.

//This would end up being to refuse the first apple slice, which successfully avoids the diachronic tragedy involved in Satan's Apple since their risk-weighted credences would indicate that were they to take up the first slice, they would end up taking infinite slices and end up in hell.

//= Risk aversion in deliberative dynamics

An extreme risk function that assigns every non-zero credence $r(q) = 1$ so only $r(0) = 0$ would be convenient for this purpose. However, @buchak_risk_2009 suggests that $r$ must be a continuous function. If that is the case, it makes the task more difficult. A continuous function that assigns every credence $0 <= q <= 1$ a risk-weighted credence of $1$ seems undesirable, since a credence of $0$ gives certainty that something will not occur so mapping it to assume occurrence would be contradictory. /*whereas a sufficiently risk-averse individual might still be rational in treating an infinitesimal $0.overline(0...)1$ credence as $1$. This could be if the extremely unlikely negative outcome is sufficiently undesirable to them, especially in light of other more certain outcomes.*/
However, if a risk function is continuous, and does not map every possible credence onto $1$, then we still face the same issue of inability to reach equilibria.

// related to Alais paradox?

//Wait, now I'm kinda questioning why wouldn't deliberative dynamics just take care of this itself? Is the risk function just making it really likely that they reject from the outset, which might not be guaranteed with traditional expected utility based deliberative dynamics????

//What I'm gravitating towards arguing is that, with r-w-d-d and extreme risk aversion given the risky nature of the diachronic tragedy (extreme variance between outcomes? preference for a surer outcome;

What we are looking for through the risk function is a means of quantifying that despite one's credences and expected utility, their risk averse preference is towards a guaranteed outcome. It seems like a discontinous risk function is the most convenient means of arriving at this.

// It might even work for the traditional Satan's Apple problem where you have the choice to reject slice $n$ and still continue.
//$#text(fill: gray)[TODO, exemplify equilibria and how risk functions help reach and stabilise them]$

= Timidity

@beckstead_paradox_2024 argues that what I propose is a _timid_ approach to this infinite decision problem. They point out many problems with timidity, such as that of extreme sensitivity to minor increases in risk irrespective of possible utility gained, and a #quote()[[s]trange dependence on distant space and time] #cite(<beckstead_paradox_2024>, supplement: [sec. 3.2.]). There does not seem to be a reasonable means of avoiding diachronic tragedy while also avoiding the above issues.

In the case of Satan's Apple, the structure of the infinite decision problem exploits traditional utility maximisation to induce diachronic tragedy. Thus, if one wishes to avoid diachronic tragedy, it seems that they must accept the features of timidity as the only means of justifying stopping.

//Their objection of leaving stuff on the table /* precisify */ is problematic since it just leads back into the dominance argument which succumbs to hell and is tragic.
// TODO re-work this sentence after getting at least 4.5 hours of sleep, what am I even trying to say bruh
//The timid approach here is the only one that will avoid succumbing to diachronic tragedy while still maximising expected utility for the decision maker, as laid out by deliberative dynamics.

//Deliberative dynamics also makes an implicit assumption of bounded utility, and @beckstead_paradox_2024 seems opposed to this constraint, but I don't see any way around it. Furthermore, the assumption of bounded utility must be manifested through diminishing marginal utility.
//Also, @bartha_satan_2014 doesn't make ANY mention of (diminishing) maginal utility... The risk function is indeed a way of characterising diminishing marginal utility right?.

//= Other considerations
= Time

As an aside,
//I kinda want to steelman the independent desirability (outside of its implication of hell) of the infinite consumption of apple slices by using @bartha_satan_2014's example of trivially equating it to a supertask, thus using a finite amount of _time_...
@bartha_satan_2014 makes an assumption of computation time being a negligible factor in the deliberative dynamics involved to arrive at a decision. However, it also assumes that the infinite decision problem of Satan's Apple is posed as a supertask (a way of executing infinite tasks in a finite amount of time). This distinction is important, since it relates to the expected utilities of the status quo. If Satan's Apple is presented as a truly infinite problem, then one could just continue to eat apple slices forever since there is always utility to be gained.

The only way to realise the consequences is through the supertask, hence a desire to avoid hell. Similarly, deliberative dynamics also might end up taking infinite time, except that the deliberation process itself doesn't confer any concrete utility. However, if we are performing it, then it too could be assumed to done in a supertask; it does not seem that far-fetched to perform a supertask within a supertask. Otherwise, being stuck in the deliberation process itself seems to be an outcome to be avoided.

//if time isn't negligible, then either keep eating, or stop now to avoid another kind of hell altogether.

= Conclusion

The problem of Satan's Apple is inherently difficult for a rational agent. Traditional expected utility maximisation condemns them to the lowest utility outcome if they synchronically choose to maximise utility. Accounting for risk aversion in deliberative dynamics enables agents with a wider range of initial credences to avoid diachronic tragedy with a rational justification. However, this requires adherence to extreme risk aversion. These costs seem to be an unavoidable characteristic of the infinite decision problem, so if one wishes to beat Satan's Apple they face the potential losses of extreme risk aversion when it is applied elsewhere.
])

//#colbreak()

//#colbreak()
//#total.words words// excluding citations, equations, headers
//,exclude: (quote,cite,ref,strike,heading.where(level: 1),title))
//#bibliography("citations.bib", style: "chicago-author-date", full: true)
