From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: simple-card: Restore original configuration of DAI format" to the asoc tree
Date: Fri, 24 May 2019 13:12:37 +0100 (BST)
Message-ID: <20190524121238.0163B440049@finisterre.sirena.org.uk>
References: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: simple-card: Restore original configuration of DAI format

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

From 4819d06292c9b57eabdd6d1603e49a27baf183be Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 24 May 2019 09:54:04 +0100
Subject: [PATCH] ASoC: simple-card: Restore original configuration of DAI
 format

Revert commit 069d037aea98 ("ASoC: simple-card: Fix configuration of
DAI format"). During further review, it turns out that the actual issue
was caused by an incorrectly formatted device-tree node describing the
soundcard.

The following is incorrect because the simple-audio-card
'bitclock-master' and 'frame-master' properties should not reference the
actual codec phandle ...

	sound {
		compatible = "simple-audio-card";
		...
	=>	simple-audio-card,bitclock-master = <&codec>;
	=>	simple-audio-card,frame-master = <&codec>;
		...

		simple-audio-card,cpu {
			sound-dai = <&xxx>;
		};

		simple-audio-card,codec {
	=>		sound-dai = <&codec>;
		};
	};

Rather, these properties should reference the phandle to the
'simple-audio-card,codec' property as shown below ...

	sound {
		compatible = "simple-audio-card";
		...
	=>	simple-audio-card,bitclock-master = <&codec>;
	=>	simple-audio-card,frame-master = <&codec>;
		...

		simple-audio-card,cpu {
			sound-dai = <&xxx>;
		};

	=>	codec: simple-audio-card,codec { /* simple-card wants here */
			sound-dai = <&xxx>;	 /* not here */
		};
	};

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index c2c8dcbcf795..9b568f578bcd 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -283,6 +283,11 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	codec_dai		=
 	dai_props->codec_dai	= &priv->dais[li->dais++];
 
+	ret = asoc_simple_parse_daifmt(dev, node, codec,
+				       prefix, &dai_link->dai_fmt);
+	if (ret < 0)
+		goto dai_link_of_err;
+
 	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
 
 	ret = asoc_simple_parse_cpu(cpu, dai_link, &single_cpu);
@@ -293,11 +298,6 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_daifmt(dev, node, dai_link->codecs->of_node,
-				       prefix, &dai_link->dai_fmt);
-	if (ret < 0)
-		goto dai_link_of_err;
-
 	ret = asoc_simple_parse_platform(plat, dai_link);
 	if (ret < 0)
 		goto dai_link_of_err;
-- 
2.20.1
