Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CF9C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Dec 2021 10:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhLTKtE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Dec 2021 05:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhLTKtE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Dec 2021 05:49:04 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBB6C061574
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 02:49:04 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id b73so6593050wmd.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 02:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5D/hkos8PJ/G13IZnPAlfxo+Wk+tXMrwI3gVHpH+gg=;
        b=F2GytIGzLIh8p+IAbOm0y3M13EHSYTOq9RESBoLLVez1k6cZwig9b/qEGIKjbvZeoV
         F0/M9V7KAoIt2FCt+f3VbItrJNznx8NSzXcJMfHmf8E3TzLp5hdQSW5sgJiZheu5WNjT
         krxh5Jtn0cSkBpFJcO47rdcg3DfWc79TMgu8QXZZWZw0zJWbnRKlLzFSyygwTZAmUil/
         0BjAYoGpVAqRoQjUgn5IOz6M6xZuBega+s8tYwb7fI9HTrGQhndyeRCogVM2Qyurzb9m
         UljqCfaoYl2Z4A2b4gxRmNLvaKpOX3KVcAzHIJd9Bat/3CEEb890EeaYKeZEeKEl+WGQ
         bMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5D/hkos8PJ/G13IZnPAlfxo+Wk+tXMrwI3gVHpH+gg=;
        b=Y9aUAG/pa+13u8OrwnrrFwdvLXr47WdhTlXdXRQppcbV/yS/Bgb+C3QXVgBHPgkHdV
         UoRJKjrKFtdetLnkK21zbWx+tSoBmxo5RMzttyBZJsn0veIcfXRVacNecB1BGpG8QpUg
         YkKyfruhByvvA9DGeAC2ptqaWYQ+Q+WB2lMUafRAQvouTE7Lb/641z1dsZd8ZK7yfB0K
         10THhT1gjBQj2qx+cjs6R7QivNSgyHpb93UOWB44cYMRy+vMM/FwbSnVfBrw1qd4gZmO
         quSFYwsntEbV5t5VxfGtVedm98o9rdQBB3U3Y+eAZcCSQtunzqNGpXYE+aDSVGBGEsOH
         sfVw==
X-Gm-Message-State: AOAM531B9B1toCVxq55iTmXDLl+PpULsDMxJsrPvnaRuyfmHOydMZwjZ
        AYjfvvkFBOrpGi9oSKlK+2D81nBI0DmwVA==
X-Google-Smtp-Source: ABdhPJzDEuE2Ez64pbYVPw4/jB9o9WdThgXDn6WgFeqVxYKIG2+TY6pF8LqaUE6tslwtt6Zcs/IyVQ==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr20915040wme.85.1639997342660;
        Mon, 20 Dec 2021 02:49:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l26sm7815473wme.36.2021.12.20.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 02:49:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: dpaux: Populate AUX bus
Date:   Mon, 20 Dec 2021 11:48:54 +0100
Message-Id: <20211220104855.428290-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DPAUX hardware block exposes an DP AUX interface that provides
access to an AUX bus and the devices on that bus. Use the DP AUX bus
infrastructure that was recently introduced to probe devices on this
bus from DT.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/Kconfig | 1 +
 drivers/gpu/drm/tegra/dpaux.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8cf5aeb9db6c..201f5175ecfe 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -5,6 +5,7 @@ config DRM_TEGRA
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
+	select DRM_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..9da1edcdc835 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -18,6 +18,7 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
@@ -570,6 +571,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	list_add_tail(&dpaux->list, &dpaux_list);
 	mutex_unlock(&dpaux_lock);
 
+	err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
+	if (err < 0) {
+		dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

