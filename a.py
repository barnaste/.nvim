# TODO:
# - python formatting and indentation is completely off on save
# - mypy isn't functional (unless I misunderstood its function)
# - figure out a way to run python scripts
# - debugger change which windows are where to better suit us


def factorial(num: int):
    fact = 1
    if num < 0:
        print("...")
    elif num == 0:
        print("...")
    else:
        for i in range(1, num + 1):
            print("...")
            fact = fact * i


class test:
    def hu_hu_he_ha(self):
        if True:
            print("..")


if __name__ == "__main__":
    print(factorial(num=4))
