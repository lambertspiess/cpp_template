#ifndef TEST_HPP
# define TEST_HPP

class				Test
{
	public:
		Test();
		Test(const Test & original);
		friend void swap(Test & first, Test & second);
		Test & operator=(const Test & that);
		virtual ~Test();
	protected:
	private:
};

#endif //TEST_HPP
