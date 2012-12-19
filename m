From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=203/7=5D=20ASoC=3A=20tegra=3A=20setup=20DAP3=3C-=3EDAC3=20connection=20by=20default?=
Date: Thu, 20 Dec 2012 00:17:32 +0100
Message-ID: <1355959056-6009-3-git-send-email-dev@lynxeye.de>
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

This connection is used by the AC97 controller.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 sound/soc/tegra/tegra20_das.c | 13 +++++++++++++
 1 Datei ge=C3=A4ndert, 13 Zeilen hinzugef=C3=BCgt(+)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_da=
s.c
index 6543184..e723929 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -191,6 +191,19 @@ static int tegra20_das_probe(struct platform_devic=
e *pdev)
 		goto err;
 	}
=20
+	ret =3D tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_3,
+					     TEGRA20_DAS_DAP_SEL_DAC3);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
+		goto err;
+	}
+	ret =3D tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_3,
+					     TEGRA20_DAS_DAC_SEL_DAP3);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
+		goto err;
+	}
+
 	platform_set_drvdata(pdev, das);
=20
 	return 0;
--=20
1.7.11.7
