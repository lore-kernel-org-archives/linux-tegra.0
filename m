Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCD7C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiFCVIp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Jun 2022 17:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiFCVIo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Jun 2022 17:08:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7522C27FCB
        for <linux-tegra@vger.kernel.org>; Fri,  3 Jun 2022 14:08:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWg-0003ql-Rk; Fri, 03 Jun 2022 23:08:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWb-006Hpk-CA; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWZ-00E1H5-6s; Fri, 03 Jun 2022 23:08:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>, Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     kernel@pengutronix.de, linux-mtd@lists.infradead.org,
        Michael Walle <michael@walle.cc>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Subject: [PATCH 00/14] mtd: Fix platform remove callbacks to always return 0
Date:   Fri,  3 Jun 2022 23:07:44 +0200
Message-Id: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310; i=uwe@kleine-koenig.org; h=from:subject; bh=q2ycDgelp/nO6ViqBZJgFoKvH7fVSGWxa2BGxqpYD+s=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnfE5fVVOvpqL4Xqzddai1jCcQBM7b5jo5W1QZw8 iIwB8NmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp3xAAKCRDB/BR4rcrsCXt2B/ 4qWz6olnMyidYhZ7g/qZaoPMgkHVnZRaB+OnSUr+L4Jm1IodQP4MrwiltmKlSyqmdwnvxJzxtnT0zb s0TX8Y6bInlnxd/SRRBKvGKHvHFYpztNxRZkvHHz9U4M6YMqj5zZeMjx9xgdm7bQ2o3UTQTFks2VAw kS3U2+mKRRm/1zgoPawD0hqmCMMbidTgGK/2vZHrF/V1JRMy5bcK1ByBNeXwoSXt72M2W72LAdU5XA mI7wUQR/g3qkW0tGS11qyaC5ZAS76ZpOBS5GaLlS2NwqdsSmKlZ+rWdlrNH0aBd3XjiWq8HeT31nQx srBqXHcGBUJS922WV6Z9YIm/CKnDXI
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

this series prepares to make platform remove callbacks return void.
Therefor first update them to always return 0. The rationale is that the
Linux device model doesn't handle failures on remove and if a remove
callback returns an error, it just emits a quite generic error message
and still removes the device.

Best regards
Uwe

Uwe Kleine-König (14):
  mtd: hyperbus: Make hyperbus_unregister_device() return void
  mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
  mtd: powernv_flash: Warn about failure to unregister mtd device
  mtd: st-spi_fsm: Warn about failure to unregister mtd device
  mtd: lpddr2_nvm: Warn about failure to unregister mtd device
  mtd: spear_smi: Don't skip cleanup after mtd_device_unregister()
    failed
  mtd: spear_smi: Drop if with an always false condition
  mtd: rawnand: atmel: Warn about failure to unregister mtd device
  mtd: rawnand: omap2: Suppress error message after WARN in .remove()
  mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister()
    failed
  mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister()
    failed
  mtd: rawnand: meson: Drop cleaning platform data in .remove()
  mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
  mtd: physmap: Drop if with an always false condition

 drivers/mtd/devices/powernv_flash.c          |  4 +++-
 drivers/mtd/devices/spear_smi.c              | 10 ++--------
 drivers/mtd/devices/st_spi_fsm.c             |  4 +++-
 drivers/mtd/hyperbus/hbmc-am654.c            |  6 +++---
 drivers/mtd/hyperbus/hyperbus-core.c         |  8 ++------
 drivers/mtd/hyperbus/rpc-if.c                |  5 +++--
 drivers/mtd/lpddr/lpddr2_nvm.c               |  4 +++-
 drivers/mtd/maps/physmap-core.c              | 13 +++----------
 drivers/mtd/nand/raw/atmel/nand-controller.c |  5 ++++-
 drivers/mtd/nand/raw/meson_nand.c            | 16 +++-------------
 drivers/mtd/nand/raw/omap2.c                 |  6 ++----
 drivers/mtd/nand/raw/tegra_nand.c            |  5 +----
 drivers/mtd/spi-nor/controllers/aspeed-smc.c |  8 ++++----
 include/linux/mtd/hyperbus.h                 |  4 +---
 14 files changed, 37 insertions(+), 61 deletions(-)

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

