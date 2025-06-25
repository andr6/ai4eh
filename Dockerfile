FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get install -y curl sed gpg gnupg2 software-properties-common apt-transport-https lsb-release ca-certificates python3-launchpadlib

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN sed -i 's/kali-rolling/jammy/g' /etc/apt/sources.list.d/deadsnakes-ubuntu-ppa-kali-rolling.list

RUN apt-get update
RUN apt-get install -y golang python3.12 wget curl git build-essential ca-certificates nuclei ffuf subfinder massdns jq chromium
RUN apt-get remove -y python3 python3.13 python3.13-minimal

RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.12 get-pip.py && rm get-pip.py
RUN ln -s /usr/bin/python3.12 /usr/bin/python3
RUN rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ninja

USER ninja
WORKDIR /home/ninja

RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install github.com/d3mondev/puredns/v2@latest
RUN go install -v github.com/projectdiscovery/notify/cmd/notify@latest

RUN nuclei -update-templates

# 2.3 LLM tool
RUN pip install llm
RUN /home/ninja/.local/bin/llm install llm-gemini

# 3.1.2 Subwiz
RUN pip install torch --index-url https://download.pytorch.org/whl/cpu
RUN pip install subwiz

# 3.1.3 Contextual wordlists
RUN pip install html2text nltk scrapegraphai

# 3.2.1 Eyeballer
RUN git clone https://github.com/BishopFox/eyeballer.git
RUN chmod +x /home/ninja/eyeballer/eyeballer.py
RUN pip install -r /home/ninja/eyeballer/requirements.txt
RUN ln -s /home/ninja/eyeballer/eyeballer.py /home/ninja/.local/bin/eyeballer
RUN wget https://github.com/BishopFox/eyeballer/releases/download/3.0/bishop-fox-pretrained-v3.h5

# 3.2.2 Multimodal LLMs
RUN pip install google-genai google-generativeai

# 3.3.1 FFUFAI
RUN pip install requests openai anthropic
RUN git clone https://github.com/jthack/ffufai
RUN chmod +x /home/ninja/ffufai/ffufai.py
RUN ln -s /home/ninja/ffufai/ffufai.py /home/ninja/.local/bin/ffufai

# 5.1.1 Solving CTF challenges
RUN pip install cai-framework

ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/ninja/go/bin:/home/ninja/.local/bin

WORKDIR /home/ninja/workshop

CMD ["/bin/bash"]
