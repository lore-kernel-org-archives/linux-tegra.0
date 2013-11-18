From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: add port FF to GPIO ID's
Date: Mon, 18 Nov 2013 18:40:41 +0530
Message-ID: <1384780241-31639-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

NVIDIA Tegra124 supports has the new gpio port as GPIO_FF.
Add the macro for this port name.

Signed-off-by: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/gpio/tegra-gpio.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/dt-bindings/gpio/tegra-gpio.h b/include/dt-bindings/gpio/tegra-gpio.h
index 4d179c0..197dc28 100644
--- a/include/dt-bindings/gpio/tegra-gpio.h
+++ b/include/dt-bindings/gpio/tegra-gpio.h
@@ -43,6 +43,7 @@
 #define TEGRA_GPIO_BANK_ID_CC 28
 #define TEGRA_GPIO_BANK_ID_DD 29
 #define TEGRA_GPIO_BANK_ID_EE 30
+#define TEGRA_GPIO_BANK_ID_FF 31
 
 #define TEGRA_GPIO(bank, offset) \
 	((TEGRA_GPIO_BANK_ID_##bank * 8) + offset)
-- 
1.7.1.1
