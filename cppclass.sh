#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "class name missing"
	exit
fi

# Uppercase the first letter of the class
CLASSNAME="${NAME^}"
# Oppercase the entire name of the class
UPPERCASENAME=$(echo "$CLASSNAME" | tr '[:lower:]' '[:upper:]')
HEADER="$CLASSNAME.hpp"
DEFINITIONS="$CLASSNAME.cpp"

touch $HEADER
echo -en "#ifndef ${UPPERCASENAME}_HPP\n"				>> $HEADER
echo -en "# define ${UPPERCASENAME}_HPP\n"				>> $HEADER
echo -en "\n"											>> $HEADER
echo -en "class\t\t\t\t$CLASSNAME\n"					>> $HEADER
echo -en "{\n"											>> $HEADER
echo -en "\tpublic:\n"									>> $HEADER
echo -en "\t\t${CLASSNAME}();\n"						>> $HEADER
echo -en "\t\tvirtual ~${CLASSNAME}();\n"				>> $HEADER
echo -en "\tprotected:\n"								>> $HEADER
echo -en "\tprivate:\n"									>> $HEADER
echo -en "};\n"											>> $HEADER
echo -en "\n"											>> $HEADER
echo -en "#endif //${UPPERCASENAME}_HPP\n"				>> $HEADER

touch $DEFINITIONS
echo -en "#include \"${CLASSNAME}.hpp\"\n"				>> $DEFINITIONS
echo -en "\n"											>> $DEFINITIONS
echo -en "${CLASSNAME}::${CLASSNAME}()\n"				>> $DEFINITIONS
echo -en "{\n"											>> $DEFINITIONS
echo -en "\t//ctor\n"									>> $DEFINITIONS
echo -en "}\n"											>> $DEFINITIONS
echo -en "\n"											>> $DEFINITIONS
echo -en "${CLASSNAME}::~${CLASSNAME}()\n"				>> $DEFINITIONS
echo -en "{\n"											>> $DEFINITIONS
echo -en "\t//dtor\n"									>> $DEFINITIONS
echo -en "}\n"											>> $DEFINITIONS
