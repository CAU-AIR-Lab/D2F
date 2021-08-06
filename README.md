# Mutual Information-based Multi-label Feature Selection using Interaction Information

## Abstract

Multi-label feature selection is regarded as one of the most promising techniques that can be used to maximize the efficacy and efficiency of multi-label classification. However, because multi-label feature selection algorithms must consider multiple labels concurrently, the task is more difficult than singlelabel feature selection tasks. In this paper, we propose the Mutual Information-based multi-label feature selection method using interaction information. This method is naturally able to measure dependencies among multiple variables. To develop an efficient multi-label feature selection method, we derive theoretical bounds for the interaction information. Empirical studies indicate that our proposed multi-label feature selection method discovers effective feature subsets for multi-label classification problems.

This program is designed to perform the feature selection for multi-label data set. This method deals with standard multi-label data set, in which the number of given label is larger than one.

This software is a Matlab implementation of proposed method, highy specialized on problems of categorical data set classification. The original version of this program was written by Jaesung Lee.

### [Paper]
Jaesung Lee, and Dae-Won Kim, [“Mutual Information-based Multi-label Feature Selection using Interaction Information”](https://www.sciencedirect.com/science/article/pii/S0957417414006423),
Expert Systems with Applications, 42, 2015.

## License

This program is available for download for non-commercial use, licensed under the GNU General Public License, which is allows its use for research purposes or other free software projects but does not allow its incorporation into any type of commerical software.

## Sample Input and Output

It will return the index of input categorical features in orders of conditional dependency, named for user-specified variable. This code can executed under Matlab command window.

### [Usage]:
   `>> idx = d2f( features, labels, nums );`

### [Description]
   features – a matrix that is composed of features \
   labels – a matrix represents labels of each pattern is assigned to \
   nums – the number of features to be selected

By convention in the input features matrix, rows represent data (e.g. patterns) and columns represent features.
