From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] pinctrl: tegra: Fix build dependency
Date: Sat, 04 Jun 2016 14:35:56 +0800
Message-ID: <1465022156.547.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I got below build error:
ERROR: "tegra_xusb_padctl_legacy_probe" [drivers/phy/tegra/phy-tegra-xusb.ko] undefined!
with below build configuration:
CONFIG_ARCH_TEGRA=y
CONFIG_PINCTRL_TEGRA_XUSB=y
CONFIG_PHY_TEGRA_XUSB=y

The problem is below line in drivers/pinctrl/Makefile
obj-$(CONFIG_PINCTRL_TEGRA)     += tegra/

So even CONFIG_PINCTRL_TEGRA_XUSB=y is set, kbuild still does not compile
the code in drivers/pinctrl/tegra folder if !CONFIG_PINCTRL_TEGRA.

phy-tegra-xusb.c does not use any symbol from pinctrl-tegra.c,
so build pinctrl-tegra.c only when CONFIG_PINCTRL_TEGRA is set.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/pinctrl/Makefile       | 2 +-
 drivers/pinctrl/tegra/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 2ed0b3f..25ec450 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
-obj-$(CONFIG_PINCTRL_TEGRA)	+= tegra/
+obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-$(CONFIG_PINCTRL_TZ1090)	+= pinctrl-tz1090.o
 obj-$(CONFIG_PINCTRL_TZ1090_PDC)	+= pinctrl-tz1090-pdc.o
 obj-$(CONFIG_PINCTRL_U300)	+= pinctrl-u300.o
diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
index a927379..d9ea2be 100644
--- a/drivers/pinctrl/tegra/Makefile
+++ b/drivers/pinctrl/tegra/Makefile
@@ -1,4 +1,4 @@
-obj-y					+= pinctrl-tegra.o
+obj-$(CONFIG_PINCTRL_TEGRA)		+= pinctrl-tegra.o
 obj-$(CONFIG_PINCTRL_TEGRA20)		+= pinctrl-tegra20.o
 obj-$(CONFIG_PINCTRL_TEGRA30)		+= pinctrl-tegra30.o
 obj-$(CONFIG_PINCTRL_TEGRA114)		+= pinctrl-tegra114.o
-- 
2.5.0
