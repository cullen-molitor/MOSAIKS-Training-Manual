set.seed(1014)

knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    # cache = TRUE,
    fig.retina = 2,
    fig.width = 6,
    fig.asp = 2 / 3,
    fig.show = "hold"
)

options(
    dplyr.print_min = 6,
    dplyr.print_max = 6,
    pillar.max_footer_lines = 2,
    pillar.min_chars = 15,
    stringr.view_n = 6,
    # Temporarily deactivate cli output for quarto
    cli.num_colors = 0,
    cli.hyperlink = FALSE,
    pillar.bold = TRUE,
    width = 77 # 80 - 3 for #> comment
)

ggplot2::theme_set(ggplot2::theme_gray(12))

# use results: "asis" when setting a status for a chapter
# Status function for chapter completion states
status <- function(type) {
    status <- switch(type,
        draft = "is in early draft form and may be incomplete",
        review = "is under review and may need revisions",
        testing = "needs testing with real users",
        complete = "is complete and ready for use",
        stop(
            "Invalid `type`, use `draft`, `review`, `testing`, or `complete`",
            call. = FALSE
        )
    )

    class <- switch(type,
        draft = "warning",
        review = "note",
        testing = "important",
        complete = "tip"
    )

    cat(
        paste0(
            "\n",
            ":::: status\n",
            "::: callout-", class, " \n",
            "This chapter ", status, ".\n",
            ":::\n",
            "::::\n"
        )
    )
}
