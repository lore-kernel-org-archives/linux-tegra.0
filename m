From: Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Remove unnecessary 'Block comments should align the * on each line' message
Date: Sat, 25 Feb 2017 20:51:26 +0200
Message-ID: <1488048686-5964-1-git-send-email-codrut.cristian.grosu@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This was reported by checkpatch.pl

Signed-off-by: Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c | 2 +-
 sound/soc/tegra/tegra_rt5640.c  | 2 +-
 sound/soc/tegra/tegra_rt5677.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 0509902..1f648f9 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -1,5 +1,5 @@
 /*
-* tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
+ * tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
  *
  * Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
  * Copyright (C) 2012 - NVIDIA, Inc.
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 93a3568..cf706d0 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -1,5 +1,5 @@
 /*
-* tegra_rt5640.c - Tegra machine ASoC driver for boards using RT5640 codec.
+ * tegra_rt5640.c - Tegra machine ASoC driver for boards using RT5640 codec.
  *
  * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
  *
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index ebf58d0..0ed2eca 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -1,5 +1,5 @@
 /*
-* tegra_rt5677.c - Tegra machine ASoC driver for boards using RT5677 codec.
+ * tegra_rt5677.c - Tegra machine ASoC driver for boards using RT5677 codec.
  *
  * Copyright (c) 2014, The Chromium OS Authors.  All rights reserved.
  *
1.9.1
