From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in device tree
Date: Wed,  7 Dec 2011 13:58:26 -0700
Message-ID: <1323291510-22338-2-git-send-email-swarren@nvidia.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323291510-22338-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If a card's device was instantiated from device tree, and card's device
did not specify a DAPM route map, and the device tree has an "audio-
routing" property, parse this to construct the DAPM route array.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch; separated this code out of the Tegra+WM8903 machine driver
into a generic feature.

Note that this binding does not allow the "control" field of the routes
to be specified via device tree. Should the binding be expanded to allow
this? Representing this while still keeping the binding generic enough
to be useful outside ASoC might be difficult. I'm not sure if this
feature is useful at the card level? I quickly checked, and couldn't see
any in-tree users of this functionality.

 .../bindings/sound/soc-audio-complex.txt           |   15 ++++++
 sound/soc/soc-core.c                               |   48 ++++++++++++++++++++
 2 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/soc-audio-complex.txt b/Documentation/devicetree/bindings/sound/soc-audio-complex.txt
index 1cc7059..f8e73cc 100644
--- a/Documentation/devicetree/bindings/sound/soc-audio-complex.txt
+++ b/Documentation/devicetree/bindings/sound/soc-audio-complex.txt
@@ -4,6 +4,12 @@ Required properties:
 - compatible : "generic,soc-audio-complex". Other compatible values
   indicating the specific HW model will typically be present too.
 - user-visible-name : The user-visible name of this sound complex.
+- audio-routing : A list of the connections between audio components.
+  Each entry is a pair of strings, the first being the connection's sink,
+  the second being the connection's source. Valid names for sources and
+  sinks are the determined by the binding for the HW that comprises the
+  audio complex, e.g. the names of an audio codec's pins, the names of
+  the user-visible jacks (plugs) on the board, etc.
 
 Example:
 
@@ -11,4 +17,13 @@ sound {
 	compatible = "nvidia,tegra-audio-wm8903",
 		     "generic,soc-audio-complex";
 	user-visible-name = "tegra-wm8903-harmony";
+	audio-routing =
+		"Headphone Jack", "HPOUTR",
+		"Headphone Jack", "HPOUTL",
+		"Int Spk", "ROP",
+		"Int Spk", "RON",
+		"Int Spk", "LOP",
+		"Int Spk", "LON",
+		"Mic Jack", "MICBIAS",
+		"IN1L", "Mic Jack";
 };
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 56d1bc5..f60e04f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2829,6 +2829,48 @@ static int snd_soc_of_parse_card_name(struct snd_soc_card *card)
 	return 0;
 }
 
+int snd_soc_of_parse_audio_routing(struct snd_soc_card *card)
+{
+	struct device_node *np = card->dev->of_node;
+	int num_routes;
+	struct snd_soc_dapm_route *routes;
+	int i;
+
+	num_routes = of_property_count_strings(np, "audio-routing");
+	if (num_routes & 1) {
+		dev_err(card->dev,
+			"Property 'audio-routing's length is not even\n");
+		return -EINVAL;
+	}
+	num_routes /= 2;
+	if (!num_routes) {
+		dev_err(card->dev,
+			"Property 'audio-routing's length is zero\n");
+		return -EINVAL;
+	}
+
+	routes = kzalloc(
+		num_routes * sizeof(*routes),
+		GFP_KERNEL);
+	if (!routes) {
+		dev_err(card->dev,
+			"Could not allocate DAPM route table\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_routes; i++) {
+		of_property_read_string_index(np, "audio-routing",
+			2 * i, &routes[i].sink);
+		of_property_read_string_index(np, "audio-routing",
+			(2 * i) + 1, &routes[i].source);
+	}
+
+	card->num_dapm_routes = num_routes;
+	card->dapm_routes = routes;
+
+	return 0;
+}
+
 /**
  * snd_soc_register_card - Register a card with the ASoC core
  *
@@ -2846,6 +2888,12 @@ int snd_soc_register_card(struct snd_soc_card *card)
 		ret = snd_soc_of_parse_card_name(card);
 		if (ret < 0)
 			return ret;
+
+		if (!card->num_dapm_routes && !card->dapm_routes) {
+			ret = snd_soc_of_parse_audio_routing(card);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	if (!card->name) {
-- 
1.7.0.4
