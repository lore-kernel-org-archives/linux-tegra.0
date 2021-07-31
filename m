Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F80C43214
	for <linux-tegra@archiver.kernel.org>; Sat, 31 Jul 2021 01:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F48661040
	for <linux-tegra@archiver.kernel.org>; Sat, 31 Jul 2021 01:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhGaBkR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jul 2021 21:40:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33236 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhGaBkR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:17 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA7FD51;
        Sat, 31 Jul 2021 03:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695610;
        bh=0ZJHvaI8W/1oEbU5Io9P1NcXxlZDJPRKMCm3FF4wyfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rKViABWsIMsFgDd6A9Q0k2Z/PFJFVDUM739bbzryqz5AZBhiaa7lVwj26WdXGucxF
         2t/8ssv8Q5ViQQiHXXHYh277zm3sDe9w/4tKOg7uguxLWgCRJAJ8aPKqQHDq1iRYqu
         1oSbPody7K5oTJy0YQ6avEdH5dJYVu4rMAymL5Bw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 2/9] drm/omap: Cast pointer to integer without generating warning
Date:   Sat, 31 Jul 2021 04:39:47 +0300
Message-Id: <20210731013954.11926-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 64-bit platforms, the compiler complains that casting a void pointer
to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
to fix this.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index f86e20578143..c05d3975cb31 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	priv->dss->mgr_ops_priv = priv;
 
 	soc = soc_device_match(omapdrm_soc_devices);
-	priv->omaprev = soc ? (unsigned int)soc->data : 0;
+	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
 	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
 
 	mutex_init(&priv->list_lock);
-- 
Regards,

Laurent Pinchart

