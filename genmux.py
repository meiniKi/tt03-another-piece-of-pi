
def make_table() -> dict():
    # https://codegolf.stackexchange.com/questions/176371/densely-packed-decimal-dpd-to-decimal
    f = lambda a:[[a&6,a>>4&6,a>>7&6,8][b"  eW7B]Oys"[~a&8or~a&6or~6|a>>4]%x&3]|a>>x%9&1for x in[7,4,9]]
    #
    t = dict()
    for i in range(2**10):
        tripple = tuple(f(i))
        t[tripple] = "{0:010b}".format(i)
    return t

if __name__ == "__main__":
    
    ## SETUP ##
    NR_DIGITS = 1452
    ###########
    
    assert NR_DIGITS % 3 == 0, "Number of digits must be a multiple of 3"
    
    trans = make_table()
    with open ("pi.txt", "r") as f:
        pi_ref = f.read()
        
    # limit pi and remove decimal point
    pi = pi_ref.replace(".", "")[0:NR_DIGITS]

    index_data = []
    for i in range(0, len(pi), 3):
        index_data.append(trans[(int(pi[i]), int(pi[i+1]), int(pi[i+2]))])
     
    for i, ele in enumerate(index_data):   
        print(f"{i}: f = 10'b{ele};")
    print("default: f = 10'bXXXXXXXXXX;")
    
    # create test vector file
    with open ("testvec.txt", "w+") as f:
        f.write(pi_ref[0:NR_DIGITS+1])
        