import socket
import threading
import queue
import time

def scanPort(ip_address, port_number):
    """Attemtps to connect with the port of the specified number. Returns boolean
    True if succesful and False if not."""

    try:
        # Creating an internet socket with the TCP protocol,
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.connect((ip_address, port_number))
        sock.close()
        return True
    except:
        return False

def worker(ip_address):
    global PORT_QUEUE, PORT_LIST

    while not PORT_QUEUE.empty():
        port_number = PORT_QUEUE.get()

        if scanPort(ip_address, port_number) == True:
            PORT_LIST.append(port_number)
        else:
            pass

if __name__ == "__main__":
    # Print banner,

    BANNER = """
 ____            _     ____                                  
|  _ \ ___  _ __| |_  / ___|  ___ __ _ _ __  _ __   ___ _ __ 
| |_) / _ \| '__| __| \___ \ / __/ _` | '_ \| '_ \ / _ \ '__|
|  __/ (_) | |  | |_   ___) | (_| (_| | | | | | | |  __/ |   
|_|   \___/|_|   \__| |____/ \___\__,_|_| |_|_| |_|\___|_|   

"""

    print(BANNER)

    # Asking user for scanning mode,
    print("""ENTER '1': Scan all standardised ports from 1 through 1023.
ENTER '2': Scan ALL ports 1 through 65535.""")

    VALID_INPUT = False
    while VALID_INPUT == False:
        USER_MODE = input(">> ")

        if USER_MODE == "1":
            MAX_PORT_NUM = 1024
            VALID_INPUT = True
        elif USER_MODE == "2":
            MAX_PORT_NUM = 65536
            VALID_INPUT = True
        else:
            print("Invalid user input.")

    # Finding HOST IP address,
    HOST_NAME = socket.gethostname()
    IP_ADDRESS = socket.gethostbyname(HOST_NAME)

    # Creating queue,
    PORT_QUEUE = queue.Queue()

    for PORT_NUM in range(1, MAX_PORT_NUM):
        PORT_QUEUE.put(PORT_NUM)

    # Creating threads,
    THREAD_NUMBER = 500
    THREAD_LIST = []
    PORT_LIST = []
    for thread_number in range(THREAD_NUMBER):
        thread_obj = threading.Thread(target=worker, args = (IP_ADDRESS,), daemon = True)
        THREAD_LIST.append(thread_obj)

    # Starting threads,
    for thread_obj in THREAD_LIST:
        thread_obj.start()

    while not PORT_QUEUE.empty():
        time.sleep(1)

        # Progress bar
        bar_length = 50
        progress_int = int((MAX_PORT_NUM - PORT_QUEUE.qsize())/(MAX_PORT_NUM/bar_length))
        percentage = 100*(MAX_PORT_NUM - PORT_QUEUE.qsize())/MAX_PORT_NUM
        progress_bar = "█"*progress_int + "-"*(bar_length - progress_int) + " {:.1f} %".format(percentage)

        print("Remaining Ports: {}  {}".format(PORT_QUEUE.qsize(), progress_bar), end = '\r', flush = True)
    print(f"\n Open Ports {str(PORT_LIST)}")

    input("Press any key to exit...")
