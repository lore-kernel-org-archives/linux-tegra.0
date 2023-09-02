Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D37C83F2C
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Sep 2023 15:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjIBPaC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Sep 2023 11:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjIBPaC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Sep 2023 11:30:02 -0400
X-Greylist: delayed 461 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Sep 2023 08:29:59 PDT
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87C0E100
        for <linux-tegra@vger.kernel.org>; Sat,  2 Sep 2023 08:29:59 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id cSRzqoXOCUaEwcSSBqaS0o; Sat, 02 Sep 2023 17:22:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1693668148;
        bh=CcJIylx4XWMH4i7v7yeGHjUJhvGVgKvnNJDrOuGdvbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bV5n2JhbrP+dnNHvPqRj7xIc7xk8nYL0d3ORcvjfuJUcm/aJAnFjARdnxFau3J1LI
         apG7Baj8mgHspXAEcJHsT707PzwGGjS7C2XJcVIG9uIWCa7IoSjRwbD0k/lTU/4ZFf
         VKE1pOGrzh8ZGS+tOxjNur0CFosUloL6Do4Z6FgL99d3FjLxTPz6nVrw083gcUkVzC
         2HWW5JKLxuzvgcrrQ5OyyKTEtXmQbA72Zh/ABhjC8OohvC1KJmqg0Tu8zHA2Kc5Fb8
         v3aZ1zed/PlcHe8T20E1GQyx7MQDSIeLjTiLTjKOQsXLck9dQ6vlvNBWLCLZkq46MS
         8/YJ2NVIZY/mA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Sep 2023 17:22:28 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
        daniel@ffwll.ch, jonathanh@nvidia.com, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/6] drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
Date:   Sat,  2 Sep 2023 17:22:09 +0200
Message-Id: <ee4a15c9cd4b574a55cd67c30d2411239ba2cee9.1693667005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
References: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If an error occurs after calling pm_runtime_enable(), pm_runtime_disable()
should be called as already done in the remove function.

Fixes: ef8187d75265 ("drm/tegra: dsi: Implement runtime PM")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 70a77c75bfe1..0cf379e20d89 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1672,6 +1672,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 unregister:
+	pm_runtime_disable(&pdev->dev);
 	mipi_dsi_host_unregister(&dsi->host);
 mipi_free:
 	tegra_mipi_free(dsi->mipi);
-- 
2.34.1

