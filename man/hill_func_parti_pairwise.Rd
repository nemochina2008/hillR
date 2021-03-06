% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hill_func_parti_pairwise.R
\name{hill_func_parti_pairwise}
\alias{hill_func_parti_pairwise}
\title{Pairwise comparisons for all sites.}
\usage{
hill_func_parti_pairwise(comm, traits, traits_as_is = FALSE, q = 0,
  rel_then_pool = TRUE, output = c("data.frame", "matrix"),
  pairs = c("unique", "full"), ...)
}
\arguments{
\item{comm}{A data frame of vegtation data. Sites as rows, species as columns.}

\item{traits}{A data frame of species functional traits data. Species as rows, traits as columns.
It can include both continuous and categorical data. It will be transformed into a distance
matrix using `FD::gowdis(traits)`. If all traits are numeric, then it will use Euclidean distance.}

\item{traits_as_is}{if \code{FALSE} (default) traits data frame will be transformed into a distance
matrix. Otherwise, will use as is (i.e. traits is a symmetric distance matrix).}

\item{q}{Hill number, \code{q} = 0 (default) to get species richness,
\code{q} = 1 to get shannon entropy, \code{q} = 2 will give inverse Simpson.}

\item{rel_then_pool}{default is \code{TRUE.} Abundance of species are first changed to relative abundance within sites,
then pooled into one assemblage. If \code{FALSE}, sites are pooled first, then change abundance of species
to relative abundance.}

\item{output}{output type: data.frame (default) or matrix. If matrix, then this function will return a list of matrices.}

\item{pairs}{full or unique (default). Do you want to compare all possible pairs (i.e. n^2) or just unique pairs (i.e. \code{choose(n, 2))}?}

\item{...}{additional arguments for \code{hill_func_parti}.}
}
\value{
a data frame with results for all pairwise comparisons.
}
\description{
Calculate pairwise functional gamma, alpha, and beta diversity for communities, as
 well as site similarity. It is based on \code{\link{hill_func_parti}}.
 If comm has >2 sites, this function will give results for all pairwise comparisons.
}
\examples{
\dontrun{
dummy = FD::dummy
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 0)
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 0,
                         output = 'matrix')
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 0,
                         output = 'matrix', pairs = 'full')
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 1)
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 0.9999)
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 2)
hill_func_parti_pairwise(comm = dummy$abun, traits = dummy$trait, q = 3)
}
}
\references{
Chao, Anne, Chun-Huo Chiu, and Lou Jost. Unifying Species Diversity, Phylogenetic Diversity, Functional Diversity, and Related Similarity and Differentiation Measures Through Hill Numbers. Annual Review of Ecology, Evolution, and Systematics 45, no. 1 (2014): 297–324. <doi:10.1146/annurev-ecolsys-120213-091540>.

Chiu, Chun-Huo, and Anne Chao. Distance-Based Functional Diversity Measures and Their Decomposition: A Framework Based on Hill Numbers. PLoS ONE 9, no. 7 (July 7, 2014): e100014. <doi:10.1371/journal.pone.0100014>.
}
\seealso{
\code{\link{hill_func_parti}}
}
