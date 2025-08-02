# 📘 AI for Ethical Hacking CLI
A Dockerized command-line toolkit that blends traditional security utilities with modern AI models to speed up reconnaissance, triage, and exploit discovery for ethical hacking.

## 🎯 Features and Use Cases
- **AI Reconnaissance** – Generate contextual subdomain wordlists and automate enumeration.
- **Intelligent Screenshot Analysis** – Classify web application screenshots using multimodal LLMs.
- **Smart Content Discovery** – Build fuzzing wordlists via NLP.
- **Automated Exploit Generation** – Produce nuclei templates from AI prompts.
- **Hackbot Integrations** – Use CAI agents for vulnerability discovery and custom workflows.

Typical workflows include:
- Capturing and triaging thousands of target screenshots.
- Crafting tailored wordlists for fuzzing and brute force attacks.
- Exploring automated vulnerability scans augmented with AI insights.

## ⚙️ Architecture Overview
```
            ┌────────────────┐
            │  CLI Scripts   │
            ├────────────────┤
            │llm_screenshot_ │
            │classifier.py    │
            │scrape.py        │
            │nlp.py           │
            └─────┬──────────┘
                  │
      ┌───────────┴───────────┐
      │       Docker Env       │
      │ (Nuclei, FFUF, etc.)   │
      └───────────┬───────────┘
                  │
         External AI APIs
(OpenAI, Gemini, ProjectDiscovery)
```
- Python scripts invoke AI APIs and local tools.
- Docker image bundles security utilities and dependencies.
- Environment variables provide API keys and configuration.

## 🚀 Installation and Setup Instructions
1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/ai4eh-cli.git
   cd ai4eh-cli
   ```
2. **Build the Docker image**
   ```bash
   chmod +x build_image.sh
   ./build_image.sh
   ```
3. **Prepare environment variables**
   ```bash
   cp env_file.example env_file
   # edit env_file with API keys
   ```
4. **Run the container**
   ```bash
   chmod +x run_image.sh
   ./run_image.sh
   ```

## 🛠️ Usage Examples with CLI Commands
- **Screenshot Classification**
  ```bash
  python workspace/llm_screenshot_classifier.py --input screenshots/
  ```
- **NLP Keyword Extraction**
  ```bash
  python workspace/nlp.py path/to/file.txt > keywords.txt
  ```
- **Web Scraping**
  ```bash
  python workspace/scrape.py https://example.com
  ```
- **Custom XSS Agent (requires Notify)**
  ```bash
  python workspace/cai_custom_xss_tool_with_notify.py
  ```

## 🧪 Testing Instructions
1. **Lint and Static Checks**
   ```bash
   flake8 workspace/
   ```
2. **Unit Tests**
   ```bash
   pytest
   ```
3. **Manual Verification**
   - Run each script with sample data.
   - Confirm Docker container launches correctly.

## 🌐 Contributions, Issues, and Roadmap
- **Contribute** – Fork the repo, open pull requests, or submit feature ideas.
- **Issues** – Use GitHub issues for bugs or enhancement requests.
- **Roadmap**
  - Expanded exploit templates via AI
  - Additional multimodal classification models
  - Enhanced CLI UX for tool orchestration

## 📄 License
Educational use only. Always respect responsible disclosure and authorized testing practices.
