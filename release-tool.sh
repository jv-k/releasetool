#!/bin/bash

# author: John Valai <hi@jvk.to>

# Dump git log history between previous tag and current
# @credits : Based on my jv-k/ver-bump
get_changelog () {
  local TAG_NEW \
        LAST_TAG_COMMIT \
        TAG_PREV \
        NOW \
        LOG_MSG \
        RANGE \
        COMMITS_MSG

  # Get current tag
  TAG_NEW=$( git describe --tags "$( git rev-list --tags --max-count=1 )" )
  # Get the last commit before current tag
  LAST_TAG_COMMIT=$( git rev-list --tags --skip=1 --max-count=1 )
  # Get last tag
  TAG_PREV=$( git describe --abbrev=0 --tags "$LAST_TAG_COMMIT" )
  # Today's date
  NOW="$( date +'%B %d, %Y' )"
  # Set range of commits between last tag and current tag
  # - If no previous tag, range will be blank, which will show all commits
  RANGE=$( [ "$( git tag -l "${TAG_PREV}" )" ] && echo "${TAG_PREV}...${TAG_NEW}" )
  COMMITS_MSG=$( git log --oneline --pretty=format:"- %h %s" "${RANGE}" 2>&1 )
  # shellcheck disable=SC2181
  if [ ! "$?" -eq 0 ]; then
    printf "❌ Error getting commit history since last tag for release notes.\n\n%s" "$LOG_MSG\n"
    exit 1
  fi
 
  # Add heading
  printf "## CHANGELOG %s (%s)\n\n" "$TAG_NEW" "$NOW"
  # Add previous commits
  echo "$COMMITS_MSG"
  echo ""
}

get_changelog