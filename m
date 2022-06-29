Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF23DCCA481
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 19:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiF2Tmr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiF2Tmp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 15:42:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B20935DE0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jun 2022 12:42:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da7-0007RF-8J; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da2-003SHN-Ak; Wed, 29 Jun 2022 21:42:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da5-001xRV-17; Wed, 29 Jun 2022 21:42:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/5] ASoC: tegra: tegra20_das: Fold header file into only user
Date:   Wed, 29 Jun 2022 21:42:20 +0200
Message-Id: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9971; h=from:subject; bh=BTy0mmqclot2lVVQ+4NUmS55Evnj/fjfzi9Hk3gMHbA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsQfZGMbdaPxKTIw4Iv5rym/u69cLIVq/wm719N FhD9e7eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrEAAKCRDB/BR4rcrsCbvDB/ 9SFq5iSxebD+Z1KO5D0OaHmJLljXunDMrCv50oBk8b/uZyXitoXZSu7AiIDUk6Vpl2dlJhG9fxSbWN j6MVQqi6suMu9HjnKXrgvi7UPdIx8MX6qOTdpfN3EFNp5Vm8oC8fJ25FQsCU69DXQacZZ+RrOtDYCr wvAzAV0jgoj8d3RPGxtYZAvef0F2WvCAMwAklKm5Isr+RRxYvjg3fE1q79aOOjRkf1kxPUPnOR+r2X BSTLSX1HL4QN1vSuxvXCJstffc+OqBdNc9Rxu5F0CSuRSHeLn72e4/wblX1GJ4Ut3wY66oCk8WNgz0 IbB2yKn680y5c3jrsA6ctRDEwFoH0i
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since commit fcff5f99742e ("ASoC: tegra: remove unnecessary includes")
the header file (which at the time was named tegra_das.h) there is only
the actual driver that includes it. Just move the definitions into the
driver, drop the exports and remove the completely unused function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 110 +++++++++++++++++++++++--------
 sound/soc/tegra/tegra20_das.h | 120 ----------------------------------
 2 files changed, 83 insertions(+), 147 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra20_das.h

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 69c651274c12..d2801130a986 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -13,10 +13,90 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
-#include "tegra20_das.h"
 
 #define DRV_NAME "tegra20-das"
 
+/* Register TEGRA20_DAS_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_CTRL_SEL			0x00
+#define TEGRA20_DAS_DAP_CTRL_SEL_COUNT			5
+#define TEGRA20_DAS_DAP_CTRL_SEL_STRIDE			4
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
+
+/* Values for field TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_SEL_DAC1	0
+#define TEGRA20_DAS_DAP_SEL_DAC2	1
+#define TEGRA20_DAS_DAP_SEL_DAC3	2
+#define TEGRA20_DAS_DAP_SEL_DAP1	16
+#define TEGRA20_DAS_DAP_SEL_DAP2	17
+#define TEGRA20_DAS_DAP_SEL_DAP3	18
+#define TEGRA20_DAS_DAP_SEL_DAP4	19
+#define TEGRA20_DAS_DAP_SEL_DAP5	20
+
+/* Register TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL */
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT		3
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE		4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P	0
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S	4
+
+/*
+ * Values for:
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
+ */
+#define TEGRA20_DAS_DAC_SEL_DAP1	0
+#define TEGRA20_DAS_DAC_SEL_DAP2	1
+#define TEGRA20_DAS_DAC_SEL_DAP3	2
+#define TEGRA20_DAS_DAC_SEL_DAP4	3
+#define TEGRA20_DAS_DAC_SEL_DAP5	4
+
+/*
+ * Names/IDs of the DACs/DAPs.
+ */
+
+#define TEGRA20_DAS_DAP_ID_1 0
+#define TEGRA20_DAS_DAP_ID_2 1
+#define TEGRA20_DAS_DAP_ID_3 2
+#define TEGRA20_DAS_DAP_ID_4 3
+#define TEGRA20_DAS_DAP_ID_5 4
+
+#define TEGRA20_DAS_DAC_ID_1 0
+#define TEGRA20_DAS_DAC_ID_2 1
+#define TEGRA20_DAS_DAC_ID_3 2
+
+struct tegra20_das {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+/*
+ * Terminology:
+ * DAS: Digital audio switch (HW module controlled by this driver)
+ * DAP: Digital audio port (port/pins on Tegra device)
+ * DAC: Digital audio controller (e.g. I2S or AC97 controller elsewhere)
+ *
+ * The Tegra DAS is a mux/cross-bar which can connect each DAP to a specific
+ * DAC, or another DAP. When DAPs are connected, one must be the master and
+ * one the slave. Each DAC allows selection of a specific DAP for input, to
+ * cater for the case where N DAPs are connected to 1 DAC for broadcast
+ * output.
+ *
+ * This driver is dumb; no attempt is made to ensure that a valid routing
+ * configuration is programmed.
+ */
+
 static struct tegra20_das *das;
 
 static inline void tegra20_das_write(u32 reg, u32 val)
@@ -32,7 +112,7 @@ static inline u32 tegra20_das_read(u32 reg)
 	return val;
 }
 
