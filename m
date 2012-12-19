From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=206/7=5D=20ASoC=3A=20tegra=3A=20=20add=20ac97=20host=20controller=20to=20device=20tree?=
Date: Thu, 20 Dec 2012 00:17:35 +0100
Message-ID: <1355959056-6009-6-git-send-email-dev@lynxeye.de>
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

This adds the DT bindings and a default entry for the Tegra 2x
AC97 host controller.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra20-ac97.txt         | 22 ++++++++++++++=
++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |  8 ++++++++
 sound/soc/tegra/tegra20_ac97.c                     |  6 ++++--
 sound/soc/tegra/tegra20_ac97.h                     |  2 +-
 4 Dateien ge=C3=A4ndert, 35 Zeilen hinzugef=C3=BCgt(+), 3 Zeilen entfe=
rnt(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a20-ac97.txt

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac9=
7.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
new file mode 100644
index 0000000..c145497
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
@@ -0,0 +1,22 @@
+NVIDIA Tegra 20 AC97 controller
+
+Required properties:
+- compatible : "nvidia,tegra20-ac97"
+- reg : Should contain AC97 controller registers location and length
+- interrupts : Should contain AC97 interrupt
+- nvidia,dma-request-selector : The Tegra DMA controller's phandle and
+  request selector for the AC97 controller
+- nvidia,codec-reset-gpio : The Tegra GPIO controller's phandle and th=
e number
+  of the GPIO used to reset the external AC97 codec
+- nvidia,codec-sync-gpio : The Tegra GPIO controller's phandle and the=
 number
+  of the GPIO corresponding with the AC97 DAP _FS line
+Example:
+
+ac97@70002000 {
+	compatible =3D "nvidia,tegra20-ac97";
+	reg =3D <0x70002000 0x200>;
+	interrupts =3D <0 81 0x04>;
+	nvidia,dma-request-selector =3D <&apbdma 12>;
+	nvidia,codec-reset-gpio =3D <&gpio 170 0>;
+	nvidia,codec-sync-gpio =3D <&gpio 120 0>;
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
index b8effa1..b720859 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -177,6 +177,14 @@
 		compatible =3D "nvidia,tegra20-das";
 		reg =3D <0x70000c00 0x80>;
 	};
+=09
+	tegra_ac97: ac97@70002000 {
+		compatible =3D "nvidia,tegra20-ac97";
+		reg =3D <0x70002000 0x200>;
+		interrupts =3D <0 81 0x04>;
+		nvidia,dma-request-selector =3D <&apbdma 12>;
+		status =3D "disabled";
+	};
=20
 	tegra_i2s1: i2s@70002800 {
 		compatible =3D "nvidia,tegra20-i2s";
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_a=
c97.c
index a2f71cf..a2cb89a 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -156,8 +156,10 @@ static inline void tegra20_ac97_start_playback(str=
uct tegra20_ac97 *ac97)
 			   TEGRA20_AC97_FIFO_SCR_PB_QRT_MT_EN);
=20
 	regmap_update_bits(ac97->regmap, TEGRA20_AC97_CTRL,
-			   TEGRA20_AC97_CTRL_PCM_DAC_EN | TEGRA20_AC97_CTRL_STM_EN,
-			   TEGRA20_AC97_CTRL_PCM_DAC_EN | TEGRA20_AC97_CTRL_STM_EN);
+			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
+			   TEGRA20_AC97_CTRL_STM_EN,
+			   TEGRA20_AC97_CTRL_PCM_DAC_EN |
+			   TEGRA20_AC97_CTRL_STM_EN);
 }
=20
 static inline void tegra20_ac97_stop_playback(struct tegra20_ac97 *ac9=
7)
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_a=
c97.h
index a805aae..dddc682 100644
--- a/sound/soc/tegra/tegra20_ac97.h
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -1,5 +1,5 @@
 /*
- * tegra20_ac97.c - Definitions for the Tegra20 AC97 controller driver
+ * tegra20_ac97.h - Definitions for the Tegra20 AC97 controller driver
  *
  * Copyright (c) 2012 Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
  *
--=20
1.7.11.7
