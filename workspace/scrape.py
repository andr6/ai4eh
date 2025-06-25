import sys
from scrapegraphai.graphs import SmartScraperGraph

graph_config = {
    "llm": {
        "model": "gpt-4o",
    },
    "verbose": False,
    "headless": True,
}

smart_scraper_graph = SmartScraperGraph(
    prompt="Extract useful information from the webpage, including a description of what the company does and technology information.",
    source=sys.argv[1],
    config=graph_config,
)

result = smart_scraper_graph.run()

content = result.get("content")
if content:
    print(content)
