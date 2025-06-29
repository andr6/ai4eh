<a name="readme-top"></a>
<div align="center">

<h1>
  <br>
    <img src="assets/logo.webp" alt="logo" width="400">
    <br><br>
    AI for Ethical Hacking
    <br><br>
</h1>
</div>

This repository contains the [workshop guide](ai-for-ethical-hacking.pdf), educational tools and scripts for learning how AI can be applied in offensive security.

## 🎯 Overview

The AI4EH workshop demonstrates some practical applications of AI in security, including:

- **AI Reconnaissance** - Generate contextual subdomain wordlists and automate target enumeration
- **Intelligent Screenshot Analysis** - Use neural networks and multimodal LLMs to classify web apps
- **Smart Content Discovery** - Create custom fuzzing wordlists based on application context
- **Automated Exploit Generation** - Explore nuclei AI template generation
- **Hackbots** - Play with CAI agents for vulnerability discovery
- **MCP Integrations** - Connect AI assistants to security tools like Burp Suite, Ghidra and more

## 🚀 Quick Start

### Using Docker (Recommended)

1. **Build the container:**
   ```bash
   chmod +x build_image.sh
   ./build_image.sh
   ```

2. **Run the environment:**
   ```bash
   chmod +x run_image.sh
   ./run_image.sh
   ```

Or simply use the pre-built image:

```bash
docker run --rm -it --env-file env_file ethiack/ai4eh:latest
```

## 🛠️ Tools & Components

### Core Scripts

- **`llm_screenshot_classifier.py`** - Multimodal AI for categorizing web application screenshots
- **`scrape.py`** - Web scraping with analysis
- **`nlp.py`** - NLP utility for keyword extraction and text analysis
- **`cai_custom_xss_tool_with_notify.py`** - AI agent example with a simple custom tool for notifications

### Included Security Tools

The Docker environment includes popular tools:

- [LLM](https://github.com/simonw/llm) - Access LLMs from the command-line
- [Nuclei](https://github.com/projectdiscovery/nuclei) - Fast, customizable vulnerability scanner
- [FFUF](https://github.com/ffuf/ffuf) - Fast web fuzzer
- [FFUFAI](https://github.com/jthack/ffufai) - AI-powered ffuf wrapper
- [Subfinder](https://github.com/projectdiscovery/subfinder) - Fast passive subdomain enumeration tool
- [HTTPx](https://github.com/projectdiscovery/httpx) - Multi-purpose HTTP toolkit
- [Notify](https://github.com/projectdiscovery/notify) - Assistance package for sending notifications
- [EyeBaller](https://github.com/BishopFox/eyeballer) - Convolutional neural network for analyzing pentest screenshots
- [PureDNS](https://github.com/d3mondev/puredns) - Fast domain resolver and subdomain bruteforcing tool

## 📋 Prerequisites

- Docker
- API keys for AI services (Google Gemini, OpenAI, etc.)
- Basic understanding of security concepts

## ⚙️ Configuration

Create an `env_file` with your API credentials. Copy the provided sample and edit it with your keys:
```bash
OPENAI_API_KEY=your_openai_key_here
GEMINI_API_KEY=your_gemini_key_here
LLM_GEMINI_KEY=your_gemini_key_here
PDCP_API_KEY=your_pdcp_key_here
...
```

Load the variables before running the tools:
```bash
export $(grep -v '^#' env_file | xargs)
```

## 🧑‍💻 Usage Examples

### Screenshot classification

Categorize a folder of screenshots using Google Gemini:

```bash
python workspace/llm_screenshot_classifier.py
```

### NLP keyword extraction

Generate a wordlist from text files:

```bash
python workspace/nlp.py path/to/file.txt > keywords.txt
```

### Web scraping

Extract company information from a URL:

```bash
python workspace/scrape.py https://example.com
```

### CAI agent example

Run a simple XSS helper agent (requires Notify to be configured):

```bash
python workspace/cai_custom_xss_tool_with_notify.py
```

## 🏗️ Example Workshop Flow

1. Enumerate targets with `subfinder` and resolve with `puredns`.
2. Probe discovered hosts using `httpx` and capture screenshots with `eyeballer`.
3. Run the screenshot classifier to triage interesting applications.
4. Scrape pages of interest and extract keywords to build custom wordlists.
5. Use nuclei, ffuf/ffufai and other tools to continue the assessment.

## 🎓 Educational Use Only

This content is designed for:
- ✅ Learning AI applications in offensive security
- ✅ Educational vulnerability research  
- ✅ Authorized penetration testing
- ✅ CTF experiments

## 🤝 Contributing

This is an educational project. Feel free to:
- Report issues or bugs
- Suggest improvements to existing tools
- Share educational use cases

## 📄 License

Educational use - always respect responsible disclosure and ethical hacking principles.

---

**Disclaimer:** This content is intended for educational purposes and authorized security testing only. Users are responsible for ensuring compliance with applicable laws and regulations.
