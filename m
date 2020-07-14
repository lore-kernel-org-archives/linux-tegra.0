From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ALSA: hda/tegra: Disable sync-write operation
Date: Tue, 14 Jul 2020 17:08:41 +0100
Message-ID: <20200714160841.2293-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mohan Kumar <mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit f34a4c9dd4ca ("ALSA: hda: Enable sync-write operation as default
for all controllers") enabled sync-write for all controllers and this is
causing audio playback on the Tegra186 HDA device to fail. For now,
disable sync-write support for Tegra to fix this.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/pci/hda/hda_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 0cc5fad1af8a..5637f0129932 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
+	chip->bus.core.sync_write = 0;
 	chip->bus.core.needs_damn_long_delay = 1;
 	chip->bus.core.aligned_mmio = 1;
 
-- 
2.17.1
