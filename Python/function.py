def greet(name="world"):
    return "Hello, " + name

def buy(fruit="apple"):
    def buy_apple(num=1):
        return f"Bought {num} apple(s)"

    def buy_banana(num=1):
        return f"Bought {num} banana(s)"

    if fruit == "apple":
        return buy_apple
    else:
        return buy_banana


if __name__ == "__main__":
    print("[DEBUG] greet()       :", greet("no problem"))

    hi = greet
    print("[DEBUG] hi()          :", hi("quoted greet()"))

    del hi
    try:
        print(hi("3rd test"))
    except NameError as e:
        print(f"[ERROR] Deleted hi()  : <NameError: {e}>")

    print("[DEBUG] greet()       :", greet("greet() still exists\n"))

    buy_func_a = buy()
    buy_func_b = buy("b")
    print("[DEBUG] buy           :", buy)
    print("[DEBUG] buy_func_a    :", buy_func_a)
    print("[DEBUG] buy_func_b    :", buy_func_b)
    print("[DEBUG] buy_func_a(2) :", buy_func_a(2))
    print("[DEBUG] buy_func_b(3) :", buy_func_b(3))
    print("[DEBUG] buy('b')(4)   :", buy("b")(4))
