import tkinter as tk
import pyautogui
import time
import random
from threading import Thread


def show_warning(message, title="Windows Warning"):
    root = tk.Tk()
    root.title(title)
    label = tk.Label(root, text=message, padx=20, pady=20)
    label.pack()
    button = tk.Button(root, text="OK", command=root.destroy, padx=10, pady=5)
    button.pack()
    root.mainloop()


def move_window():
    start_time = time.time()
    # Create the "You have been hacked" warning window
    hacked_window = tk.Tk()
    hacked_window.title("Windows Warning")
    hacked_label = tk.Label(hacked_window, text="You have been hacked!", padx=20, pady=20)
    hacked_label.pack()

    # Move the hacked window around
    while time.time() - start_time < 15:  # Run for 15 seconds
        x = random.randint(100, 800)
        y = random.randint(100, 600)
        hacked_window.geometry(f"+{x}+{y}")
        time.sleep(0.1)  # Move it quickly

    hacked_window.destroy()  # Close the hacked window


try:
    # Show the first warning
    show_warning("Hello there :)")

    # Open a new tab (simulated)
    pyautogui.hotkey('ctrl', 't')
    time.sleep(1)

    # Start moving the cursor and the "hacked" window around for 15 seconds
    move_thread = Thread(target=move_window)
    move_thread.start()

    start_time = time.time()
    while time.time() - start_time < 15:  # Run for 15 seconds
        x = random.randint(100, 800)
        y = random.randint(100, 600)
        pyautogui.moveTo(x, y, duration=0.1)
        time.sleep(0.1)

    move_thread.join()  # Wait for the movement to finish

    # Show final message
    show_warning("This was a test. Anyone else could have done malicious things. Thank you for trusting me.")

except KeyboardInterrupt:
    pass
finally:
    # Close the tab if still open
    pyautogui.hotkey('ctrl', 'w')
