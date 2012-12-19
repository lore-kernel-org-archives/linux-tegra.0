From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=204/7=5D=20ASoC=3A=20tegra=3A=20add=20function=20to=20set=20ac97=20rate?=
Date: Thu, 20 Dec 2012 00:17:33 +0100
Message-ID: <1355959056-6009-4-git-send-email-dev@lynxeye.de>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355959056-6009-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

AC97 uses a fixed rate, unrelated to the sample rate. Add a function to
make the setup more trivial.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 sound/soc/tegra/tegra_asoc_utils.c | 53 ++++++++++++++++++++++++++++++=
++++++++
 sound/soc/tegra/tegra_asoc_utils.h |  1 +
 2 Dateien ge=C3=A4ndert, 54 Zeilen hinzugef=C3=BCgt(+)

diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra=
_asoc_utils.c
index 6872c77..ba419f8 100644
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ b/sound/soc/tegra/tegra_asoc_utils.c
@@ -112,6 +112,59 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_ut=
ils_data *data, int srate,
 }
 EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_rate);
=20
+int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
+{
+	const int pll_rate =3D 73728000;
+	const int ac97_rate =3D 24576000;
+	int err;
+
+	clk_disable_unprepare(data->clk_cdev1);
+	clk_disable_unprepare(data->clk_pll_a_out0);
+	clk_disable_unprepare(data->clk_pll_a);
+
+	/*
+	 * AC97 rate is fixed at 24.576MHz and is used for both the host
+	 * controller and the external codec
+	 */
+	err =3D clk_set_rate(data->clk_pll_a, pll_rate);
+	if (err) {
+		dev_err(data->dev, "Can't set pll_a rate: %d\n", err);
+		return err;
+	}
+
+	err =3D clk_set_rate(data->clk_pll_a_out0, ac97_rate);
+	if (err) {
+		dev_err(data->dev, "Can't set pll_a_out0 rate: %d\n", err);
+		return err;
+	}
+
+	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
+
+	err =3D clk_prepare_enable(data->clk_pll_a);
+	if (err) {
+		dev_err(data->dev, "Can't enable pll_a: %d\n", err);
+		return err;
+	}
+
+	err =3D clk_prepare_enable(data->clk_pll_a_out0);
+	if (err) {
+		dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
+		return err;
+	}
+
+	err =3D clk_prepare_enable(data->clk_cdev1);
+	if (err) {
+		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
+		return err;
+	}
+
+	data->set_baseclock =3D pll_rate;
+	data->set_mclk =3D ac97_rate;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
+
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev)
 {
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra=
_asoc_utils.h
index 44db1db..974c9f8 100644
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ b/sound/soc/tegra/tegra_asoc_utils.h
@@ -43,6 +43,7 @@ struct tegra_asoc_utils_data {
=20
 int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int =
srate,
 			      int mclk);
+int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)=
;
 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
 			  struct device *dev);
 void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *data);
--=20
1.7.11.7
