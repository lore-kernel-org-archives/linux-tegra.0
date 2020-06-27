From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 14/23] ASoC: soc-core: Probe auxiliary component before others
Date: Sat, 27 Jun 2020 10:23:36 +0530
Message-ID: <1593233625-14961-15-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A router component can be added as an auxiliary device to the sound card
to help with audio routing across multiple components. DPCM dai links
use CPU<->Dummy or Dummy<->Codec style of links in simple-card driver and
hence do not have required DAI connections by default. Usually machine
driver can do the necessary mapping.

But if there is a crossbar switch HW which can connect multiple components,
it is expected to provide required user space configurability via MUX
controls. In such a case the crossbar can be represented as an independent
component and can be added as an auxiliary device. The exposed routing
interfaces can be used by other components in the system, thus probing it
first can avoid probe failures.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/soc-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8faca60..9041a03 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1850,19 +1850,19 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	/* probe all components used by DAI links on this card */
-	ret = soc_probe_link_components(card);
+	/* probe auxiliary components */
+	ret = soc_probe_aux_devices(card);
 	if (ret < 0) {
 		dev_err(card->dev,
-			"ASoC: failed to instantiate card %d\n", ret);
+			"ASoC: failed to probe aux component %d\n", ret);
 		goto probe_end;
 	}
 
-	/* probe auxiliary components */
-	ret = soc_probe_aux_devices(card);
+	/* probe all components used by DAI links on this card */
+	ret = soc_probe_link_components(card);
 	if (ret < 0) {
 		dev_err(card->dev,
-			"ASoC: failed to probe aux component %d\n", ret);
+			"ASoC: failed to instantiate card %d\n", ret);
 		goto probe_end;
 	}
 
-- 
2.7.4
