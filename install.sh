source config
REPO_BASE = "$PARENT_DIR./repos/"
SITE_BASE = "$PARENT_DIR./sites/"

if [ ! -d "$REPO_BASE" ]; then
    # Control will enter here if $REPO_BASE directory doesn't exist.
    echo   "Creating base directory for repositories..."
    mkdir  "$REPO_BASE"
    echo   "Completed"
fi


if [ ! -d "$SITE_BASE" ]; then
    # Control will enter here if $SITE_BASE doesn't exist.
    echo   "Creating base directory for sites..."
    mkdir  "$SITE_BASE"
    echo   "Completed"
fi
