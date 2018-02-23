import os
import importlib
from elifetools.utils import unicode_value

BASE_DIR = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))


def json_expected_folder(filename):
    return os.path.join(BASE_DIR, "tests", "JSON", filename.split(".")[0])


def json_expected_file(filename, function_name):
    if json_expected_folder(filename):
        return os.path.join(json_expected_folder(filename), function_name + ".json")


def sample_xml(filename):
    return os.path.join(BASE_DIR, "sample-xml", filename)

def fixture_folder(folder_name):
    return os.path.join(BASE_DIR, "tests", "fixtures", folder_name)

def fixture_module_name(folder_name, filename):
    return '.'.join(["tests", "fixtures", folder_name, filename.rstrip('.py')])

def fixture_file(folder_name, filename):
    return os.path.join(fixture_folder(folder_name), filename)

def read_fixture(folder_name, filename):
    full_filename = fixture_file(folder_name, filename)
    if full_filename.endswith('.py'):
        # import the fixture and return the value of expected
        module_name = fixture_module_name(folder_name, filename)
        mod = importlib.import_module(module_name)
        return mod.expected
    else:
        with open(full_filename, 'rb') as file_fp:
            return file_fp.read()

__all__ = [json_expected_file, json_expected_folder, sample_xml,
           fixture_folder, read_fixture]

