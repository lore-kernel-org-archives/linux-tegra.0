From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: simple-card: Fix configuration of DAI format" to the asoc tree
Date: Tue, 21 May 2019 21:32:41 +0100 (BST)
Message-ID: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
References: <1558029086-18024-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558029086-18024-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: simple-card: Fix configuration of DAI format

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 069d037aea98ffa64c26d4b1dc958fb8f39f5c2b Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 16 May 2019 18:51:26 +0100
Subject: [PATCH] ASoC: simple-card: Fix configuration of DAI format

When configuring a codec to be both bit-clock and frame-master, it was
found that the codec was always configured as bit-clock and frame-slave.
Looking at the simple_dai_link_of() function there appears to be two
problems with the configuration of the DAI format, which are ...

1. The function asoc_simple_parse_daifmt() is called before the function
   asoc_simple_parse_codec() and this means that the device-tree node
   for the codec has not been parsed yet, which is needed by the
   function asoc_simple_parse_daifmt() to determine who is the codec.
2. The phandle passed to asoc_simple_parse_daifmt() is the phandle to
   the 'codec' node and not the phandle of the actual codec defined by
   the 'sound-dai' property under the 'codec' node.

Fix the above by moving the call to asoc_simple_parse_daifmt() after the
the call to asoc_simple_parse_codec() and pass the phandle for the codec
to asoc_simple_parse_daifmt().

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9b568f578bcd..c2c8dcbcf795 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -283,11 +283,6 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	codec_dai		=
 	dai_props->codec_dai	= &priv->dais[li->dais++];
 
-	ret = asoc_simple_parse_daifmt(dev, node, codec,
-				       prefix, &dai_link->dai_fmt);
-	if (ret < 0)
-		goto dai_link_of_err;
-
 	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
 
 	ret = asoc_simple_parse_cpu(cpu, dai_link, &single_cpu);
@@ -298,6 +293,11 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
+	ret = asoc_simple_parse_daifmt(dev, node, dai_link->codecs->of_node,
+				       prefix, &dai_link->dai_fmt);
+	if (ret < 0)
+		goto dai_link_of_err;
+
 	ret = asoc_simple_parse_platform(plat, dai_link);
 	if (ret < 0)
 		goto dai_link_of_err;
-- 
2.20.1
