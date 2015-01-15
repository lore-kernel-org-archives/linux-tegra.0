From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 11/11] ASoC: tegra: add sink for the
	internal mic to tegra_max98090
Date: Thu, 15 Jan 2015 17:12:23 +0100
Message-ID: <1421338359-27467-12-git-send-email-tomeu.vizoso@collabora.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Stephen Warren <swarren@wwwdotorg.org>, Dylan Reid <dgreid@chromium.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org

This is used in the Tegra-based Chromebooks.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt | 1 +
 sound/soc/tegra/tegra_max98090.c                                        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
index c949abc..c3495be 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -18,6 +18,7 @@ Required properties:
   * Headphones
   * Speakers
   * Mic Jack
+  * Int Mic
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
   connected to the CODEC.
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 8df71a4..29ea87c 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -133,11 +133,13 @@ static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
 };
 
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
 static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
-- 
1.9.3
