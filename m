From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 7/7] ASoC: tegra: constify snd_soc_ops structures
Date: Sat, 15 Oct 2016 16:55:51 +0200
Message-ID: <1476543351-17858-8-git-send-email-Julia.Lawall@lip6.fr>
References: <1476543351-17858-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476543351-17858-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/tegra/tegra_alc5632.c  |    2 +-
 sound/soc/tegra/tegra_max98090.c |    2 +-
 sound/soc/tegra/tegra_rt5640.c   |    2 +-
 sound/soc/tegra/tegra_rt5677.c   |    2 +-
 sound/soc/tegra/tegra_sgtl5000.c |    2 +-
 sound/soc/tegra/tegra_wm8753.c   |    2 +-
 sound/soc/tegra/tegra_wm8903.c   |    2 +-
 sound/soc/tegra/trimslice.c      |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff -u -p a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -65,7 +65,7 @@ static int tegra_alc5632_asoc_hw_params(
 	return 0;
 }
 
-static struct snd_soc_ops tegra_alc5632_asoc_ops = {
+static const struct snd_soc_ops tegra_alc5632_asoc_ops = {
 	.hw_params = tegra_alc5632_asoc_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -93,7 +93,7 @@ static int tegra_max98090_asoc_hw_params
 	return 0;
 }
 
-static struct snd_soc_ops tegra_max98090_ops = {
+static const struct snd_soc_ops tegra_max98090_ops = {
 	.hw_params = tegra_max98090_asoc_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -76,7 +76,7 @@ static int tegra_rt5640_asoc_hw_params(s
 	return 0;
 }
 
-static struct snd_soc_ops tegra_rt5640_ops = {
+static const struct snd_soc_ops tegra_rt5640_ops = {
 	.hw_params = tegra_rt5640_asoc_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -93,7 +93,7 @@ static int tegra_rt5677_event_hp(struct
 	return 0;
 }
 
-static struct snd_soc_ops tegra_rt5677_ops = {
+static const struct snd_soc_ops tegra_rt5677_ops = {
 	.hw_params = tegra_rt5677_asoc_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -82,7 +82,7 @@ static int tegra_sgtl5000_hw_params(stru
 	return 0;
 }
 
-static struct snd_soc_ops tegra_sgtl5000_ops = {
+static const struct snd_soc_ops tegra_sgtl5000_ops = {
 	.hw_params = tegra_sgtl5000_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -89,7 +89,7 @@ static int tegra_wm8753_hw_params(struct
 	return 0;
 }
 
-static struct snd_soc_ops tegra_wm8753_ops = {
+static const struct snd_soc_ops tegra_wm8753_ops = {
 	.hw_params = tegra_wm8753_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -96,7 +96,7 @@ static int tegra_wm8903_hw_params(struct
 	return 0;
 }
 
-static struct snd_soc_ops tegra_wm8903_ops = {
+static const struct snd_soc_ops tegra_wm8903_ops = {
 	.hw_params = tegra_wm8903_hw_params,
 };
 
diff -u -p a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -74,7 +74,7 @@ static int trimslice_asoc_hw_params(stru
 	return 0;
 }
 
-static struct snd_soc_ops trimslice_asoc_ops = {
+static const struct snd_soc_ops trimslice_asoc_ops = {
 	.hw_params = trimslice_asoc_hw_params,
 };
 
