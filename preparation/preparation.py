import argparse
import random
def main() -> None:
    """
    Module to get some args. as input and say whether the code can be release to production
    """

    parser = argparse.ArgumentParser()


    #Mandatory or unique input variable
    # group = parser.add_mutually_exclusive_group(required=True)
    parser.add_argument("-word", "-w", type=str, help="Name to count the letters from")
    parser.add_argument("-n1", type=int, help="First number to multiply from")
    
    args = parser.parse_args()

    name_len = len(args.word)

    for i in range(name_len):
        print(i*args.n1-random.randrange(name_len))

    print("++++Process has finished++++++")


if __name__=="__main__":
    main()