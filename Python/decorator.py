from functools import wraps

def a_decorator(exec_func):
    @wraps(exec_func) # modified exec_func.__name__
    def warpper(*args, **kwargs):
        print(f"[DEBUG] @decorator   : do something BEFORE executing {exec_func}")
        exec_func(*args, **kwargs)
        print(f"[DEBUG] @decorator   : do something AFTER executing {exec_func}")
    return warpper

def foo(*args):
    res = ""
    if args:
        for i in args:
            res += f"{i} "
        res = res.strip()
    print(res)

@a_decorator
def bar(argv):
    print(argv)

if __name__ == "__main__":
    foo("[DEBUG]", "exec foo()   : without decorator")
    foo = a_decorator(foo)
    foo("[DEBUG]", "exec foo()   : with a decorator")
    print(f"[DEBUG] foo.__name__ : {foo.__name__}\n")

    bar("[DEBUG] exec bar()   : with a decorator")
    print(f"[DEBUG] bar.__name__ : {bar.__name__}")
