# 📁 Repository Structure

This repository presents our approach to fine-tuning / training models for automated code review, focusing on three specific tasks using **monolingual C# datasets**:

1. **Quality Estimation** – Predicting whether a code review is needed.
2. **Review Comment Generation** – Generating natural language comments related to code changes.
3. **Code Refinement** – Providing suggestions to improve or correct code.

It includes the code and configuration files used to fine-tune two large language models (LLMs), **CodeLlama** and **DeepSeek-R1-Distill** (via Unsloth), for the Review Comment Generation task, as well as **CodeReviewer** (a T5-based transformer model) for all three tasks.

This work supports a comparative study involving multiple models, training configurations, and evaluation strategies.

> ⚠️ **Important:** This repository does **not** contain fine-tuned model weights or the proprietary training datasets due to confidentiality constraints.  
> However, part of the dataset (used in several benchmark studies) is publicly available. It can be retrieved from the following referenced paper and filtered to extract only the relevant C# JSON objects: [Automating Code Review Activities by Large-Scale Pre-training](https://arxiv.org/abs/2203.09095)

---

## 📘 Project Overview

In this study, the following models were fine-tuned:

- **CodeReviewer (T5-based)** on:
  - Code Change Quality Estimation (binary classification)
  - Review Comment Generation
  - Code Refinement

- **CodeLlama-7B** and **DeepSeek-R1-Distill-8B** (based on LLaMA 3.1) on:
  - Review Comment Generation

All models were trained using a unified C# dataset composed of public benchmark data and industrial data (the latter is not shared).

### 📊 Evaluation Metrics

The models were evaluated using:

- **Automated metrics:** BLEU-4, Exact Match, F1, Accuracy, Precision, Recall  
- **Human evaluation:** Relevance and Informativeness  
- **Baselines:** SonarQube and professional human reviewers

---

## 💻 Requirements

To replicate the fine-tuning process, the following dependencies are required:

- Python 3.12
- PyTorch ≥ 2.0 / CUDA ≥ 11.8
- [Transformers](https://github.com/huggingface/transformers) v4.48
- Additional tools:
  - [Axolotl](https://github.com/OpenAccess-AI-Collective/axolotl) (for CodeLlama)
  - [Unsloth](https://github.com/unslothai/unsloth) (for DeepSeek)
- Other packages:
  - `scikit-learn`
  - `sacrebleu`
  - `googletrans` (optional, for translation support)

> ⚠️ **Note:** Fine-tuning LLMs such as CodeLlama or DeepSeek requires a high-memory GPU (e.g., A100 80GB or ≥30GB VRAM depending on dataset size and hyperparameters).

---

## 📦 Repository Contents

This repository includes:

- Scripts for dataset preparation, formatting, and filtering (based on JSONL format / Alpaca format; only schema/examples are included)
- Configuration files for training different models
- Scripts for training and evaluation

> ⚠️ Fine-tuned model weights and proprietary training data are **not included**.

---

## 📄 Citation

This repository accompanies a research paper currently under review.  
A preprint will be made available on **arXiv** soon. Citation details will be added once the paper is published.

---

If you have questions or would like to reproduce any of the experiments, please refer to the provided scripts and configuration files, or feel free to open an issue in this repository.
