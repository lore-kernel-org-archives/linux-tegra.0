From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: delete nvidia,tegra20-spi.txt binding
Date: Mon, 25 Nov 2013 15:37:55 -0700
Message-ID: <1385419075-11414-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This binding shouldn't exist; Tegra20 has two forms of SPI controller
that are documented separately in nvidia,tegra20-sflash.txt and
nvidia,tegra20-slink.txt.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt

diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt
deleted file mode 100644
index 6b9e51896693..000000000000
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-NVIDIA Tegra 2 SPI device
-
-Required properties:
-- compatible : should be "nvidia,tegra20-spi".
-- gpios : should specify GPIOs used for chipselect.
-- 
1.8.1.5
