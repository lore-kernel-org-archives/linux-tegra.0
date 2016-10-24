From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "ASoC: tegra: constify snd_soc_ops structures" to the asoc tree
Date: Mon, 24 Oct 2016 19:01:26 +0100
Message-ID: <E1byjYs-0000qp-0f@debutante>
References: <1476543351-17858-8-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476543351-17858-8-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgMark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: constify snd_soc_ops structures

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8a7a282b780154c2669ce7d4f47a15bf3d287d49 Mon Sep 17 00:00:00 2001
From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Date: Sat, 15 Oct 2016 16:55:51 +0200
Subject: [PATCH] ASoC: tegra: constify snd_soc_ops structures

Check for snd_soc_ops structures that are only stored in the ops field of a
snd_soc_dai_link structure.  This field is declared const, so snd_soc_ops
structures that have this property can be declared as const also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct snd_soc_ops i@p = { ... };

@ok1@
identifier r.i;
struct snd_soc_dai_link e;
position p;
@@
e.ops = &i@p;

@ok2@
identifier r.i, e;
position p;
@@
struct snd_soc_dai_link e[] = { ..., { .ops = &i@p, }, ..., };

@bad@
position p != {r.p,ok1.p,ok2.p};
identifier r.i;
struct snd_soc_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct snd_soc_ops i = { ... };
// </smpl>

The effect on the layout of the .o files is shown by the following output of
the size command, first before then after the transformation:

  text    data     bss     dec     hex filename
   3143    1888     384    5415    1527 sound/soc/tegra/tegra_alc5632.o
   3191    1840     384    5415    1527 sound/soc/tegra/tegra_alc5632.o

   text    data     bss     dec     hex filename
   3672    2176     768    6616    19d8 sound/soc/tegra/tegra_max98090.o
   3720    2128     768    6616    19d8 sound/soc/tegra/tegra_max98090.o

   text    data     bss     dec     hex filename
   2770    1856     384    5010    1392 sound/soc/tegra/tegra_rt5640.o
   2818    1808     384    5010    1392 sound/soc/tegra/tegra_rt5640.o

   text    data     bss     dec     hex filename
   4412    2176     768    7356    1cbc sound/soc/tegra/tegra_rt5677.o
   4460    2128     768    7356    1cbc sound/soc/tegra/tegra_rt5677.o

   text    data     bss     dec     hex filename
   2442    1536       0    3978     f8a sound/soc/tegra/tegra_sgtl5000.o
   2490    1480       0    3970     f82 sound/soc/tegra/tegra_sgtl5000.o

   text    data     bss     dec     hex filename
   2105    1536       0    3641     e39 sound/soc/tegra/tegra_wm8753.o
   2153    1480       0    3633     e31 sound/soc/tegra/tegra_wm8753.o

   text    data     bss     dec     hex filename
   3755    1888     768    6411    190b sound/soc/tegra/tegra_wm8903.o
   3803    1840     768    6411    190b sound/soc/tegra/tegra_wm8903.o

   text    data     bss     dec     hex filename
   2121    1536       0    3657     e49 sound/soc/tegra/trimslice.o
   2169    1480       0    3649     e41 sound/soc/tegra/trimslice.o

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c  | 2 +-
 sound/soc/tegra/tegra_max98090.c | 2 +-
 sound/soc/tegra/tegra_rt5640.c   | 2 +-
 sound/soc/tegra/tegra_rt5677.c   | 2 +-
 sound/soc/tegra/tegra_sgtl5000.c | 2 +-
 sound/soc/tegra/tegra_wm8753.c   | 2 +-
 sound/soc/tegra/tegra_wm8903.c   | 2 +-
 sound/soc/tegra/trimslice.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index deb597f7c302..eead6e7f205b 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -65,7 +65,7 @@ static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_alc5632_asoc_ops = {
+static const struct snd_soc_ops tegra_alc5632_asoc_ops = {
 	.hw_params = tegra_alc5632_asoc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 902da36581d1..a403db6d563e 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -93,7 +93,7 @@ static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_max98090_ops = {
+static const struct snd_soc_ops tegra_max98090_ops = {
 	.hw_params = tegra_max98090_asoc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index e5ef4e9c4ac5..25b9fc03ba62 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -76,7 +76,7 @@ static int tegra_rt5640_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_rt5640_ops = {
+static const struct snd_soc_ops tegra_rt5640_ops = {
 	.hw_params = tegra_rt5640_asoc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index 1470873ecde6..ebf58d0e0f10 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -93,7 +93,7 @@ static int tegra_rt5677_event_hp(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_rt5677_ops = {
+static const struct snd_soc_ops tegra_rt5677_ops = {
 	.hw_params = tegra_rt5677_asoc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 1e76869dd488..4bbab098f50b 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -82,7 +82,7 @@ static int tegra_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_sgtl5000_ops = {
+static const struct snd_soc_ops tegra_sgtl5000_ops = {
 	.hw_params = tegra_sgtl5000_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index f0cd01dbfc38..bdedd1028569 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -89,7 +89,7 @@ static int tegra_wm8753_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_wm8753_ops = {
+static const struct snd_soc_ops tegra_wm8753_ops = {
 	.hw_params = tegra_wm8753_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index e485278e027a..2013e9c4bba0 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -96,7 +96,7 @@ static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_wm8903_ops = {
+static const struct snd_soc_ops tegra_wm8903_ops = {
 	.hw_params = tegra_wm8903_hw_params,
 };
 
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 2cea203c4f5f..870f84ab5005 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -74,7 +74,7 @@ static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops trimslice_asoc_ops = {
+static const struct snd_soc_ops trimslice_asoc_ops = {
 	.hw_params = trimslice_asoc_hw_params,
 };
 
-- 
2.8.1
