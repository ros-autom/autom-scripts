echo "Refreshing manifest"
repo init -u git://github.com/ros-autom/manifest.git -b master
echo "Syncing projects"
repo sync --force-sync

echo "Upstream merging"
## Our snippet/manifest
ROOMSER=.repo/manifests/default.xml
# Lines to loop over
CHECK=$(cat ${ROOMSER} | grep -e "<remove-project" | cut -d= -f3 | sed 's/revision//1' | sed 's/\"//g' | sed 's|/>||g')

## Upstream merging for forked repos
while read -r line; do
    echo "Upstream merging for $line"
	rm -rf $line
	repo sync $line
	cd "$line"
	git branch -D kinetic
	git checkout -b kinetic
    UPSTREAM=$(sed -n '1p' UPSTREAM)
    BRANCH=$(sed -n '2p' UPSTREAM)

    git pull https://www.github.com/"$UPSTREAM" "$BRANCH"
    git push origin kinetic
    
done <<< "$CHECK"