/*
 *  git2r, R bindings to the libgit2 library.
 *  Copyright (C) 2013-2015 The git2r contributors
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License, version 2,
 *  as published by the Free Software Foundation.
 *
 *  git2r is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include <Rinternals.h>
#include "git2.h"

/**
 * Error messages
 */

const char git2r_err_alloc_memory_buffer[] = "Unable to allocate memory buffer";
const char git2r_err_branch_not_local[] = "Error in '%s': 'branch' is not local";
const char git2r_err_branch_not_remote[] = "Error in '%s': 'branch' is not remote";
const char git2r_err_checkout_tree[] = "Expected commit, tag or tree";
const char git2r_err_from_libgit2[] = "Error in '%s': %s\n";
const char git2r_err_invalid_refname[] = "Error in '%s': Invalid reference name";
const char git2r_err_invalid_remote[] = "Error in '%s': Invalid remote name";
const char git2r_err_invalid_repository[] = "Invalid repository";
const char git2r_err_nothing_added_to_commit[] = "Nothing added to commit";
const char git2r_err_object_type[] = "Error in '%s': Unexpected object type.";
const char git2r_err_reference[] = "Error in '%s': Unexpected reference type";
const char git2r_err_repo_init[] = "Error in '%s': Unable to init repository";
const char git2r_err_revparse_single[] = "Expected commit, tag or tree";
const char git2r_err_unexpected_config_level[] = "Unexpected config level";
const char git2r_err_unable_to_authenticate[] = "Unable to authenticate with supplied credentials";

/**
 * Error messages specific to argument checking
 */
const char git2r_err_blob_arg[] =
    "must be a S4 class git_blob";
const char git2r_err_branch_arg[] =
    "must be a S4 class git_branch";
const char git2r_err_commit_arg[] =
    "must be a S4 class git_commit";
const char git2r_err_credentials_arg[] =
    "must be a S4 class with credentials";
const char git2r_err_diff_arg[] =
    "Invalid diff parameters";
const char git2r_err_fetch_heads_arg[] =
    "must be a list of S4 git_fetch_head objects";
const char git2r_err_filename_arg[] =
    "must be either 1) NULL, or 2) a character vector of length 0 or 3) a character vector of length 1 and nchar > 0";
const char git2r_err_sha_arg[] =
    "must be a sha value";
const char git2r_err_integer_arg[] =
    "must be an integer vector of length one with non NA value";
const char git2r_err_integer_gte_zero_arg[] =
    "must be an integer vector of length one with value greater than or equal to zero";
const char git2r_err_list_arg[] =
    "must be a list";
const char git2r_err_logical_arg[] =
    "must be logical vector of length one with non NA value";
const char git2r_err_note_arg[] =
    "must be a S4 class git_note";
const char git2r_err_signature_arg[] =
    "must be a S4 class git_signature";
const char git2r_err_string_arg[] =
    "must be a character vector of length one with non NA value";
const char git2r_err_string_vec_arg[] =
    "must be a character vector";
const char git2r_err_tag_arg[] =
    "must be a S4 class git_tag";
const char git2r_err_tree_arg[] =
    "must be a S4 class git_tree";

/**
 * Raise error
 *
 * @param func_name The name of the function that raise the error.
 * @param err Optional error argument from libgit2 with the git_error
 * object that was last generated.
 * @param msg1 Optional text argument with error message, used if
 * 'err' is NULL.
 * @param msg2 Optional text argument, e.g. used during argument
 * checking to pass the error message to the variable name in 'msg1'.
 */
void git2r_error(
    const char *func_name,
    const git_error *err,
    const char *msg1,
    const char *msg2)
{
    if (func_name && err && err->message)
        Rf_error("Error in '%s': %s\n", func_name, err->message);
    else if (func_name && msg1 && msg2)
        Rf_error("Error in '%s': %s %s\n", func_name, msg1, msg2);
    else if (func_name && msg1)
        Rf_error("Error in '%s': %s\n", func_name, msg1);
    else if (func_name)
        Rf_error("Error in '%s'\n", func_name);
    else
        Rf_error("Unexpected error. Please report at"
                 " https://github.com/ropensci/git2r/issues\n");
}