-int tegra20_das_connect_dap_to_dac(int dap, int dac)
+static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
@@ -48,31 +128,8 @@ int tegra20_das_connect_dap_to_dac(int dap, int dac)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dac);
-
-int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
-				   int sdata1rx, int sdata2rx)
-{
-	u32 addr;
-	u32 reg;
-
-	if (!das)
-		return -ENODEV;
-
-	addr = TEGRA20_DAS_DAP_CTRL_SEL +
-		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
-	reg = (otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P) |
-		(!!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P) |
-		(!!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P) |
-		(!!master << TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P);
-
-	tegra20_das_write(addr, reg);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dap);
 
-int tegra20_das_connect_dac_to_dap(int dac, int dap)
+static int tegra20_das_connect_dac_to_dap(int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
@@ -90,7 +147,6 @@ int tegra20_das_connect_dac_to_dap(int dac, int dap)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
 
 #define LAST_REG(name) \
 	(TEGRA20_DAS_##name + \
diff --git a/sound/soc/tegra/tegra20_das.h b/sound/soc/tegra/tegra20_das.h
deleted file mode 100644
index 18e832ded73a..000000000000
--- a/sound/soc/tegra/tegra20_das.h
+++ /dev/null
@@ -1,120 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra20_das.h - Definitions for Tegra20 DAS driver
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010,2012 - NVIDIA, Inc.
- */
-
-#ifndef __TEGRA20_DAS_H__
-#define __TEGRA20_DAS_H__
-
-/* Register TEGRA20_DAS_DAP_CTRL_SEL */
-#define TEGRA20_DAS_DAP_CTRL_SEL			0x00
-#define TEGRA20_DAS_DAP_CTRL_SEL_COUNT			5
-#define TEGRA20_DAS_DAP_CTRL_SEL_STRIDE			4
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
-
-/* Values for field TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
-#define TEGRA20_DAS_DAP_SEL_DAC1	0
-#define TEGRA20_DAS_DAP_SEL_DAC2	1
-#define TEGRA20_DAS_DAP_SEL_DAC3	2
-#define TEGRA20_DAS_DAP_SEL_DAP1	16
-#define TEGRA20_DAS_DAP_SEL_DAP2	17
-#define TEGRA20_DAS_DAP_SEL_DAP3	18
-#define TEGRA20_DAS_DAP_SEL_DAP4	19
-#define TEGRA20_DAS_DAP_SEL_DAP5	20
-
-/* Register TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL */
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT		3
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE		4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P	0
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S	4
-
-/*
- * Values for:
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
- */
-#define TEGRA20_DAS_DAC_SEL_DAP1	0
-#define TEGRA20_DAS_DAC_SEL_DAP2	1
-#define TEGRA20_DAS_DAC_SEL_DAP3	2
-#define TEGRA20_DAS_DAC_SEL_DAP4	3
-#define TEGRA20_DAS_DAC_SEL_DAP5	4
-
-/*
- * Names/IDs of the DACs/DAPs.
- */
-
-#define TEGRA20_DAS_DAP_ID_1 0
-#define TEGRA20_DAS_DAP_ID_2 1
-#define TEGRA20_DAS_DAP_ID_3 2
-#define TEGRA20_DAS_DAP_ID_4 3
-#define TEGRA20_DAS_DAP_ID_5 4
-
-#define TEGRA20_DAS_DAC_ID_1 0
-#define TEGRA20_DAS_DAC_ID_2 1
-#define TEGRA20_DAS_DAC_ID_3 2
-
-struct tegra20_das {
-	struct device *dev;
-	struct regmap *regmap;
-};
-
-/*
- * Terminology:
- * DAS: Digital audio switch (HW module controlled by this driver)
- * DAP: Digital audio port (port/pins on Tegra device)
- * DAC: Digital audio controller (e.g. I2S or AC97 controller elsewhere)
- *
- * The Tegra DAS is a mux/cross-bar which can connect each DAP to a specific
- * DAC, or another DAP. When DAPs are connected, one must be the master and
- * one the slave. Each DAC allows selection of a specific DAP for input, to
- * cater for the case where N DAPs are connected to 1 DAC for broadcast
- * output.
- *
- * This driver is dumb; no attempt is made to ensure that a valid routing
- * configuration is programmed.
- */
-
-/*
- * Connect a DAP to a DAC
- * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
- * dac_sel: DAC to connect to: TEGRA20_DAS_DAP_SEL_DAC*
- */
-extern int tegra20_das_connect_dap_to_dac(int dap, int dac);
-
-/*
- * Connect a DAP to another DAP
- * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
- * other_dap_sel: DAP to connect to: TEGRA20_DAS_DAP_SEL_DAP*
- * master: Is this DAP the master (1) or slave (0)
- * sdata1rx: Is this DAP's SDATA1 pin RX (1) or TX (0)
- * sdata2rx: Is this DAP's SDATA2 pin RX (1) or TX (0)
- */
-extern int tegra20_das_connect_dap_to_dap(int dap, int otherdap,
-					  int master, int sdata1rx,
-					  int sdata2rx);
-
-/*
- * Connect a DAC's input to a DAP
- * (DAC outputs are selected by the DAP)
- * dac_id: DAC ID to connect: TEGRA20_DAS_DAC_ID_*
- * dap_sel: DAP to receive input from: TEGRA20_DAS_DAC_SEL_DAP*
- */
-extern int tegra20_das_connect_dac_to_dap(int dac, int dap);
-
-#endif

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

