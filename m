From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=202/7=5D=20ASoC=3A=20allow=20wolfson=20wm9712=20codec=20to=20be=20instantiated=20using=20device=20tree?=
Date: Thu, 20 Dec 2012 00:17:31 +0100
Message-ID: <1355959056-6009-2-git-send-email-dev@lynxeye.de>
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

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 sound/soc/codecs/wm9712.c | 7 +++++++
 1 Datei ge=C3=A4ndert, 7 Zeilen hinzugef=C3=BCgt(+)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 8e9a6a3..4050e6a 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -697,10 +697,17 @@ static int wm9712_remove(struct platform_device *=
pdev)
 	return 0;
 }
=20
+static const struct of_device_id wm9712_of_match[] =3D {
+	{ .compatible =3D "wlf,wm9712", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, wm9712_of_match);
+
 static struct platform_driver wm9712_codec_driver =3D {
 	.driver =3D {
 		.name =3D "wm9712-codec",
 		.owner =3D THIS_MODULE,
+		.of_match_table =3D wm9712_of_match,
 	},
=20
 	.probe =3D wm9712_probe,
--=20
1.7.11.7
