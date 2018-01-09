## git2r, R bindings to the libgit2 library.
## Copyright (C) 2013-2018 The git2r contributors
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License, version 2,
## as published by the Free Software Foundation.
##
## git2r is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

##' Get the configured remotes for a repo
##'
##' @template repo-param
##' @return Character vector with remotes
##' @export
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
remotes <- function(repo = NULL) {
    .Call(git2r_remote_list, lookup_repository(repo))
}

##' Add a remote to a repo
##'
##' @template repo-param
##' @param name Short name of the remote repository
##' @param url URL of the remote repository
##' @return NULL, invisibly
##' @export
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
remote_add <- function(repo = NULL, name = NULL, url = NULL) {
    invisible(.Call(git2r_remote_add, lookup_repository(repo), name, url))
}

##' Rename a remote
##'
##' @template repo-param
##' @param oldname Old name of the remote
##' @param newname New name of the remote
##' @return NULL, invisibly
##' @export
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
remote_rename <- function(repo = NULL, oldname = NULL, newname = NULL) {
    invisible(.Call(git2r_remote_rename, lookup_repository(repo), oldname, newname))
}

##' Remove a remote
##'
##' All remote-tracking branches and configuration settings for the
##' remote will be removed.
##' @template repo-param
##' @param name The name of the remote to remove
##' @return NULL, invisibly
##' @export
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
remote_remove <- function(repo = NULL, name = NULL) {
    invisible(.Call(git2r_remote_remove, lookup_repository(repo), name))
}

##' Set the remote's url in the configuration
##'
##' This assumes the common case of a single-url remote and will
##' otherwise raise an error.
##' @template repo-param
##' @param name The name of the remote
##' @param url The \code{url} to set
##' @return NULL, invisibly
##' @export
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Set remote url
##' remote_set_url(repo, "foobar", "https://example.org/git2r/foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
remote_set_url <- function(repo = NULL, name = NULL, url = NULL) {
    invisible(.Call(git2r_remote_set_url, lookup_repository(repo), name, url))
}

##' Get the remote url for remotes in a repo
##'
##' @rdname remote_url-methods
##' @docType methods
##' @param repo The repository to get remote urls from
##' @param remote Character vector with the remotes to get the url
##' from. Default is the remotes of the repository.
##' @return Character vector with remote_url for each of the remote
##' @keywords methods
##' @examples
##' \dontrun{
##' ## Initialize a temporary repository
##' path <- tempfile(pattern="git2r-")
##' dir.create(path)
##' repo <- init(path)
##'
##' ## Create a user and commit a file
##' config(repo, user.name="Alice", user.email="alice@@example.org")
##' writeLines("Hello world!", file.path(path, "example.txt"))
##' add(repo, "example.txt")
##' commit(repo, "First commit message")
##'
##' ## Add a remote
##' remote_add(repo, "playground", "https://example.org/git2r/playground")
##' remotes(repo)
##' remote_url(repo, "playground")
##'
##' ## Rename a remote
##' remote_rename(repo, "playground", "foobar")
##' remotes(repo)
##' remote_url(repo, "foobar")
##'
##' ## Remove a remote
##' remote_remove(repo, "foobar")
##' remotes(repo)
##' }
setGeneric("remote_url",
           signature = "repo",
           function(repo, remote = remotes(repo))
           standardGeneric("remote_url"))

##' @rdname remote_url-methods
##' @export
setMethod("remote_url",
          signature(repo = "git_repository"),
          function(repo, remote)
          {
              .Call(git2r_remote_url, repo, remote)
          }
)


##' List references in a remote repository
##'
##' Displays references available in a remote repository along with the
##' associated commit IDs.  Akin to the 'git ls-remote' command.
##' @rdname remote_ls-methods
##' @docType methods
##' @param name Character vector with the "remote" repository URL to query or
##' the name of the remote if a \code{repo} argument is given.
##' @param repo an optional repository object used if remotes are
##' specified by name.
##' @param credentials The credentials for remote repository
##' access. Default is NULL. To use and query an ssh-agent for the ssh
##' key credentials, let this parameter be NULL (the default).
##' @keywords methods
##' @return Character vector for each reference with the associated commit IDs.
##' @examples
##' \dontrun{
##' remote_ls("https://github.com/ropensci/git2r")
##' }
##' @export
setGeneric("remote_ls",
           signature = c("name"),
           function(name,
                    repo = NULL,
                    credentials = NULL)
           standardGeneric("remote_ls"))

##' @rdname remote_ls-methods
##' @export
setMethod("remote_ls",
          signature(name = "character"),
          function(name, repo, credentials)
          {
              ## FIXME: When updating to libgit 0.26 + 1, remove this
              ## and allow repo to be NULL, see 'git2r_remote_ls'.
              if (is.null(repo)) {
                  path <- tempdir()
                  repo <- git2r::init(path)
                  on.exit(unlink(file.path(path, ".git"), recursive = TRUE))
              }

              .Call(git2r_remote_ls, name, repo, credentials)
          }
)
