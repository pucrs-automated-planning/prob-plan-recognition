/*********************************************************************
 * Author: Malte Helmert (helmert@informatik.uni-freiburg.de)
 * (C) Copyright 2003-2004 Malte Helmert
 *
 * This file is part of LAMA.
 *
 * LAMA is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the license, or (at your option) any later version.
 *
 * LAMA is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 *********************************************************************/

#ifndef DOMAIN_TRANSITION_GRAPH_H
#define DOMAIN_TRANSITION_GRAPH_H

#include <iostream>
#include <map>
#include <vector>
using namespace std;

class CGHeuristic;
class State;
struct Operator;

struct ValueNode;
struct ValueTransition;
struct ValueTransitionLabel;
class DomainTransitionGraph;

// Note: We do not use references but pointers to refer to the "parents" of
// transitions and nodes. This is because these structures could not be
// put into vectors otherwise.

typedef multimap<int, ValueNode *> Heap;

struct PrevailCondition {
    DomainTransitionGraph *prev_dtg;
    int local_var, value;
    PrevailCondition(DomainTransitionGraph *prev, int var, int val)
        : prev_dtg(prev), local_var(var), value(val) {}
};

struct ValueTransitionLabel {
    Operator *op;
    vector<PrevailCondition> prevail;

    ValueTransitionLabel(Operator *theOp, const vector<PrevailCondition> &prev)
        : op(theOp), prevail(prev) {}
    void dump() const;
};

struct ValueTransition {
    ValueNode *target;
    vector<ValueTransitionLabel> labels;

    ValueTransition(ValueNode *targ)
        : target(targ) {}
    void simplify();
    void dump() const;
};

struct ValueNode {
    DomainTransitionGraph *parent_graph;
    int value;
    vector<ValueTransition> transitions;

    vector<int> distances;               // cg; empty vector if not yet requested
    vector<ValueTransitionLabel *> helpful_transitions;
    // cg; empty vector if not requested
    Heap::iterator pos_in_heap;          // cg
    vector<int> children_state;          // cg
    ValueNode *reached_from;             // cg
    //ValueNode *helpful_reached_from;     // cg
    ValueTransitionLabel *reached_by;    // cg
    //ValueTransitionLabel *helpful_reached_by; // cg

    ValueNode(DomainTransitionGraph *parent, int val)
        : parent_graph(parent), value(val), reached_from(0), reached_by(0) {}
    void dump() const;
};

class DomainTransitionGraph {
    friend class CGHeuristic;
    friend struct ValueNode;
    friend struct ValueTransition;
    friend class Transition;

    int var;
    bool is_axiom;
    vector<ValueNode> nodes;

    int last_helpful_transition_extraction_time; // cg heuristic; "dirty bit"

    vector<int> local_to_global_child;
    // used for mapping variables in conditions to their global index 
    // (only needed for initializing child_state for the start node?)

    DomainTransitionGraph(const DomainTransitionGraph &other); // copying forbidden
public:
    DomainTransitionGraph(int var_index, int node_count);
    void read_data(istream &in);

    void dump() const;

    void get_successors(int value, vector<int> &result) const;
    // Build vector of values v' such that there is a transition from value to v'.

    static void read_all(istream &in);
};

#endif
