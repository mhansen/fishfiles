function gz
	echo "orig bytes: "
cat "$argv" | wc -c
echo "gzipped bytes:"
cat "$argv" | gzip -c | wc -c
end
