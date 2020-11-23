#include "Test.hpp"

Test::Test()
{
	//ctor
}

Test::Test(const Test & original)
{
	//cctor
}

Test::~Test()
{
	//dtor
}

friend void		swap(Test & first, Test & second)
{
	//std::swap(first.member, second.member);
}

Test & Test::operator=(const Test & that)
{
	swap(*this, that);
	return (*this);
}
