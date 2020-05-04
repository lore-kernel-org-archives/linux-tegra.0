From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ALSA: hda: add member to store ratio for stripe control
Date: Mon, 4 May 2020 13:46:15 +0530
Message-ID: <1588580176-2801-3-git-send-email-spujar@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588580176-2801-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stripe control programming is governed by following formula, which is
referenced from the HD Audio specification(Revision 1.0a).
  { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

Currently above is implemented in snd_hdac_get_stream_stripe_ctl().
This patch introduces a structure member to store the default factor
of '8'. If any HW wants to use a different value, this member can be
easily updated.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/sound/hdaudio.h     |  3 +++
 sound/hda/hdac_controller.c | 12 ++++++++++++
 sound/hda/hdac_stream.c     |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index affedc2..d365297 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -364,6 +364,9 @@ struct hdac_bus {
 	/* link management */
 	struct list_head hlink_list;
 	bool cmd_dma_state;
+
+	/* factor used to derive STRIPE control value */
+	unsigned int sdo_limit;
 };
 
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index bc4a8b6..ac15aa3 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -527,6 +527,18 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 	}
 
 	bus->chip_init = true;
+
+	/*
+	 * Default value of '8' is as per the HD audio specification (Rev 1.0a).
+	 * Following relation is used to derive STRIPE control value.
+	 *  For sample rate <= 48K:
+	 *   { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }
+	 *  For sample rate > 48K:
+	 *   { ((num_channels * bits_per_sample * rate/48000) /
+	 *	number of SDOs) >= 8 }
+	 */
+	bus->sdo_limit = 8;
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_init_chip);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a314b03..a38a2af 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -38,7 +38,7 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 		else
 			value = (channels * bits_per_sample) / sdo_line;
 
-		if (value >= 8)
+		if (value >= bus->sdo_limit)
 			break;
 	}
 
-- 
2.7.4
