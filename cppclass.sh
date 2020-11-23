#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "class name missing"
	exit
fi

NAME=$1
# Uppercase the first letter of the class
CLASSNAME="${NAME^}"
# Oppercase the entire name of the class
UPPERCASENAME=$(echo "$CLASSNAME" | tr '[:lower:]' '[:upper:]')
HEADER="$CLASSNAME.hpp"
DEFINITIONS="$CLASSNAME.cpp"

touch $HEADER
echo -en "#ifndef ${UPPERCASENAME}_HPP\n"								>> $HEADER
echo -en "# define ${UPPERCASENAME}_HPP\n"								>> $HEADER
echo -en "\n"															>> $HEADER
echo -en "class\t\t\t\t$CLASSNAME\n"									>> $HEADER
echo -en "{\n"															>> $HEADER
echo -en "\tpublic:\n"													>> $HEADER
echo -en "\t\t${CLASSNAME}();\n"										>> $HEADER
echo -en "\t\t${CLASSNAME}(const ${CLASSNAME} & original);\n"			>> $HEADER
echo -en "\t\tfriend void swap($CLASSNAME & first, $CLASSNAME & second);\n"	>> $HEADER
echo -en "\t\t$CLASSNAME & operator=(const $CLASSNAME & that);\n"		>> $HEADER 
echo -en "\t\tvirtual ~${CLASSNAME}();\n"								>> $HEADER
echo -en "\tprotected:\n"												>> $HEADER
echo -en "\tprivate:\n"													>> $HEADER
echo -en "};\n"															>> $HEADER
echo -en "\n"															>> $HEADER
echo -en "#endif //${UPPERCASENAME}_HPP\n"								>> $HEADER

touch $DEFINITIONS
echo -en "#include \"${CLASSNAME}.hpp\"\n"								>> $DEFINITIONS
echo -en "\n"															>> $DEFINITIONS
echo -en "${CLASSNAME}::${CLASSNAME}()\n"								>> $DEFINITIONS
echo -en "{\n"															>> $DEFINITIONS
echo -en "\t//ctor\n"													>> $DEFINITIONS
echo -en "}\n"															>> $DEFINITIONS
echo -en "\n"															>> $DEFINITIONS
echo -en "${CLASSNAME}::${CLASSNAME}(const ${CLASSNAME} & original)\n"	>> $DEFINITIONS
echo -en "{\n"															>> $DEFINITIONS
echo -en "\t//cctor\n"													>> $DEFINITIONS
echo -en "}\n"															>> $DEFINITIONS
echo -en "\n"															>> $DEFINITIONS
echo -en "${CLASSNAME}::~${CLASSNAME}()\n"								>> $DEFINITIONS
echo -en "{\n"															>> $DEFINITIONS
echo -en "\t//dtor\n"													>> $DEFINITIONS
echo -en "}\n"															>> $DEFINITIONS
echo -en "\n"															>> $DEFINITIONS
echo -en "friend void\t\tswap($CLASSNAME & first, $CLASSNAME & second)\n"	>> $DEFINITIONS
echo -en "{\n"															>> $DEFINITIONS
echo -en "\t//std::swap(first.member, second.member);\n"				>> $DEFINITIONS
echo -en "}\n"															>> $DEFINITIONS
echo -en "\n"															>> $DEFINITIONS
echo -en "${CLASSNAME} & ${CLASSNAME}::operator=(const ${CLASSNAME} & that)\n"	>> $DEFINITIONS
echo -en "{\n"															>> $DEFINITIONS
echo -en "\tswap(*this, that);\n"										>> $DEFINITIONS
echo -en "\treturn (*this);\n"											>> $DEFINITIONS
echo -en "}\n"															>> $DEFINITIONS
