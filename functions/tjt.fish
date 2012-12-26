function tjt
	set javadir (pwd | sed 's/\bjavatests\b/java/')
if test (pwd) = $javadir
cd (pwd | sed 's/\bjava\b/javatests/')
else
cd $javadir
end

end
