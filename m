From: Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Add blank line after declarations
Date: Sat, 25 Feb 2017 20:59:17 +0200
Message-ID: <1488049157-6535-1-git-send-email-codrut.cristian.grosu@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This was reported by checkpatch.pl

Signed-off-by: Codrut GROSU <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra20_das.c  | 1 +
 sound/soc/tegra/tegra30_ahub.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 6d4a277..4024e3a 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -41,6 +41,7 @@ static inline void tegra20_das_write(u32 reg, u32 val)
 static inline u32 tegra20_das_read(u32 reg)
 {
 	u32 val;
+
 	regmap_read(das->regmap, reg, &val);
 	return val;
 }
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d7494c0..8c10ae7 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -41,6 +41,7 @@ static inline void tegra30_apbif_write(u32 reg, u32 val)
 static inline u32 tegra30_apbif_read(u32 reg)
 {
 	u32 val;
+
 	regmap_read(ahub->regmap_apbif, reg, &val);
 	return val;
 }
1.9.1
