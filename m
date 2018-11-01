From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1 1/3] clk: tegra: get rid of duplicate defines
Date: Thu,  1 Nov 2018 02:52:28 +0100
Message-ID: <20181101015230.27310-2-marcel@ziswiler.com>
References: <20181101015230.27310-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101015230.27310-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Get rid of 3 duplicate defines.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/clk/tegra/clk-tegra-periph.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 38c4eb28c8bf..cc5275ec2c01 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -79,7 +79,6 @@
 #define CLK_SOURCE_3D 0x158
 #define CLK_SOURCE_2D 0x15c
 #define CLK_SOURCE_MPE 0x170
-#define CLK_SOURCE_UARTE 0x1c4
 #define CLK_SOURCE_VI_SENSOR 0x1a8
 #define CLK_SOURCE_VI 0x148
 #define CLK_SOURCE_EPP 0x16c
@@ -117,8 +116,6 @@
 #define CLK_SOURCE_ISP 0x144
 #define CLK_SOURCE_SOR0 0x414
 #define CLK_SOURCE_DPAUX 0x418
-#define CLK_SOURCE_SATA_OOB 0x420
-#define CLK_SOURCE_SATA 0x424
 #define CLK_SOURCE_ENTROPY 0x628
 #define CLK_SOURCE_VI_SENSOR2 0x658
 #define CLK_SOURCE_HDMI_AUDIO 0x668
-- 
2.14.5
