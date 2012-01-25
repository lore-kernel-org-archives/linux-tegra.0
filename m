From: Leon Romanovsky <leon@leon.nu>
Subject: [PATCH 3/3] ASoC: dt: tegra: Enable headphone
	autodetection on PAZ00 board.
Date: Wed, 25 Jan 2012 20:51:17 +0200
Message-ID: <1327517477-29785-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net, ccross@android.com
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Leon Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org

This patch is adding support of headphone autodetection on PAZ00 board.

Signed-off-by: Leon Romanovsky <leon@leon.nu>
---
 arch/arm/boot/dts/tegra-paz00.dts |    1 +
 sound/soc/tegra/tegra_alc5632.c   |   40 +++++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 692d20c..f95bade 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -64,6 +64,7 @@
 
 		nvidia,audio-codec = <&alc5632>;
 		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
 	};
 
 	serial@70006000 {
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 22348e8..ce211af 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
+#include <linux/of_gpio.h>
 
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -34,9 +35,14 @@
 
 #define DRV_NAME "tegra-alc5632"
 
+#define GPIO_HP_DET     BIT(1)
+
+
 struct tegra_alc5632 {
 	struct tegra_asoc_utils_data util_data;
 	struct platform_device *pcm_dev;
+	int gpio_requested;
+	int gpio_hp_det;
 };
 
 static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -86,6 +92,13 @@ static struct snd_soc_jack_pin tegra_alc5632_hs_jack_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio = {
+	.name = "Headphone detect",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+	.invert = 1,
+};
+
 static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Int Spk", NULL),
 	SND_SOC_DAPM_HP("Headset Stereophone", NULL),
@@ -114,6 +127,9 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
+	struct device_node *np = codec->card->dev->of_node;
+	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(codec->card);
+	int ret;
 
 	snd_soc_jack_new(codec, "Headset Jack", SND_JACK_HEADSET,
 			 &tegra_alc5632_hs_jack);
@@ -121,6 +137,16 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 			ARRAY_SIZE(tegra_alc5632_hs_jack_pins),
 			tegra_alc5632_hs_jack_pins);
 
+	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+
+	if (gpio_is_valid(machine->gpio_hp_det)) {
+		tegra_alc5632_hp_jack_gpio.gpio = machine->gpio_hp_det;
+		snd_soc_jack_add_gpios(&tegra_alc5632_hs_jack,
+						1,
+						&tegra_alc5632_hp_jack_gpio);
+		machine->gpio_requested |= GPIO_HP_DET;
+	}
+
 	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
 
 	return 0;
@@ -243,13 +269,19 @@ err:
 static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
+	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
+
+	if (machine->gpio_requested & GPIO_HP_DET)
+		snd_soc_jack_free_gpios(&tegra_alc5632_hs_jack,
+					1,
+					&tegra_alc5632_hp_jack_gpio);
+	machine->gpio_requested = 0;
 
 	snd_soc_unregister_card(card);
 
-	tegra_asoc_utils_fini(&alc5632->util_data);
-	if (!IS_ERR(alc5632->pcm_dev))
-		platform_device_unregister(alc5632->pcm_dev);
+	tegra_asoc_utils_fini(&machine->util_data);
+	if (!IS_ERR(machine->pcm_dev))
+		platform_device_unregister(machine->pcm_dev);
 
 	return 0;
 }
-- 
1.7.3.4
