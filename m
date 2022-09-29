Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C893FC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 17:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiI2RFJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiI2RFI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 13:05:08 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10543635;
        Thu, 29 Sep 2022 10:05:01 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0668C6008836;
        Thu, 29 Sep 2022 18:05:00 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id jEmwgPGU0KD3; Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8038C6008772;
        Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1664471097;
        bh=YRT6lSNe5QX6TyDghu968Ip0/fGWKOZs9tdGpmcfqV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZS3BklhKjXtjIJK7mDbsEsH9X8s5Wk7Swz/R95oEMNm6bLhhj37piX3KPIpN3m1PX
         hoQtD/ISmrWrkyVpJuHkG3cm9mIyoZpjETAex0M248THnyN+g3jSn76M3sWNYhSTVg
         M+tgSTHeH31s6VHQMV6DW5sVBFZsrsorV1I6XZdc=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 58C73360086;
        Thu, 29 Sep 2022 18:04:57 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
Date:   Thu, 29 Sep 2022 18:05:00 +0100
Message-Id: <20220929170502.1034040-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In cases where the DSI module is left on by the bootloader
some panels may fail to initialize if the enable register is not cleared
before the panel's initialization sequence. Clear it and add an optional
device tree property to inform the driver if this is the case.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpu/drm/tegra/dsi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index de1333dc0d86..f66514379913 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -78,6 +78,8 @@ struct tegra_dsi {
 	unsigned int video_fifo_depth;
 	unsigned int host_fifo_depth;
 
+	bool enabled;
+
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
@@ -460,6 +462,8 @@ static void tegra_dsi_enable(struct tegra_dsi *dsi)
 	value |= DSI_POWER_CONTROL_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
 
+	dsi->enabled = true;
+
 	if (dsi->slave)
 		tegra_dsi_enable(dsi->slave);
 }
@@ -737,6 +741,8 @@ static void tegra_dsi_disable(struct tegra_dsi *dsi)
 	value &= ~DSI_POWER_CONTROL_ENABLE;
 	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
 
+	dsi->enabled = false;
+
 	if (dsi->slave)
 		tegra_dsi_disable(dsi->slave);
 
@@ -912,6 +918,27 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	if (dsi->enabled) {
+		if (dc) {
+			value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+			value &= ~DSI_ENABLE;
+			tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+			tegra_dc_commit(dc);
+		}
+
+		err = tegra_dsi_wait_idle(dsi, 100);
+		if (err < 0)
+			dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
+
+		/* disable DSI controller */
+		tegra_dsi_disable(dsi);
+	}
+
 	err = tegra_dsi_prepare(dsi);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to prepare: %d\n", err);
@@ -1573,6 +1600,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 
 	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
 
+	/* Check if the DSI module was left on by bootloader. */
+	dsi->enabled = of_property_read_bool(pdev->dev.of_node, "nvidia,boot-on");
 	/*
 	 * Assume these values by default. When a DSI peripheral driver
 	 * attaches to the DSI host, the parameters will be taken from
-- 
2.37.3

