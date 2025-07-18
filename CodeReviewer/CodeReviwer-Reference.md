# CodeReviewer - Customized Version

This project builds upon the official [CodeReviewer model by Microsoft](https://github.com/microsoft/CodeBERT/tree/master/CodeReviewer).

## Overview

We use the same underlying model architecture as described in the original repository, but with **customized training inputs** tailored to our specific use case and data structure.

## Modifications

- The model architecture remains unchanged.
- Training input format and preprocessing steps were **adjusted** to match our data and workflow.
- Certain utility functions from the original implementation required **minor updates or replacements** to stay compatible with the latest versions of dependent libraries.

## Notes

- If you're integrating code from the original repo, please ensure to **verify compatibility** with current versions of `transformers`, `datasets`, or other dependencies.
- Some functions may no longer work out-of-the-box and will require **minor modifications**.

---

Feel free to refer to the [original repository](https://github.com/microsoft/CodeBERT/tree/master/CodeReviewer) for further details on the model design and intended usage.
