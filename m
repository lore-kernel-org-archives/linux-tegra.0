From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: max98090: Fix restore of DAPM Muxes" to the asoc tree
Date: Mon,  6 May 2019 16:03:45 +0100 (BST)
Message-ID: <20190506150345.663AD440036@finisterre.ee.mobilebroadband>
References: <1556720978-13233-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556720978-13233-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: max98090: Fix restore of DAPM Muxes

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

From ecb2795c08bc825ebd604997e5be440b060c5b18 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Wed, 1 May 2019 15:29:38 +0100
Subject: [PATCH] ASoC: max98090: Fix restore of DAPM Muxes

The max98090 driver defines 3 DAPM muxes; one for the right line output
(LINMOD Mux), one for the left headphone mixer source (MIXHPLSEL Mux)
and one for the right headphone mixer source (MIXHPRSEL Mux). The same
bit is used for the mux as well as the DAPM enable, and although the mux
can be correctly configured, after playback has completed, the mux will
be reset during the disable phase. This is preventing the state of these
muxes from being saved and restored correctly on system reboot. Fix this
by marking these muxes as SND_SOC_NOPM.

Note this has been verified this on the Tegra124 Nyan Big which features
the MAX98090 codec.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/codecs/max98090.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 30c242c38d99..7619ea31ab50 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1194,14 +1194,14 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 		&max98090_right_rcv_mixer_controls[0],
 		ARRAY_SIZE(max98090_right_rcv_mixer_controls)),
 
-	SND_SOC_DAPM_MUX("LINMOD Mux", M98090_REG_LOUTR_MIXER,
-		M98090_LINMOD_SHIFT, 0, &max98090_linmod_mux),
+	SND_SOC_DAPM_MUX("LINMOD Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_linmod_mux),
 
-	SND_SOC_DAPM_MUX("MIXHPLSEL Mux", M98090_REG_HP_CONTROL,
-		M98090_MIXHPLSEL_SHIFT, 0, &max98090_mixhplsel_mux),
+	SND_SOC_DAPM_MUX("MIXHPLSEL Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_mixhplsel_mux),
 
-	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", M98090_REG_HP_CONTROL,
-		M98090_MIXHPRSEL_SHIFT, 0, &max98090_mixhprsel_mux),
+	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_mixhprsel_mux),
 
 	SND_SOC_DAPM_PGA("HP Left Out", M98090_REG_OUTPUT_ENABLE,
 		M98090_HPLEN_SHIFT, 0, NULL, 0),
-- 
2.20.1
