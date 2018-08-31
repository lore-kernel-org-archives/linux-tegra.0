From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 26/34] dt-bindings: add broadcom (formerly plx technology) vendor prefix
Date: Fri, 31 Aug 2018 18:38:08 +0200
Message-ID: <20180831163817.23970-27-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

PLX Technology meanwhile got bought by Broadcom Corporation but the
vendor prefix plx is still used in 8 current device trees. This silences
the following checkpatch.pl warning:

WARNING: DT compatible string vendor "plx" appears un-documented
 -- check ./Documentation/devicetree/bindings/vendor-prefixes.txt

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Replace "[PATCH 27/28] ARM: tegra: apalis_t30: fix pcie switch vendor
  compatible" with "[PATCH v2 26/34] dt-bindings: add broadcom (formerly
  plx technology) vendor prefix" as suggested by Stefan.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c3fc512e746..e40312dcba7d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -297,6 +297,7 @@ pine64	Pine64
 pixcir  PIXCIR MICROELECTRONICS Co., Ltd
 plathome	Plat'Home Co., Ltd.
 plda	PLDA
+plx	Broadcom Corporation (formerly PLX Technology)
 portwell	Portwell Inc.
 poslab	Poslab Technology Co., Ltd.
 powervr	PowerVR (deprecated, use img)
-- 
2.14.4
