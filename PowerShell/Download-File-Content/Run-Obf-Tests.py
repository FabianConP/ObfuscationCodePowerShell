import sys
sys.path.append('../')
from Utility import *
import time


def test_file(path, params):
    file_name = get_file_name(path)
    file_name_report = "{0:30}".format(file_name)

    command = prepare_command(path, [params[0]])

    cmd = os.popen(command)

    time.sleep(0.5)

    cmd_lines = cmd.readlines()
    cmd_lines = "".join([line for line in cmd_lines if '\n' != line])

    result = True
    result_msg = ''

    if cmd_lines.find("public class Java") == -1:
        # Test file content
        result = False
        result_msg = "File content was not downloaded correctly"
    elif cmd_lines.find("ScriptContainedMaliciousContent") != -1:
        result = False
        result_msg = "Script detected as malicious"

    result_str = "{0:15}".format("Passed!" if result else "Detected") + " " + result_msg

    print(file_name_report + result_str)

    return (file_name, result)


if __name__ == '__main__':

    # Get list of files
    DIR_GEN_OBF = ".\gen-obf\\"
    path_files = get_list_files(DIR_GEN_OBF)

    # Define params
    params = ['https://raw.githubusercontent.com/leachim6/hello-world/master/j/Java.java']

    # Execute and get results
    results = test_files(path_files, params, test_file)
