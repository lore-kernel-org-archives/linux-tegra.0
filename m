Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340C2C433F5
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12E5461AF7
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhJBXhk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 19:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhJBXhj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 19:37:39 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E6FC061714;
        Sat,  2 Oct 2021 16:35:52 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e12so1884616wra.4;
        Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wz/ee0QFf1zLzjYQvpsk8gV3BuqjIdVKipKwS9n+pgI=;
        b=K/zTxhdXTQysfV5PWX4oXKki31wkDTC9MgoHWPFDft+dweOOr+4vjue+nocqKqPUcK
         PMjE2Lu76QISmMx45veJyxwrnEepm1kcXuAkehF27rw4aXn77eq6Kp8fSXEQ9a0Y/fSe
         fYfl8Rz/NpTRxDeJYxfiPCHsZRgIYzR4SbPU2r61Cjmc7e87Gr9+j0EPE6CX61heeeeo
         ivM7wOkNqB6UkUMkBkTTAdLmeRUoU0MpHQuJIuKz7sv46G8Rccdb5mSMcKJIlhBJddDl
         xgE9JXsR6Nluuevivrmlhgf7Jf3mTDi6V22Y5loP4NU+hiOj//EmXuY+pSePwlcLX9+l
         SdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wz/ee0QFf1zLzjYQvpsk8gV3BuqjIdVKipKwS9n+pgI=;
        b=pJr63KPEzBd0QXhLLwpLcGxrPZZtbmRDj5oGzlI32wqObErlodL6+x3jJnhYQAETwI
         NxU35vU3DFbFRLPDeMaY2FoKtatd067sfwFJEQeatM0NrkzIrKKvrgPRFVP/W5xwpWB/
         QBN70oLYzygmGhbzvHp9K5Y6VDeNf155P6tgBVf9SnAEi5yxRtPCbirH2Od5VWjYj8Oo
         0F4ERSniEDTWUqYINW05f0mmAwtvMtNJ+TheUZ0lGY4+6F+FlsqoJKpR/I/RoHYtlzBs
         unbNOHDAK9HBky0njWm2yFxNX6ETZwVOVYgubBt83IHwtSr7NpvQx1EWy3gVGzQxdG/x
         waAA==
X-Gm-Message-State: AOAM5310jE0uaqfxdNMRhREYFq4zb9ASEvgNpLdhSJwGFEz94cmCLR6J
        7kdH1aCL5A7ICoUp0bWrmBc=
X-Google-Smtp-Source: ABdhPJxIyqhYmTBR0l+9XPy2tnEYfTVC1/MvoAGO+pHYpgzUgq3Mj/Ni+7Fhf6cjpKFVf5s6e3VmPA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr5551333wrs.65.1633217751392;
        Sat, 02 Oct 2021 16:35:51 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:35:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] drm/bridge: tc358768: Disable non-continuous clock mode
Date:   Sun,  3 Oct 2021 02:34:46 +0300
Message-Id: <20211002233447.1105-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Non-continuous clock mode doesn't work because driver doesn't support it
properly. The bridge driver programs wrong bitfields that are required by
the non-continuous mode (BTACNTRL1 register bitfields are swapped in the
code), but fixing them doesn't help.

Display panel of ASUS Transformer TF700T tablet supports non-continuous
mode and display doesn't work at all using that mode. There are no
device-trees that are actively using this DSI bridge in upstream yet,
so clearly the broken mode wasn't ever tested properly. It's a bit too
difficult to get LP mode working, hence let's disable the offending mode
for now and fall back to continuous mode.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 5b3f8723bd3d..cfceba5ef3b8 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -631,6 +631,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
+	unsigned long mode_flags = dsi_dev->mode_flags;
 	u32 val, val2, lptxcnt, hact, data_type;
 	const struct drm_display_mode *mode;
 	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
@@ -638,6 +639,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	const u32 internal_delay = 40;
 	int ret, i;
 
+	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+		dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
+		mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	}
+
 	tc358768_hw_enable(priv);
 
 	ret = tc358768_sw_reset(priv);
@@ -776,7 +782,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		val |= BIT(i + 1);
 	tc358768_write(priv, TC358768_HSTXVREGEN, val);
 
-	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
 
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
@@ -864,7 +870,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	if (!(dsi_dev->mode_flags & MIPI_DSI_MODE_LPM))
 		val |= TC358768_DSI_CONTROL_TXMD;
 
-	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= TC358768_DSI_CONTROL_HSCKMD;
 
 	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.32.0

