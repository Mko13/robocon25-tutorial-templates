""" Custom library to be used as a Keyword.

In this tutorial, it is imported in the suite file
template_custom_library.robot
"""

def should_add_up_to_integer(a,b):
    """ Adds two numbers and returns error if sum is not integer """
    result = float(a) + float(b)
    if result % 1 != 0:
        raise ValueError("Result not integer:", result)
    print(f"Result: {result:.0f}")
    return result